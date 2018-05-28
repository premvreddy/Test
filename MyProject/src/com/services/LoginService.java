package com.services;

import java.util.Date;
import java.util.List;

import com.entities.UserInfoEntity;

public interface LoginService {

	void addUser(String userName, String password, String userType, Date accountCreatedDate, String employeeName, String designation, String mobilenumber,String age,String bankname, 
			String branchname, String employeeId, String dateofbirth, String dateofjoining, String gender, String hobbies, String reqto, String fathername, String raddress,
			String caddress, String bloodgroup, String resno, String apname, String apnumber, String otherdetails);
	
	void udateUser( int userId,String userName, String password, String userType, String employeeName, String designation, String mobilenumber,String age,String bankname, 
			String branchname, String employeeId, String dateofbirth, String dateofjoining, String gender, String hobbies, String reqto, String fathername, String raddress,
			String caddress, String bloodgroup, String resno, String apname, String apnumber, String otherdetails);

	/*void deleteUser(String userId);
*/
	List<UserInfoEntity> getUserList();

	UserInfoEntity validateLoginUser(String userID);



	void deleteadduser(int userId, Class<UserInfoEntity> class1);


}
