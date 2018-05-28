package com.services;

import com.dao.AccountDAO;
import com.dao.AccountDAOImpl;
import com.entities.AccountEntity;





public class AccountServiceImpl  implements AccountService
{
	private AccountDAO dao=null;
	
@Override
public AccountEntity adduser(String accountname, String branchcode, String city, String area, String pin, String contactnumber,
		String mobilenumber, String gender, String otherdetails, String address) 
{
	dao=new AccountDAOImpl();
	AccountEntity entity=new AccountEntity();
	
	entity.setAccountname(accountname);
	entity.setBranchcode(branchcode);
	entity.setCity(city);
	entity.setArea(area);
	entity.setPin(pin);
	entity.setContactnumber(contactnumber);
	entity.setMobilenumber(mobilenumber);
	entity.setGender(gender);
	entity.setOtherdetails(otherdetails);
	entity.setAddress(address);
	dao.adduser(entity);
		return entity;
	}
	
}
