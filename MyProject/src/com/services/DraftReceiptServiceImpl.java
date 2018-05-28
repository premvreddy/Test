package com.services;

import java.util.Date;
import java.util.List;

import com.dao.DraftReceiptDao;
import com.dao.DraftReceiptDaoImpl;
import com.entities.DraftDepositEntity;


public class DraftReceiptServiceImpl implements DraftReceiptService{
	private DraftReceiptDao dao = null;
	@Override
	public DraftDepositEntity addUser(String bankname, String bankcode, String branchname, String branchcode, String userName,
			String memberid, String receiptno, Date receiptdate,
			String accoounttype, String accountno, String name, long amount,
			long cell, String remarks, int thousand, int fivehundered,
			int hundered, int fifty, int twenty, int ten, int five, int two,
			int one, int coins) {
		// TODO Auto-generated method stub
		dao = new DraftReceiptDaoImpl();
		DraftDepositEntity entity = new DraftDepositEntity();
		          entity.setAccoounttype(accoounttype);		 
		          entity.setAccountno(accountno);
		          entity.setAmount(amount);
		          entity.setBankcode(bankcode);
		          entity.setBankname(bankname);
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
	public List<DraftDepositEntity> getValidateInfo() {
		// TODO Auto-generated method stub
		dao=new DraftReceiptDaoImpl();
		return dao.getValidateInfo();
	}

}
