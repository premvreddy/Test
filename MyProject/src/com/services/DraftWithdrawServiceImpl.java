package com.services;

import java.util.Date;
import java.util.List;

import com.dao.DraftWithdrawDao;
import com.dao.DraftWithdrawDaoImpl;
import com.entities.DraftWithdrawEntity;

public class DraftWithdrawServiceImpl implements DraftWithdrawService {
	private DraftWithdrawDao dao = null;
	@Override
	public DraftWithdrawEntity addUser(String bankname, String bankcode,String branchname, String branchcode,
			String userName, String memberid, String withdrawno,
			Date withdrawdate, String accoounttype, String accountno,
			String name, long amount, long cell, String remarks, int thousand,
			int fivehundered, int hundered, int fifty, int twenty, int ten,
			int five, int two, int one, int coins) {
		// TODO Auto-generated method stub
		dao = new DraftWithdrawDaoImpl(); 
		DraftWithdrawEntity entity = new DraftWithdrawEntity();
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
        entity.setWithdrawno(withdrawno);
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
	public List<DraftWithdrawEntity> getWithdrawInfo() {
		// TODO Auto-generated method stub
		dao=new DraftWithdrawDaoImpl();
		return dao.getWithdrawInfo();
	}
}
