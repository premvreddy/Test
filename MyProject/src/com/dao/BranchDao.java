package com.dao;

import java.util.List;

import com.entities.BranchEntity;

public interface BranchDao {

	public void addUser(BranchEntity entity);
	
	List<BranchEntity> listBranch();	

}
