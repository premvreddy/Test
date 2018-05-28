package com.dao;

import java.util.List;

import com.entities.DraftContraEntity;


public interface ContraDao {

	void addUser(DraftContraEntity entity);

	List<DraftContraEntity> getContraInfo();

	void deletecontra(int id, Class<DraftContraEntity> class1);

	

}
