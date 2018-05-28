package com.services;

import java.util.List;

import com.entities.LedgerGroupEntity;


public interface LedgerGroupService {
		
	LedgerGroupEntity addUser(String branchname,String branchcode,String groupname,String subgroupname,String maingroup,String groupcode);

	List<LedgerGroupEntity> getLedgerList();

	String getNameFromSubGroup(String groupname);
}
