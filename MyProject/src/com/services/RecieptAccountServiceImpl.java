package com.services;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.common.CommonUtils;
import com.dao.RecieptAccountDao;
import com.dao.RecieptAccountDaoImpl;
import com.dto.RegularInfoDto;
import com.entities.ReceiptEntity;


public class RecieptAccountServiceImpl implements RecieptAccountService{
	private RecieptAccountDao dao = null;

	@Override
	public ReceiptEntity addUser(String branchname, String branchcode,
			String userName, String memberid, String receiptno, Date receiptdate,
			String accoounttype, String accountno, String name, long amount,
			long cell, String remarks, int thousand, int fivehundered,
			int hundered, int fifty, int twenty, int ten, int five, int two,
			int one, int coins) {
		dao = new RecieptAccountDaoImpl();
		ReceiptEntity entity = new ReceiptEntity();
		          entity.setAccoounttype(accoounttype);		 
		          entity.setAccountno(accountno);
		          entity.setAmount(amount);
//		          entity.setBankcode(bankcode);
//		          entity.setBankname(bankname);
		          entity.setBranchname(branchname);
		          entity.setBranchcode(branchcode);
		          entity.setCell(cell);
		          entity.setCoins(coins);
		          entity.setDate(new Date());
		          entity.setFifty(fifty);
		          entity.setFive(five);
		          entity.setFivehundered(fivehundered);
		          entity.setHundered(hundered);
		          entity.setMemberid(memberid);
		          entity.setName(name);
		          entity.setOne(one);
		          entity.setReceiptno(receiptno);
		          entity.setRemarks(remarks);
		          entity.setThousand(thousand);
		          entity.setTen(ten);
		          entity.setTwenty(twenty);
		          entity.setTwo(two);
		          entity.setUserName(userName);

		dao.addUser(entity);
		
		return entity;
	}

	

	

	@Override
	public String getAccountNameFromAccountNo(String accountno, String entityName) {
		dao = new RecieptAccountDaoImpl();
		/*ReceiptEntity entity=new ReceiptEntity();*/
		return dao.getAccountNameFromAccountNo(accountno, entityName);
		
		
	}
	
	
	@Override
	public String getLedgerAccountEntityAccountNameFromAccountNo(String accountcode) {
		dao = new RecieptAccountDaoImpl();
		return dao.getLedgerAccountEntityAccountNameFromAccountNo(accountcode);
	}

	@Override
	public List<ReceiptEntity> getReceiptInfo(RegularInfoDto reqDto) throws ParseException {
		// TODO Auto-generated method stub
		dao=new RecieptAccountDaoImpl();
		Date sDate = null;
		Date eDate = null;
		if(reqDto.getFromDate() == null || reqDto.getFromDate().trim().length() == 0) {
			Calendar c = Calendar.getInstance();   // this takes current date
		    c.set(Calendar.DAY_OF_MONTH, 1);
		    sDate = c.getTime();
			c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    eDate = new Date();
		
		} else {
			sDate = CommonUtils.parse(reqDto.getFromDate());
			eDate = CommonUtils.parse(reqDto.getToDate());
		}
		reqDto.setFromDate(CommonUtils.dbDateFormat(sDate));
		reqDto.setToDate(CommonUtils.dbDateFormat(eDate));
		List<ReceiptEntity> infoDtos = dao.getReceiptInfo(reqDto);
		reqDto.setFromDate(CommonUtils.format(sDate));
		reqDto.setToDate(CommonUtils.format(eDate));
		return infoDtos;
	}



	@Override
	public boolean validatereceipt(String receiptNo) {
		dao = new RecieptAccountDaoImpl();    
 		return dao.insert(receiptNo);
	}



	@Override
	public List<ReceiptEntity> getReceiptInfo(String recepitNo) {
		// TODO Auto-generated method stub
		return null;
	}


	



	@Override
	public Long getCellFromAccountNo(String accountno) {
		// TODO Auto-generated method stub
		dao = new RecieptAccountDaoImpl();
		return dao.getCellFromAccountNo(accountno);
	}



	@Override
	public boolean rejectreceipt(String receiptNo) {
		// TODO Auto-generated method stub
		dao = new RecieptAccountDaoImpl();    
 		return dao.reject(receiptNo);
	}



	@Override
	public List<ReceiptEntity> getReceiptNo(Calendar todayDate) {
		// TODO Auto-generated method stub
		dao = new RecieptAccountDaoImpl();
		return dao.getReceiptNo(todayDate);
	}

	
}
