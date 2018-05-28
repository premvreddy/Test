package com.services;

import java.util.Date;
import java.util.List;

import com.common.Constants;
import com.dao.LoginDao;
import com.dao.LoginDaoImpl;
import com.entities.UserInfoEntity;

public class LoginServiceImpl implements LoginService {

	private LoginDao dao = null;

	@Override
	public void addUser(String userName, String password, String userType, Date accountCreatedDate, String employeeName, String designation, String mobilenumber,String age,String bankname, 
			String branchname,String employeeId, String dateofbirth, String dateofjoining,String gender,String hobbies,String reqto,String fathername,String raddress,
			String caddress,String bloodgroup,String resno, String apname, String apnumber, String otherdetails) {
		// TODO Auto-generated method stub
		dao = new LoginDaoImpl();
		UserInfoEntity entity = new UserInfoEntity();
	    entity.setUserName(userName);
		entity.setPassword(password);
		entity.setUserType(userType);
		entity.setDate( new Date());
		entity.setDeleteFlag(Constants.ACTIVE);
		entity.setEmployeeName(employeeName);
		entity.setDesignation(designation);
		entity.setMobilenumber(mobilenumber);
		entity.setAge(age);
		entity.setBankname(bankname);
		entity.setBranchname(branchname);
		entity.setEmployeeId(employeeId);
		entity.setDateofbirth(dateofbirth);
		entity.setDateofjoining(dateofjoining);
		entity.setGender(gender);
		entity.setHobbies(hobbies);
		entity.setReqto(reqto);
		entity.setFathername(fathername);
		entity.setRaddress(raddress);
		entity.setCaddress(caddress);
		entity.setBloodgroup(bloodgroup);
		entity.setResno(resno);
		entity.setApname(apname);
		entity.setApnumber(apnumber);
		entity.setOtherdetails(otherdetails);
		
		dao.addUser(entity);
	}

	
	@Override
	public void udateUser(int userId, String userName, String password, String userType,String employeeName, String designation, String mobilenumber,String age,String bankname, 
			String branchname, String employeeId, String dateofbirth, String dateofjoining, String gender, String hobbies, String reqto, String fathername, String raddress,
			String caddress, String bloodgroup, String resno, String apname, String apnumber, String otherdetails) {
		dao = new LoginDaoImpl();
		UserInfoEntity entity = new UserInfoEntity();
		entity.setUserId(userId);
	    entity.setUserName(userName);;
	    entity.setPassword(password);
		   entity.setUserType(userType);
		   entity.setEmployeeName(employeeName);
		   entity.setDesignation(designation);
		   entity.setMobilenumber(mobilenumber);
		   entity.setAge(age);
		   entity.setBankname(bankname);
		   entity.setBranchname(branchname);
		   entity.setEmployeeId(employeeId);
		   entity.setDateofbirth(dateofbirth);
		   entity.setDateofjoining(dateofjoining);
		   entity.setGender(gender);
		   entity.setHobbies(hobbies);
		   entity.setReqto(reqto);
		   entity.setFathername(fathername);
		   entity.setRaddress(raddress);
		   entity.setCaddress(caddress);
		   entity.setBloodgroup(bloodgroup);
		   entity.setResno(resno);
		   entity.setApname(apname);
		   entity.setApnumber(apnumber);
		   entity.setOtherdetails(otherdetails);
	   
		   dao.update(userId, entity);
	
	}

	/*@Override
	public void deleteUser(String userID) {
		dao = new LoginDaoImpl();
		UserInfoEntity entity = dao.find(userID);
		entity.setDeleteFlag(Constants.INACTIVE);
		dao.updateUser(entity);
	}*/

	@Override
	public List<UserInfoEntity> getUserList() {
		dao = new LoginDaoImpl();
		return dao.listLogin();
	}

	@Override
	public UserInfoEntity validateLoginUser(String userID) {
		dao = new LoginDaoImpl();    
 		return dao.validateLoginUser(userID);
	}


	@Override
	public void deleteadduser(int userId, Class<UserInfoEntity> class1) {
		// TODO Auto-generated method stub
		dao = new LoginDaoImpl();
		UserInfoEntity entity = new UserInfoEntity();
		entity.setUserId(userId);;
		dao.deleteaddusers(userId, class1);
		
	}

}
