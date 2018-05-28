package com.dao;


import java.util.List;

import com.entities.AshareEntity;
import com.entities.NominalShareEntity;
import com.entities.PersonalLoanEntity;
import com.entities.RegularShareEntity;


public interface PersonalLoanDao {

	public void addUser(PersonalLoanEntity entity);

	public List<NominalShareEntity> personalnominallist();

	public List<NominalShareEntity> PersonalNominalName(String memberid);

	public List<Integer> personalmember();

	public List<AshareEntity> PersonalashareList();

	public List<RegularShareEntity> PersonalRegularList();

	public List<RegularShareEntity> PersonalRegularName(String memberid);

	public List<AshareEntity> AShareName(String memberid);
	

}

