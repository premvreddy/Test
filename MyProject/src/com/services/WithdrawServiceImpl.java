package com.services;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.common.CommonUtils;
import com.dao.WithdrawDao;
import com.dao.WithdrawDaoImpl;
import com.dto.RegularInfoDto;
import com.entities.WithdrawEntity;

public class WithdrawServiceImpl implements WithdrawService{
	private WithdrawDao dao=null;
	@Override
	public WithdrawEntity addUser(String branchname, String branchcode,
			String userName, String memberid, String withdrawno,
			Date withdrawdate, String accoounttype, String accountno,
			String name, long amount, long cell, String remarks, int thousand,
			int fivehundered, int hundered, int fifty, int twenty, int ten,
			int five, int two, int one, int coins) {
		// TODO Auto-generated method stub
		dao = new WithdrawDaoImpl(); 
		WithdrawEntity entity = new WithdrawEntity();
        entity.setAccoounttype(accoounttype);		 
        entity.setAccountno(accountno);
        entity.setAmount(amount);
        //entity.setBankcode(bankcode);
       // entity.setBankname(bankname);
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
	public List<WithdrawEntity> getWithdrawInfo(RegularInfoDto reqDto) throws ParseException {
		// TODO Auto-generated method stub
		dao=new WithdrawDaoImpl();
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
		List<WithdrawEntity> infoDtos = dao.getWithdrawInfo(reqDto);
		reqDto.setFromDate(CommonUtils.format(sDate));
		reqDto.setToDate(CommonUtils.format(eDate));
		return infoDtos;
	}
	@Override
	public String getAccountNameFromAccountNo(String accountno, String entityName) {
		// TODO Auto-generated method stub
		dao = new WithdrawDaoImpl();
		return dao.getAccountNameFromAccountNo(accountno, entityName);
	}
	
	@Override
	public String getLedgerAccountEntityAccountNameFromAccountNo(String accountcode) {
		dao = new WithdrawDaoImpl();
		return dao.getLedgerAccountEntityAccountNameFromAccountNo(accountcode);
	}
	
	@Override
	public Long getCellFromAccountNo(String accountno) {
		// TODO Auto-generated method stub
		dao=new WithdrawDaoImpl();
		return dao.getCellFromAccountno(accountno);
	}
	@Override
	public boolean validatewithdraw(String withdrawNo) {
		// TODO Auto-generated method stub
		dao = new WithdrawDaoImpl();    
 		return dao.insert(withdrawNo);
	}
	@Override
	public boolean rejectwithdraw(String withdrawNo) {
		// TODO Auto-generated method stub
		dao = new WithdrawDaoImpl();    
 		return dao.reject(withdrawNo);
	}
	@Override
	public List<WithdrawEntity> getWithdrawNo(Calendar todayDate) {
		// TODO Auto-generated method stub
		dao = new WithdrawDaoImpl();
		return dao.getWithdrawNo(todayDate);
	}
	

}
