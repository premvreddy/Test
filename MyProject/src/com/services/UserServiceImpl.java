package com.services;

import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.entities.UserEntity;

public class UserServiceImpl implements UserService {

	private UserDao dao = null;

	@Override
	public UserEntity  addUser(String userID, String FirstName, String LastName, String MiddleName,String emial,String password,String confirmpassword,String Address1,String Address2,String city,String State,String Mobilenumber,String Zipcode,String Fax,String gender)
	{
		// TODO Auto-generated method stub
		dao = new UserDaoImpl();
		UserEntity entity = new UserEntity();
		entity.setUserID(userID);
		entity.setFirstName(FirstName);
		entity.setLastName(LastName);
	    entity.setMiddleName(MiddleName);
	    entity.setEmial(emial);
	    entity.setAddress1(Address1);
	    entity.setAddress2(Address2);
	    entity.setCity(city);
	    entity.setConfirmpassword(confirmpassword);
	    entity.setPassword(confirmpassword);
	    entity.setMobilenumber(Mobilenumber);
	    entity.setFax(Fax);
	    entity.setZipcode(Zipcode);
	    entity.setState(State);
	    entity.setGender(gender);
		dao.addUser(entity);
		return entity;
		
		
	}

	

}
