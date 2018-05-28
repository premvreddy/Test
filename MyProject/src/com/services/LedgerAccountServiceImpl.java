package com.services;


import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.common.CommonUtils;
import com.dao.LedgerAccountDao;
import com.dao.LedgerAccountDaoImpl;
import com.dto.LedgerInfoDto;
import com.entities.AshareEntity;
import com.entities.LedgerAccountEntity;
import com.entities.LedgerDetailEntity;
import com.entities.MemberDetailsEntity;
import com.entities.NominalShareEntity;
import com.entities.RegularShareEntity;


public class LedgerAccountServiceImpl implements LedgerAccountService {
	private LedgerAccountDao dao = null;
	@Override
	public LedgerAccountEntity addUser(String branchname, String branchcode, String subgroupname, String maingroup,
			String accountname, String accountcode, long openingbalance, String type) {
		// TODO Auto-generated method stub
				dao = new LedgerAccountDaoImpl();
				LedgerAccountEntity entity = new LedgerAccountEntity();
				entity.setBranchname(branchname);
				entity.setBranchcode(branchcode);
				entity.setSubgroupname(subgroupname);
				entity.setMaingroup(maingroup);
				entity.setAccountname(accountname);
				entity.setAccountcode(accountcode);
				entity.setOpeningbalance(openingbalance);
				entity.setType(type);
				
				dao.addUser(entity);
				
				return entity;
	}
	@Override
	public List<LedgerAccountEntity> getLedgerAccount() {
		dao = new LedgerAccountDaoImpl();
		return dao.accountLedger();
	}
	@Override
	public void updateLedger(int id, String branchname, String branchcode, String subgroupname, String maingroup,
			String accountname, String accountcode, long openingbalance, String type) {
		// TODO Auto-generated method stub
		dao = new LedgerAccountDaoImpl();
		LedgerAccountEntity entity = new LedgerAccountEntity();
		entity.setId(id);
		entity.setBranchname(branchname);
		entity.setBranchcode(branchcode);
		entity.setSubgroupname(subgroupname);
		entity.setMaingroup(maingroup);
		entity.setAccountname(accountname);
		entity.setAccountcode(accountcode);
		entity.setOpeningbalance(openingbalance);
		entity.setType(type);

		dao.update(id, entity);
		
	}
	@Override
	public void deleteledgeraccount(int id, Class<LedgerAccountEntity> class1) {
		// TODO Auto-generated method stub
		dao = new LedgerAccountDaoImpl();
		LedgerAccountEntity entity = new LedgerAccountEntity();
		entity.setId(id);
		dao.deleteledgeracc(id, class1);
	}
	@Override
	public List<LedgerDetailEntity> getLedgerInfo(LedgerInfoDto reqDto,String accountno) throws ParseException {
		// TODO Auto-generated method stub
		dao=new LedgerAccountDaoImpl();
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
		List<LedgerDetailEntity> infoDtos = dao.getLedgerInfo(reqDto,accountno);
		reqDto.setFromDate(CommonUtils.format(sDate));
		reqDto.setToDate(CommonUtils.format(eDate));
		return infoDtos;
	}
	@Override
	public List<RegularShareEntity> getLedgerDetailList() {
		// TODO Auto-generated method stub
		dao = new LedgerAccountDaoImpl();
		return dao.getLedgerDetailList();
	}
	@Override
	public List<LedgerDetailEntity> getNameFromAccount(String accountno) {
		// TODO Auto-generated method stub
		dao=new LedgerAccountDaoImpl();
		return dao.getNameFromAccount(accountno);
	}
	
	@Override
	public List<NominalShareEntity> getNominalShareNameFromAccount(String accountno) {
		// TODO Auto-generated method stub
		dao=new LedgerAccountDaoImpl();
		return dao.getNominalShareNameFromAccount(accountno);
	}
	

	@Override
	public List<AshareEntity> getAshareNameFromAccount(String accountno) {
		// TODO Auto-generated method stub
		dao=new LedgerAccountDaoImpl();
		return dao.getAshareNameFromAccount(accountno);
	}
	
	@Override
	public List<LedgerAccountEntity> getLedgerAccountNameFromAccount(String accountcode) {
		// TODO Auto-generated method stub
		dao=new LedgerAccountDaoImpl();
		return dao.getLedgerAccountNameFromAccount(accountcode);
	}
	
	@Override
	public List<LedgerAccountEntity> getNameFromAccount1() {
		// TODO Auto-generated method stub
		dao=new LedgerAccountDaoImpl();
		return dao.getNameFromAccount1();
	}
	
	@Override
	public List<MemberDetailsEntity> getMemberInfo(LedgerInfoDto reqDto,
			String accountno) throws ParseException {
		dao =new LedgerAccountDaoImpl();
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
		List<MemberDetailsEntity> infoDtos = dao.getmemberinfo(reqDto,accountno);
		reqDto.setFromDate(CommonUtils.format(sDate));
		reqDto.setToDate(CommonUtils.format(eDate));
		return infoDtos;
	}
	@Override
	public List<RegularShareEntity> getNameacFromAccount(String accountno) {
		// TODO Auto-generated method stub
		dao=new LedgerAccountDaoImpl();
		return dao.getNameacFromAccount(accountno);
	}
	public List<LedgerAccountEntity> getLedgerAccountList() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<NominalShareEntity> nominalShareList() {
		dao = new LedgerAccountDaoImpl();
		return dao.nominalShareList();
	}
	
	@Override
	public List<AshareEntity> ashareList() {
		dao = new LedgerAccountDaoImpl();
		return dao.ashareList();
	}
		
}
