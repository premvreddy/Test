package com.actions;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.HibernateException;

import com.common.Constants;
import com.entities.UserInfoEntity;
import com.entities.UserPermissionsEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.services.LoginService;
import com.services.LoginServiceImpl;
import com.services.UserPermissionService;
import com.services.UserPermissionServiceImpl;

import flexjson.JSONSerializer;

public class LoginAction extends ActionSupport implements ServletRequestAware {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request = null;
	private HttpSession session;
	private String resultString = SUCCESS;

	private String errorString = "";
	private String userName;
	private int userId;
	private String oldUserId;
	private String password;
	private String userType;
	private String employeeName;
	private String designation;
	private String mobilenumber;
	private String age;
	private String bankname;
	private String branchname;
	private String employeeId;

	private String dateofbirth;
	private String dateofjoining;
	private String gender;
	private String hobbies;
	private String reqto;
	private String fathername;
	private String raddress;
	private String caddress;
	private String bloodgroup;
	private String resno;
	private String apname;
	private String apnumber;
	private String otherdetails;
	
	private String homeAllAccess="";
	private String homeEntryAccess="";
	private String homeEditAccess="";
	private String memberAllAccess="";
	private String memberEntryAccess="";
	private String memberEditAccess="";
	private String depositAllAccess="";
	private String depositEntryAccess="";
	private String depositEditAccess="";
	private String loansAllAccess="";
	private String loansEntryAccess="";
	private String loansEditAccess="";
	private String pigmiAllAccess="";
	private String pigmiEntryAccess="";
	private String pigmiEditAccess="";
	private String accountsAllAccess="";
	private String accountsEntryAccess="";
	private String accountsEditAccess="";
	
	private File userImage;  
    private String userImageContentType;  
    private String userImageFileName;
	
	private Date accountCreatedDate;
	private Map<String, String> map = new HashMap<String, String>();
	private LoginService loginService = null;
    private UserPermissionService userPermService;
	@Override
	public String execute() {
		session = request.getSession();
		session.invalidate();
		session = null;
		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();

		try {
			loginService = new LoginServiceImpl();
			userPermService = new UserPermissionServiceImpl();
			
			
			
			UserInfoEntity userInfo = loginService.validateLoginUser(userName);
			if (userInfo == null) {
				resultString = ERROR;
				errorString = "Invalid User ID";
				session.setAttribute("timeout", null);
			} else {
				boolean bool = password.equals(userInfo.getPassword());
				List<UserInfoEntity> list = loginService.getUserList();
				session.setAttribute("userlist", list);
				if (bool) {
					UserPermissionsEntity userPerm = new UserPermissionsEntity();
					userPerm  = userPermService.getUserPermissions(userName);
					
					session.setAttribute("userPermission",userPerm);
					
					session.setAttribute("timeout", "false");
					session.setAttribute("language", "en");

					session.setAttribute("userName", userName);
					session.setAttribute("usertype", userInfo.getUserType().toUpperCase());
					session.setAttribute("loginBean", userInfo);
					session.setAttribute("userlist", list);
				} else {
					resultString = ERROR;
					errorString = "Invalid Password";
					session.setAttribute("timeout", null);
				}

			}
		} catch (Exception e) {
			resultString = ERROR;
			errorString = e.getMessage();
			e.printStackTrace();
		}

		String jsondata = "";
		JSONSerializer jss = new JSONSerializer();
		map.put("resultString", resultString);
		map.put("errorString", errorString);
		jsondata = jss.serialize(map);
		request.setAttribute("jsondata", jsondata);
		return "jsondata";
	}
	
	

	public String fileUpload() {
				try {
			  
				 String filePath = ServletActionContext.getServletContext().getRealPath("/").concat("userimages");  
				             System.out.println("Image Location:" + filePath);//see the server console for actual location  
				             File fileToCreate = new File(filePath,userImageFileName);  
				             FileUtils.copyFile(userImage, fileToCreate);//copying source file to new file  
				                   
				
		
		} catch (Exception e) {
			
		
	}
				return SUCCESS;
	}
	
	public String addUser() {
		session = request.getSession();
		userPermService = new UserPermissionServiceImpl();
		JSONSerializer jss = new JSONSerializer();
		try {
			if (((String) session.getAttribute("timeout")) == null) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else if (((String) session.getAttribute("timeout")).equals("true")) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else {
				loginService = new LoginServiceImpl();
				
				try{
				     
					loginService.addUser(userName, password, userType, accountCreatedDate, employeeName, designation, mobilenumber, age, bankname, 
							branchname, employeeId, dateofbirth, dateofjoining, gender, hobbies, reqto, fathername, raddress,
							 caddress, bloodgroup, resno, apname,apnumber, otherdetails);
				}
				catch(Exception e){
					resultString = ERROR;
					if (e.getCause() == null) {
						errorString = e.getMessage();
					} else {
						errorString = e.getCause().toString();
					}
				}
				userPermService.setUserPerm(userName);
				
			}
		} catch (HibernateException e) {
			resultString = ERROR;
			if (e.getCause() == null) {
				errorString = e.getMessage();
			} else {
				errorString = e.getCause().toString();
			}
		} catch (Exception e) {
			resultString = ERROR;
			errorString = e.getMessage();
		}
		String jsondata = "";
		map.put("resultString", resultString);
		map.put("errorString", errorString);
		jsondata = jss.serialize(map);
		request.setAttribute("jsondata", jsondata);
		return "jsondata";
	}
	
	
	public String logout()
	{
		  session.invalidate();  
		    return "success";  
		
		
	}
	
	

	public String updateUser() {
		session = request.getSession();
		JSONSerializer jss = new JSONSerializer();
		try {
			if (((String) session.getAttribute("timeout")) == null) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else if (((String) session.getAttribute("timeout")).equals("true")) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else {
				loginService = new LoginServiceImpl();
				loginService.udateUser(userId,userName, password, userType, employeeName, designation, mobilenumber, age, bankname, 
						branchname, employeeId, dateofbirth, dateofjoining, gender, hobbies, reqto, fathername, raddress,
						 caddress, bloodgroup, resno, apname,apnumber, otherdetails);
			}
		} catch (HibernateException e) {
			resultString = ERROR;
			if (e.getCause() == null) {
				errorString = e.getMessage();
			} else {
				errorString = e.getCause().toString();
			}
		} catch (Exception e) {
			resultString = ERROR;
			errorString = e.getMessage();
		}
		String jsondata = "";
		map.put("resultString", resultString);
		map.put("errorString", errorString);
		jsondata = jss.serialize(map);
		request.setAttribute("jsondata", jsondata);
		return "jsondata";
	}

	public String DeleteAddUser() {
		userPermService = new UserPermissionServiceImpl();
		session = request.getSession();
		try{
			if(((String)session.getAttribute("timeout")) == null) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else if(((String)session.getAttribute("timeout")).equals("true")) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else {
				userPermService.deleteUserPerms(userName, UserPermissionsEntity.class);
				loginService = new LoginServiceImpl();
				loginService.deleteadduser(userId, UserInfoEntity.class);
			}
		} catch (HibernateException e) {
			resultString = ERROR;
			if(e.getCause() == null) {
				errorString = e.getMessage();
			} else {
				errorString = e.getCause().toString();
			}
			if(errorString.indexOf("FOREIGN KEY") > -1) {
				errorString = "Can't update/delete, The item has been used, Please contact service provider";
			}
		} catch (Exception e) {
			resultString = ERROR;
			errorString = e.getMessage();
		}
		String jsondata = "";
		JSONSerializer jss = new JSONSerializer();
		map.put("resultString", resultString);
		map.put("errorString", errorString);
		jsondata = jss.serialize(map);
		request.setAttribute("jsondata", jsondata);
		return "jsondata";
	}
	

	public String userList() {
		session = request.getSession();
		JSONSerializer jss = new JSONSerializer();
		try {
			if (((String) session.getAttribute("timeout")) == null) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else if (((String) session.getAttribute("timeout")).equals("true")) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else {
				loginService = new LoginServiceImpl();
				List<UserInfoEntity> list = loginService.getUserList();
				session.setAttribute("userlist", list);
				System.out.printf("list of users:::::"+list);
				map.put("list", jss.serialize(list));
			}
		} catch (HibernateException e) {
			resultString = ERROR;
			if (e.getCause() == null) {
				errorString = e.getMessage();
			} else {
				errorString = e.getCause().toString();
			}
		} catch (Exception e) {
			resultString = ERROR;
			errorString = e.getMessage();
		}
		String jsondata = "";
		map.put("resultString", resultString);
		map.put("errorString", errorString);
		jsondata = jss.serialize(map);
		request.setAttribute("jsondata", jsondata);
		return "jsondata";
	}
	
	
	

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	/**
	 * @return the request
	 */
	public HttpServletRequest getRequest() {
		return request;
	}

	/**
	 * @return the userID
	 */


	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getEmployeeName(){
		return employeeName;
	}

	public void setEmployeeName(String employeeName){
		this.employeeName = employeeName;
	}
	
	public String getDesignation(){
		return designation;
	}
	
	public void setDesignation(String designation){
		this.designation = designation;
	}
	
	

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the userType
	 */
	public String getUserType() {
		return userType;
	}

	/**
	 * @param userType
	 *            the userType to set
	 */
	public void setUserType(String userType) {
		this.userType = userType;
	}

	/**
	 * @return the oldUserId
	 */
	public String getOldUserId() {
		return oldUserId;
	}

	/**
	 * @param oldUserId
	 *            the oldUserId to set
	 */
	public void setOldUserId(String oldUserId) {
		this.oldUserId = oldUserId;
	}



	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public Date getAccountCreatedDate() {
		return accountCreatedDate;
	}



	public void setAccountCreatedDate(Date accountCreatedDate) {
		this.accountCreatedDate = accountCreatedDate;
	}



	public String getHomeAllAccess() {
		return homeAllAccess;
	}



	public void setHomeAllAccess(String homeAllAccess) {
		this.homeAllAccess = homeAllAccess;
	}



	public String getHomeEntryAccess() {
		return homeEntryAccess;
	}



	public void setHomeEntryAccess(String homeEntryAccess) {
		this.homeEntryAccess = homeEntryAccess;
	}



	public String getHomeEditAccess() {
		return homeEditAccess;
	}



	public void setHomeEditAccess(String homeEditAccess) {
		this.homeEditAccess = homeEditAccess;
	}



	public String getMemberAllAccess() {
		return memberAllAccess;
	}



	public void setMemberAllAccess(String memberAllAccess) {
		this.memberAllAccess = memberAllAccess;
	}



	public String getMemberEntryAccess() {
		return memberEntryAccess;
	}



	public void setMemberEntryAccess(String memberEntryAccess) {
		this.memberEntryAccess = memberEntryAccess;
	}



	public String getMemberEditAccess() {
		return memberEditAccess;
	}



	public void setMemberEditAccess(String memberEditAccess) {
		this.memberEditAccess = memberEditAccess;
	}



	public String getDepositAllAccess() {
		return depositAllAccess;
	}



	public void setDepositAllAccess(String depositAllAccess) {
		this.depositAllAccess = depositAllAccess;
	}



	public String getDepositEntryAccess() {
		return depositEntryAccess;
	}



	public void setDepositEntryAccess(String depositEntryAccess) {
		this.depositEntryAccess = depositEntryAccess;
	}



	public String getDepositEditAccess() {
		return depositEditAccess;
	}



	public void setDepositEditAccess(String depositEditAccess) {
		this.depositEditAccess = depositEditAccess;
	}



	public String getLoansAllAccess() {
		return loansAllAccess;
	}



	public void setLoansAllAccess(String loansAllAccess) {
		this.loansAllAccess = loansAllAccess;
	}



	public String getLoansEntryAccess() {
		return loansEntryAccess;
	}



	public void setLoansEntryAccess(String loansEntryAccess) {
		this.loansEntryAccess = loansEntryAccess;
	}



	public String getLoansEditAccess() {
		return loansEditAccess;
	}



	public void setLoansEditAccess(String loansEditAccess) {
		this.loansEditAccess = loansEditAccess;
	}



	public String getPigmiAllAccess() {
		return pigmiAllAccess;
	}



	public void setPigmiAllAccess(String pigmiAllAccess) {
		this.pigmiAllAccess = pigmiAllAccess;
	}



	public String getPigmiEntryAccess() {
		return pigmiEntryAccess;
	}



	public void setPigmiEntryAccess(String pigmiEntryAccess) {
		this.pigmiEntryAccess = pigmiEntryAccess;
	}



	public String getPigmiEditAccess() {
		return pigmiEditAccess;
	}



	public void setPigmiEditAccess(String pigmiEditAccess) {
		this.pigmiEditAccess = pigmiEditAccess;
	}



	public String getAccountsAllAccess() {
		return accountsAllAccess;
	}



	public void setAccountsAllAccess(String accountsAllAccess) {
		this.accountsAllAccess = accountsAllAccess;
	}



	public String getAccountsEntryAccess() {
		return accountsEntryAccess;
	}



	public void setAccountsEntryAccess(String accountsEntryAccess) {
		this.accountsEntryAccess = accountsEntryAccess;
	}



	public String getAccountsEditAccess() {
		return accountsEditAccess;
	}



	public void setAccountsEditAccess(String accountsEditAccess) {
		this.accountsEditAccess = accountsEditAccess;
	}



	public File getUserImage() {
		return userImage;
	}



	public void setUserImage(File userImage) {
		this.userImage = userImage;
	}



	public String getUserImageContentType() {
		return userImageContentType;
	}



	public void setUserImageContentType(String userImageContentType) {
		this.userImageContentType = userImageContentType;
	}



	public String getUserImageFileName() {
		return userImageFileName;
	}



	public void setUserImageFileName(String userImageFileName) {
		this.userImageFileName = userImageFileName;
	}



	public String getDateofbirth() {
		return dateofbirth;
	}



	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}



	public String getDateofjoining() {
		return dateofjoining;
	}



	public void setDateofjoining(String dateofjoining) {
		this.dateofjoining = dateofjoining;
	}



	public String getBankname() {
		return bankname;
	}



	public void setBankname(String bankname) {
		this.bankname = bankname;
	}



	public String getBranchname() {
		return branchname;
	}



	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}



	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}



	


	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getHobbies() {
		return hobbies;
	}



	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}



	public String getReqto() {
		return reqto;
	}



	public void setReqto(String reqto) {
		this.reqto = reqto;
	}



	public String getFathername() {
		return fathername;
	}



	public void setFathername(String fathername) {
		this.fathername = fathername;
	}



	public String getRaddress() {
		return raddress;
	}



	public void setRaddress(String raddress) {
		this.raddress = raddress;
	}



	public String getCaddress() {
		return caddress;
	}



	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}



	public String getBloodgroup() {
		return bloodgroup;
	}



	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}



	public String getResno() {
		return resno;
	}



	public void setResno(String resno) {
		this.resno = resno;
	}



	public String getApname() {
		return apname;
	}



	public void setApname(String apname) {
		this.apname = apname;
	}



	public String getApnumber() {
		return apnumber;
	}



	public void setApnumber(String apnumber) {
		this.apnumber = apnumber;
	}



	public String getOtherdetails() {
		return otherdetails;
	}



	public void setOtherdetails(String otherdetails) {
		this.otherdetails = otherdetails;
	}

	
	public String getMobilenumber() {
		return mobilenumber;
	}

	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}
	
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
}