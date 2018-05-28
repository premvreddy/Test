package com.dao;

import java.util.List;

import com.dto.RegularInfoDto;
import com.entities.FixedDepositEntity;


public interface FixedDepositDao {

	void adduser(FixedDepositEntity entity);



	List<FixedDepositEntity> getFixedInfo(RegularInfoDto reqDto);

	List<Integer> membershare();

	

	

	

	
	
	
	

}
