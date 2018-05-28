package com.services;

import com.dao.PigmiHolderDao;
import com.dao.PigmiHolderDaoImpl;
import com.entities.PigmiHolderEntity;

public class PigmiHolderServiceImpl implements PigmiHolderService {
	private PigmiHolderDao dao=null;



	@Override
	public PigmiHolderEntity adduser(String pigmiholdername, String pigmiholdercode, String pigmiholderaccount,
			String agentname, String agentcode, String city, String area, String pin, String contactnumber,
			String mobilenumber, String gender, String otherdetails, String address) {
		dao=new PigmiHolderDaoImpl();
		PigmiHolderEntity entity=new PigmiHolderEntity();
		entity.setPigmiholdername(pigmiholdername);
		entity.setPigmiholdercode(pigmiholdercode);
		entity.setPigmiholderaccount(pigmiholderaccount);
		entity.setAgentname(agentname);
		entity.setAgentcode(agentcode);
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
