package com.dao;

import java.util.Calendar;
import java.util.List;

import com.dto.RegularInfoDto;
import com.entities.WithdrawEntity;

public interface WithdrawDao {

	void addUser(WithdrawEntity entity);

	List<WithdrawEntity> getWithdrawInfo(RegularInfoDto reqDto);

	String getAccountNameFromAccountNo(String accountno, String entityName);
	
	String getLedgerAccountEntityAccountNameFromAccountNo(String accountcode);

	Long getCellFromAccountno(String accountno);

	boolean insert(String withdrawNo);

	boolean reject(String withdrawNo);

	List<WithdrawEntity> getWithdrawNo(Calendar todayDate);


	

}
