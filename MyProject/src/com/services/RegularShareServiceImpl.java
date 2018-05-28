package com.services;



import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.common.CommonUtils;
import com.dao.RegularShareDao;
import com.dao.RegularShareDaoImpl;
import com.dto.RegularInfoDto;
import com.entities.RegularShareEntity;


public class RegularShareServiceImpl implements RegularShareService {

	private RegularShareDao dao = null;
	@Override
	public RegularShareEntity addUser(String bankname,String bankcode,String memberid,String memberid1,String accountno, String userName,String password,String name,String gender,int age,long phone,long res,long cell,String qualification,
			String caste,String occupation,String address,String paddress,long fsalary,long fbusiness,long frent,long fsource,String afhname,String idoccupation,String idaddress,
			String omembership,String ipapplicant,String membersociety,String nmname,String relation,String nmaddress,String name1,String accountno1,String name2,String accountno2, long shareamount, long openingbalance,
			 String obtype,String subgroup,String maingroup,Date accountopendate,String dob,String pannumber,String aadhaarnumber,String flatno,String caddress2,String landmark,String city,String district,String state,String cpin,
			 String pflatno,String paddress2,String plandmark,String pcity,String pdistrict,String pstate,String ppin) {
		// TODO Auto-generated method stub
				dao = new RegularShareDaoImpl();
				RegularShareEntity entity = new RegularShareEntity();
				entity.setBankname(bankname);
				entity.setBankcode(bankcode);
				entity.setMemberid(memberid);
				entity.setMemberid1(memberid1);
				System.out.println("inside add user service" +memberid1 );
				entity.setAccountno(accountno);
				entity.setUserName(userName);
				entity.setPassword(password);
				entity.setName(name);
				entity.setGender(gender);
				entity.setAge(age);
				entity.setPhone(phone);
				entity.setRes(res);
				entity.setCell(cell);
				entity.setQualification(qualification);
				entity.setCaste(caste);
				entity.setOccupation(occupation);
				entity.setAddress(address);
				entity.setPaddress(paddress);
				entity.setFsalary(fsalary);
				entity.setFbusiness(fbusiness);
				entity.setFrent(frent);
				entity.setFsource(fsource);
				entity.setAfhname(afhname);
				entity.setIdoccupation(idoccupation);
				entity.setIdaddress(idaddress);
				entity.setOmembership(omembership);
				entity.setIpapplicant(ipapplicant);
				entity.setMembersociety(membersociety);
				entity.setNmname(nmname);
				entity.setRelation(relation);
				entity.setNmaddress(nmaddress);
				entity.setName1(name1);
				entity.setAccountno1(accountno1);
				entity.setName2(name2);
				entity.setAccountno2(accountno2);
				entity.setShareamount(shareamount);
				entity.setOpeningbalance(openingbalance);
				entity.setObtype(obtype);
				entity.setSubgroup(subgroup);
				entity.setMaingroup(maingroup);
				entity.setDate(new Date());
				entity.setDob(dob);
				entity.setPannumber(pannumber);
				entity.setAadhaarnumber(aadhaarnumber);
				entity.setFlatno(flatno);
				entity.setCaddress2(caddress2);
				entity.setLandmark(landmark);
				entity.setCity(city);
				entity.setDistrict(district);
				entity.setState(state);
				entity.setCpin(cpin);
				entity.setPflatno(pflatno);
				entity.setPaddress2(paddress2);
				entity.setPlandmark(plandmark);
				entity.setPcity(pcity);
				entity.setPdistrict(pdistrict);
				entity.setPstate(pstate);
				entity.setPpin(ppin);
				
				dao.addUser(entity);
				System.out.println("inside service "+entity);
				return entity;
	}
	
	/*@Override
	public List<RegularShareEntity> getShareList() {
		dao = new RegularShareDaoImpl();
		return dao.listRegularShare();
	}*/

	@Override
	public List<RegularShareEntity> getRegularInfo(RegularInfoDto reqDto) throws ParseException {
		// TODO Auto-generated method stub
		dao=new RegularShareDaoImpl();
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
		List<RegularShareEntity> infoDtos = dao.getRegularInfo(reqDto);
		reqDto.setFromDate(CommonUtils.format(sDate));
		reqDto.setToDate(CommonUtils.format(eDate));
		return infoDtos;
	}

	@Override
	public void updateRegular(int slno, String bankname, String bankcode, String memberid, String memberid1,String accountno,
			String userName, String password, String name, String gender, int age, long phone, long res, long cell,
			String qualification, String caste, String occupation, String address, String paddress, long fsalary,
			long fbusiness, long frent, long fsource, String afhname, String idoccupation, String idaddress,
			String omembership, String ipapplicant, String membersociety, String nmname, String relation,
			String nmaddress, String name1, String accountno1, String name2, String accountno2, long shareamount,
			long openingbalance, String obtype, String subgroup, String maingroup) {
		// TODO Auto-generated method stub
		dao = new RegularShareDaoImpl();
		RegularShareEntity entity = new RegularShareEntity();
		entity.setSlno(slno);
		entity.setBankname(bankname);
		entity.setBankcode(bankcode);
		entity.setMemberid(memberid);
		entity.setMemberid1(memberid1);
		//System.out.println("inside service SET"+memberid1);
		entity.setAccountno(accountno);
		entity.setUserName(userName);
		entity.setPassword(password);
		entity.setName(name);
		entity.setGender(gender);
		entity.setAge(age);
		entity.setPhone(phone);
		entity.setRes(res);
		entity.setCell(cell);
		entity.setQualification(qualification);
		entity.setCaste(caste);
		entity.setOccupation(occupation);
		entity.setAddress(address);
		entity.setPaddress(paddress);
		entity.setFsalary(fsalary);
		entity.setFbusiness(fbusiness);
		entity.setFrent(frent);
		entity.setFsource(fsource);
		entity.setAfhname(afhname);
		entity.setIdoccupation(idoccupation);
		entity.setIdaddress(idaddress);
		entity.setOmembership(omembership);
		entity.setIpapplicant(ipapplicant);
		entity.setMembersociety(membersociety);
		entity.setNmname(nmname);
		entity.setRelation(relation);
		entity.setNmaddress(nmaddress);
		entity.setName1(name1);
		entity.setAccountno1(accountno1);
		entity.setName2(name2);
		entity.setAccountno2(accountno2);
		entity.setShareamount(shareamount);
		entity.setOpeningbalance(openingbalance);
		entity.setObtype(obtype);
		entity.setSubgroup(subgroup);
		entity.setMaingroup(maingroup);
		
		dao.update(slno, entity);
	}
	@Override
	public void deleteregularshare(int slno, Class<RegularShareEntity> class1) {
		// TODO Auto-generated method stub
		dao = new RegularShareDaoImpl();
		RegularShareEntity entity = new RegularShareEntity();
		entity.setSlno(slno);
		dao.deleteregularshares(slno, class1);
		
	}

	@Override
	public List<Integer> getmember() {
		dao = new RegularShareDaoImpl();
		return dao.membershare();
	}

	@Override
	public List<RegularShareEntity> getRegularInfos(RegularInfoDto reqDto) {
		
		return null;
	}
	
}







