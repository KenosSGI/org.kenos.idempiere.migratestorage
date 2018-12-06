package org.kenos.idempiere.migratestorage.process;

import static org.compiere.model.I_AD_StorageProvider.COLUMNNAME_Method;
import static org.compiere.model.X_AD_StorageProvider.METHOD_Database;
import static org.compiere.model.X_AD_StorageProvider.METHOD_FileSystem;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import org.adempiere.model.GenericPO;
import org.compiere.model.ArchiveDB;
import org.compiere.model.ArchiveFileSystem;
import org.compiere.model.AttachmentDBSystem;
import org.compiere.model.AttachmentFileSystem;
import org.compiere.model.IArchiveStore;
import org.compiere.model.IAttachmentStore;
import org.compiere.model.MArchive;
import org.compiere.model.MAttachment;
import org.compiere.model.MStorageProvider;
import org.compiere.model.PO;
import org.compiere.model.Query;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;

/**
 * 	Migrate Attachments from/to DB/File System
 * 
 * 	@author Ricardo Santana <rsantana@kenos.com.br>
 */
public class MigrateStorageProvider extends SvrProcess 
{
	/**	Storage Folder         	*/
	private String p_AttachmentFolder 	= null;
	
	/**	Convert To	           	*/
	private String p_Method 			= null;
	private String p_MethodTo 			= null;
	
	/** Supported Methods		*/
	private final List<String> supportedMethods = Arrays.asList(new String[] { METHOD_Database, METHOD_FileSystem });
	
	/**
	 * 	Prepare the parameters
	 */
	@Override
	protected void prepare()
	{
		ProcessInfoParameter[] para = getParameter();
		for (int i = 0; i < para.length; i++)
		{
			String name = para[i].getParameterName();
			if (para[i].getParameter() == null)
				;
			else if (name.equals("File_Directory"))
			{
				p_AttachmentFolder = para[i].getParameter().toString();
			}
			else if (name.equals(COLUMNNAME_Method))
			{
				p_Method = para[i].getParameter().toString();
				p_MethodTo = para[i].getParameter_To().toString();
			}
		}
	}	//	prepare

	/**
	 * 	Perform process.
	 */
	@Override
	protected String doIt() throws Exception
	{
		//	Attachment Folder is mandatory
		if (p_AttachmentFolder == null)
			return "@Error@ @FillMandatory@ @File_Directory@";

		if (p_Method == null || p_MethodTo == null || p_Method == p_MethodTo)
			return "Unable to convert from " + p_Method + " to " + p_MethodTo;

		//	Check if the method is supported
		if (!supportedMethods.contains(p_Method))
			return "Method not supported: " + p_Method;
		if (!supportedMethods.contains(p_MethodTo))
			return "Method not supported: " + p_MethodTo;
		
		//	Must end with file separator
		if (!p_AttachmentFolder.endsWith(File.separator))
			p_AttachmentFolder = p_AttachmentFolder + File.separator;
		
		IAttachmentStore asFrom 	= null;
		IAttachmentStore asTo 		= null;
		IArchiveStore arsFrom 		= null;
		IArchiveStore arsTo 		= null;
		MStorageProvider spFrom 	= null;
		MStorageProvider spTo 		= null;
		String title				= null;
		
		//	From
		if (METHOD_Database.equals(p_Method))
		{
			//	Attachment
			asFrom = new AttachmentDBSystem();
			spFrom = new MStorageProvider(getCtx(), 0, null);
			spFrom.setMethod(METHOD_Database);
			title = "zip";
			
			//	Archive
			arsFrom = new ArchiveDB();
		}
		else if (METHOD_FileSystem.equals(p_Method))
		{
			//	Attachment
			asFrom = new AttachmentFileSystem();
			spFrom = new MStorageProvider(getCtx(), 0, null);
			spFrom.setMethod(METHOD_FileSystem);
			spFrom.setFolder(p_AttachmentFolder);
			title = "xml";
			
			//	Archive
			arsFrom = new ArchiveFileSystem();
		}
		else
			throw new Exception ("Not implemented yet");
		
		//	To
		if (METHOD_Database.equals(p_MethodTo))
		{
			asTo = new AttachmentDBSystem();
			spTo = new MStorageProvider(getCtx(), 0, null);
			spTo.setMethod(METHOD_Database);
			
			//	Archive
			arsTo = new ArchiveDB();
		}
		else if (METHOD_FileSystem.equals(p_MethodTo))
		{
			asTo = new AttachmentFileSystem();
			spTo = new MStorageProvider(getCtx(), 0, null);
			spTo.setMethod(METHOD_FileSystem);
			spTo.setFolder(p_AttachmentFolder);
			
			//	Archive
			arsTo = new ArchiveFileSystem();
		}
		else
			throw new Exception ("Not implemented yet");
		
		int countAttachments = 0;
		int countArchives = 0;
		
		this.statusUpdate("Migrating attachments...");
		
		//	List all Attachments
		List<MAttachment> attachments = new Query (getCtx(), MAttachment.Table_Name, "Title=? AND AD_Client_ID=?", null).setParameters(title, getAD_Client_ID()).list();
		for (MAttachment attachment : attachments)
		{
			//	Avoid those who are empty
			if (attachment == null)
				continue;
			
			//	Load from DB
			asFrom.loadLOBData(attachment, spFrom);
			
			//	Avoid those who are empty
			if (attachment.getEntries() == null
					|| attachment.getEntries().length == 0)
				continue;

			//	Create metadata
			asTo.save(attachment, spTo);
			
			//	Save metadata using Generic PO to avoid problems with beforeSave overriding configs
			PO po = new GenericPO(MAttachment.Table_Name, getCtx(), attachment.getAD_Attachment_ID(), attachment.get_TrxName());
			po.set_ValueNoCheck(MAttachment.COLUMNNAME_Title, attachment.getTitle());
			po.set_ValueNoCheck(MAttachment.COLUMNNAME_BinaryData, attachment.getBinaryData());
			if (po.save())
				countAttachments++;
			
			//	Status
			if (countAttachments % 10 == 0)
				this.statusUpdate(countAttachments + " attachments processed...");
		}
		
		this.statusUpdate("Migrating archives...");
		
		//	List all Archives
		List<MArchive> archives = new Query (getCtx(), MArchive.Table_Name, "AD_Client_ID=?", null).setParameters(getAD_Client_ID()).list();
		for (MArchive archive : archives)
		{
			//	Avoid those who are empty
			if (archive == null)
				continue;
			
			//	Load from DB
			byte[] data = arsFrom.loadLOBData(archive, spFrom);
			if (data == null)
				continue;
			
			//	Create metadata
			arsTo.save(archive, spTo, data);
			
			//	Save metadata using Generic PO to avoid problems with beforeSave overriding configs
			PO po = new GenericPO(MArchive.Table_Name, getCtx(), archive.getAD_Archive_ID(), archive.get_TrxName());
			po.set_ValueNoCheck(MArchive.COLUMNNAME_BinaryData, archive.getByteData());
			if (po.save())
				countArchives++;
			
			//	Status
			if (countArchives % 10 == 0)
				this.statusUpdate(countAttachments + " archives processed...");
		}
		
		this.statusUpdate(countAttachments + "Done...");
		
		this.addLog(countAttachments + " attachment(s) migrated from " + p_Method + " to " + p_MethodTo);
		this.addLog(countArchives + " archive(s) migrated from " + p_Method + " to " + p_MethodTo);
		
		return "@Success@";
	}	//	doIt
}	//	MigrateAttachments
