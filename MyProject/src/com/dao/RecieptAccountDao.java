package com.dao;

import java.util.Calendar;
import java.util.List;

import com.dto.RegularInfoDto;
import com.entities.ReceiptEntity;

public interface RecieptAccountDao {

	

	void addUser(ReceiptEntity entity);

	List<ReceiptEntity> getReceiptInfo(RegularInfoDto reqDto);

	
	String getAccountNameFromAccountNo(String accountcode, String entityName);
	
	String getLedgerAccountEntityAccountNameFromAccountNo(String accountcode);

	Long getCellFromAccountNo(String accountno);

	boolean insert(String receiptNo);

	List<ReceiptEntity> getRno(String receiptNo);

	boolean reject(String receiptNo);

	List<ReceiptEntity> getReceiptNo(Calendar todayDate);



}
