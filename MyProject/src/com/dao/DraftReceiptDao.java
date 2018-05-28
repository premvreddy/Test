package com.dao;

import java.util.List;

import com.entities.DraftDepositEntity;


public interface DraftReceiptDao {

	void addUser(DraftDepositEntity entity);

	List<DraftDepositEntity> getValidateInfo();

	

}
