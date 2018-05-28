package com.dao;

import java.util.List;

import com.entities.DraftWithdrawEntity;


public interface DraftWithdrawDao {

	void addUser(DraftWithdrawEntity entity);

	List<DraftWithdrawEntity> getWithdrawInfo();

	
}
