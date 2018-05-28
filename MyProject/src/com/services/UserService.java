package com.services;

import com.entities.UserEntity;

public interface UserService {

	UserEntity addUser(String userID, String FirstName, String LastName, String MiddleName,String emial,String password,String confirmpassword,String Address1,String Address2,String city,String State,String Mobilenumber,String Zipcode,String Fax,String gender);





}
