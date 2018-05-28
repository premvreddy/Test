package com.services;

import com.entities.AccountEntity;

public interface AccountService 
{

	AccountEntity adduser(String accountname, String branchcode, String city, String area, String pin, String contactnumber,
			String mobilenumber, String gender, String otherdetails, String address);

	
	
	
}
