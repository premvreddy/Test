package com.dao;

import java.util.List;

import com.entities.NewContraEntity;


public interface NewContraDao {

	void addUser(NewContraEntity entity);

	List<NewContraEntity> getContraInfo();

	void deletecontra(int id, Class<NewContraEntity> class1);

	

}
