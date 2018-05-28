package com.services;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.common.CommonUtils;
import com.dao.FixedDepositDao;
import com.dao.FixedDepositDaoImpl;
import com.dto.RegularInfoDto;
import com.entities.FixedDepositEntity;


public class FixedDepositServiceImpl implements FixedDepositService{
	
	private FixedDepositDao dao= null;
	@Override
	public FixedDepositEntity adduser( String tDate,String memberid, String deposittype, String accountno, String fdaccountold, String name, String paddress, String occupation, String husbandname, int age, String resaddress, long resno, long mobileno, long aadharno, String panno, String deposiamount, String deposiperiod, String depositinterest, String dob, int minorage, String nmname, String nmaddress, String details, Date accountopendate) {
		
		dao= new FixedDepositDaoImpl();
		FixedDepositEntity entity= new FixedDepositEntity();
		entity.settDate(tDate);
		entity.setMemberid(memberid);
		entity.setDeposittype(deposittype);
		entity.setAccountno(accountno);
		entity.setFdaccountold(fdaccountold);
		entity.setName(name);
		entity.setPaddress(paddress);
		entity.setOccupation(occupation);
		entity.setHusbandname(husbandname);
		entity.setAge(age);
		entity.setResaddress(resaddress);
		entity.setResno(resno);
		entity.setMobileno(mobileno);
		entity.setAadharno(aadharno);
		entity.setPanno(panno);
		entity.setDeposiamount(deposiamount);
		entity.setDeposiperiod(deposiperiod);
		entity.setDepositinterest(depositinterest);
		entity.setDob(dob);
		entity.setMinorage(minorage);
		entity.setNmname(nmname);
		entity.setNmaddress(nmaddress);
		entity.setDetails(details);
		entity.setDate(new Date());
		dao.adduser(entity);
	
		return entity;
	}
	
	@Override
	public List<FixedDepositEntity> getFixedInfo(RegularInfoDto reqDto) throws ParseException {
			
		dao=new FixedDepositDaoImpl();
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
		List<FixedDepositEntity> infoDtos = dao.getFixedInfo(reqDto);
		reqDto.setFromDate(CommonUtils.format(sDate));
		reqDto.setToDate(CommonUtils.format(eDate));
		return infoDtos;
	}
	@Override
	public List<Integer> getmember() {
		// TODO Auto-generated method stub
		return null;
	}
	
	


}
