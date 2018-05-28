package com.services;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.dto.RegularInfoDto;
import com.entities.ReceiptEntity;

public interface RecieptAccountService {

	

	ReceiptEntity addUser(String branchname,String branchcode, String username,String memberid, String receiptno, Date receiptdate,
			String accoounttype, String accountno, String name, long amount,
			long cell, String remarks, int thousand, int fivehundered,
			int hundered, int fifty, int twenty, int ten, int five, int two,
			int one, int coins);

	List<ReceiptEntity> getReceiptInfo(RegularInfoDto reqDto) throws ParseException;

	String getAccountNameFromAccountNo(String accountno, String entityName);
	
	String getLedgerAccountEntityAccountNameFromAccountNo(String accountcode);

	boolean validatereceipt(String receiptNo);

	Long getCellFromAccountNo(String accountno);

	List<ReceiptEntity> getReceiptInfo(String recepitNo);

	boolean rejectreceipt(String receiptNo);

	List<ReceiptEntity> getReceiptNo(Calendar todayDate);

	

	



		
}
