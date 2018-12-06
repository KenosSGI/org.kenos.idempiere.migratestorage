package org.kenos.idempiere.migratestorage.process;

import org.adempiere.base.IProcessFactory;
import org.compiere.process.ProcessCall;

/**
 * 		Process Factory
 * 
 * 	@author Ricardo Santana (Kenos, www.kenos.com.br)
 *	@version $Id: ProcessFactory.java, v1.0 2018/12/06 11:53:32 PM, ralexsander Exp $
 */
public class ProcessFactory implements IProcessFactory
{
	@Override
	public ProcessCall newProcessInstance (String className)
	{
		if (MigrateStorageProvider.class.getName().equals(className))
			return new MigrateStorageProvider();
		return null;
	}	//	newProcessInstance
}	//	ProcessFactory
