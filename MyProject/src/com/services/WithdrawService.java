package com.services;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.dto.RegularInfoDto;
import com.entities.WithdrawEntity;

public interface WithdrawService{

	WithdrawEntity addUser( String branchname, String branchcode, String userName,
			String memberid, String withdrawno, Date withdrawdate,
			String accoounttype, String accountno, String name, long amount,
			long cell, String remarks, int thousand, int fivehundered,
			int hundered, int fifty, int twenty, int ten, int five, int two,
			int one, int coins);

	List<WithdrawEntity> getWithdrawInfo(RegularInfoDto reqDto) throws ParseException;

	String getAccountNameFromAccountNo(String accountno, String entityName);
	
	String getLedgerAccountEntityAccountNameFromAccountNo(String accountcode);

	Long getCellFromAccountNo(String accountno);

	boolean validatewithdraw(String withdrawNo);

	boolean rejectwithdraw(String withdrawNo);

	List<WithdrawEntity> getWithdrawNo(Calendar todayDate);

	

}
