package com.services;

import java.util.List;

import com.dao.PersonalLoanDao;
import com.dao.PersonalLoanDaoImpl;
import com.entities.AshareEntity;
import com.entities.NominalShareEntity;
import com.entities.PersonalLoanEntity;
import com.entities.RegularShareEntity;

public class PersonalLoanServiceImpl implements PersonalLoanService {

	private PersonalLoanDao dao = null;

	@Override
	public PersonalLoanEntity addUser(String memberid, String loantype, String loanaccountno, String loannumber,
			String name, String husbandname, int age, String occupation, String phone, String residentialnumber,
			String cell, String memberofcommittee, String belongsSCST, String monthlyincome,
			String incomecertificate, String immovableproperty, String estimatedproperty, String loanduration,
			String loanpurpose, String memberofsociety, long officeaddress, String paddress, String memidone,
			String custnameone, String husbnameone, int ageone, String resnumberone, String mobnumberone,
			String membercommitteeone, String SCSTone, String mincomeone, String salaryone, String immovablepropsone,
			String estimatedpropsone, long officeaddsone, String resaddressone, String memberidstwo,
			String customernamestwo, String husbandnamestwo, int agestwo, String resnostwo, String mobilenostwo,
			String committeestwo, String SCSTtwo, String mincomestwo, String Salarystwo, String ImmovablePropertystwo,
			String estimatedpropstwo, long officestwo, String resdstwo) {

		dao = new PersonalLoanDaoImpl();

		PersonalLoanEntity entity = new PersonalLoanEntity();
		entity.setMemberid(memberid);
		entity.setLoantype(loantype);
		entity.setLoanaccountno(loanaccountno);
		entity.setLoannumber(loannumber);
		entity.setName(name);
		entity.setHusbandname(husbandname);
		entity.setAge(age);
		entity.setOccupation(occupation);
		entity.setPhone(phone);
		entity.setResidentialnumber(residentialnumber);
		entity.setCell(cell);
		entity.setImmovableproperty(immovableproperty);
		entity.setMemberofcommittee(memberofcommittee);
		entity.setBelongsSCST(belongsSCST);
		entity.setMonthlyincome(monthlyincome);
		entity.setIncomecertificate(incomecertificate);
		entity.setEstimatedproperty(estimatedproperty);
		entity.setLoanduration(loanduration);
		entity.setLoanpurpose(loanpurpose);
		entity.setMemberofsociety(memberofsociety);
		entity.setOfficeaddress(officeaddress);
		entity.setPaddress(paddress);
		entity.setMemidone(memidone);
		entity.setCustnameone(custnameone);
		entity.setHusbnameone(husbnameone);
		entity.setAgeone(ageone);
		entity.setResnumberone(resnumberone);
		entity.setMobnumberone(mobnumberone);
		entity.setMembercommitteeone(membercommitteeone);
		entity.setSCSTone(SCSTone);
		entity.setMincomeone(mincomeone);
		entity.setSalaryone(salaryone);
		entity.setImmovablepropsone(immovablepropsone);
		entity.setEstimatedpropsone(estimatedpropsone);
		entity.setOfficeaddsone(officeaddsone);
		entity.setResaddressone(resaddressone);
		entity.setMemberidstwo(memberidstwo);
		entity.setCustomernamestwo(customernamestwo);
		entity.setHusbandnamestwo(husbandnamestwo);
		entity.setAgestwo(agestwo);
		entity.setResnostwo(resnostwo);
		entity.setMobilenostwo(mobilenostwo);
		entity.setCommitteestwo(committeestwo);
		entity.setSCSTtwo(SCSTtwo);
		entity.setMincomestwo(mincomestwo);
		entity.setSalarystwo(Salarystwo);
		entity.setImmovablePropertystwo(ImmovablePropertystwo);
		entity.setEstimatedpropstwo(estimatedpropstwo);
		entity.setOfficestwo(officestwo);
		entity.setResdstwo(resdstwo);

		dao.addUser(entity);

		return entity;
	}

	@Override
	public List<NominalShareEntity> personalnominallist() {
		dao = new PersonalLoanDaoImpl();

		return dao.personalnominallist();
	}

	@Override
	public List<NominalShareEntity> PersonalNominalName(String memberid) {
		dao=new PersonalLoanDaoImpl();
		return dao.PersonalNominalName(memberid);
	
	}

	@Override
	public List<Integer> getpersonalmember() {
		dao = new PersonalLoanDaoImpl();
		return dao.personalmember();
		
	}

	@Override
	public List<RegularShareEntity> PersonalRegularList() {
		dao = new PersonalLoanDaoImpl();

		return dao.PersonalRegularList();
	}

	@Override
	public List<AshareEntity> PersonalashareList() {
		dao = new PersonalLoanDaoImpl();

		return dao.PersonalashareList();
	}

	@Override
	public List<RegularShareEntity> PersonalRegularName(String memberid) {
		dao=new PersonalLoanDaoImpl();
		return dao.PersonalRegularName(memberid);
	}

	@Override
	public List<AshareEntity> AShareName(String memberid) {
		dao=new PersonalLoanDaoImpl();
		return dao.AShareName(memberid);
		}

}
