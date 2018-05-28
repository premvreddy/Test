package com.services;


import java.util.List;

import com.entities.AshareEntity;
import com.entities.NominalShareEntity;
import com.entities.PersonalLoanEntity;
import com.entities.RegularShareEntity;

public interface PersonalLoanService {

	

	public PersonalLoanEntity addUser(String memberid,String loantype,String loanaccountno,String loannumber,String name,String husbandname,
			                          int age,String occupation,String phone,String residentialnumber,String cell,
			                          String memberofcommittee,String belongsSCST,String monthlyincome,String incomecertificate,
			                          String immovableproperty,String estimatedproperty,String loanduration,String loanpurpose,
			                          String memberofsociety,long officeaddress,String paddress,String memidone,String custnameone,
			                          String husbnameone,int ageone,String resnumberone,String mobnumberone,String membercommitteeone,
			                          String SCSTone,String mincomeone,String salaryone,String immovablepropsone,String estimatedpropsone,
			                          long officeaddsone,String resaddressone,String memberidstwo,String customernamestwo,String husbandnamestwo,
			                          int agestwo,String resnostwo,String mobilenostwo,String committeestwo,String SCSTtwo,String mincomestwo,
			                          String Salarystwo,String ImmovablePropertystwo,String estimatedpropstwo,long officestwo,String resdstwo);

	public List<NominalShareEntity> personalnominallist();

	public List<NominalShareEntity> PersonalNominalName(String memberid);

	public List<Integer> getpersonalmember();

	public List<RegularShareEntity> PersonalRegularList();

	public List<AshareEntity> PersonalashareList();

	public List<RegularShareEntity> PersonalRegularName(String memberid);

	public List<AshareEntity> AShareName(String memberid);

}


