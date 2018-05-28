package com.services;

import java.util.Date;
import java.util.List;

import com.entities.DraftWithdrawEntity;


public interface DraftWithdrawService {

	DraftWithdrawEntity addUser(String bankname, String bankcode,String branchname, String branchcode,
			String userName, String memberid, String withdrawno,
			Date withdrawdate, String accoounttype, String accountno,
			String name, long amount, long cell, String remarks, int thousand,
			int fivehundered, int hundered, int fifty, int twenty, int ten,
			int five, int two, int one, int coins);

	List<DraftWithdrawEntity> getWithdrawInfo();

	
	

}
