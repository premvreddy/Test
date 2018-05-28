package com.dao;

import java.util.List;

import com.entities.LedgerGroupEntity;

public interface LedgerGroupDao {

	void addUser(LedgerGroupEntity entity);

	List<LedgerGroupEntity> listLedger();	
	
	String getNameFromSubGroup(String groupname);

}
