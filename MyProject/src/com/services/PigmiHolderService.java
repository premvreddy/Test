package com.services;

import com.entities.PigmiHolderEntity;

public interface PigmiHolderService {

	PigmiHolderEntity adduser(String pigmiholdername, String pigmiholdercode, String pigmiholderaccount,
			String agentname, String agentcode, String city, String area, String pin, String contactnumber,
			String mobilenumber, String gender, String otherdetails, String address);

	

}
