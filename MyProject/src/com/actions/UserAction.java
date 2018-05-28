package com.actions;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.HibernateException;

import com.common.Constants;
import com.entities.UserEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.services.UserService;
import com.services.UserServiceImpl;

import flexjson.JSONSerializer;

public class UserAction extends ActionSupport implements ServletRequestAware {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request = null;
	private HttpSession session;
	private String resultString = SUCCESS;
	private String errorString = "";
	@UserID
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String userID;
	private String FirstName;
	private String LastName;
	private String MiddleName;
	private String emial;
	private String password;
	private String confirmpassword;
	private String Address1;
	private String Address2;
	private String city;
	private String State;
	private String gender;
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMiddleName() {
		return MiddleName;
	}

	public void setMiddleName(String middleName) {
		MiddleName = middleName;
	}



	public String getEmial() {
		return emial;
	}

	public void setEmial(String emial) {
		this.emial = emial;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getConfirmpassword() {
		return confirmpassword;
	}


	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public String getAddress1() {
		return Address1;
	}

	public void setAddress1(String address1) {
		Address1 = address1;
	}


	public String getAddress2() {
		return Address2;
	}


	public void setAddress2(String address2) {
		Address2 = address2;
	}


	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public String getZipcode() {
		return Zipcode;
	}



	public void setZipcode(String zipcode) {
		Zipcode = zipcode;
	}



	public String getMobilenumber() {
		return Mobilenumber;
	}


	public void setMobilenumber(String mobilenumber) {
		Mobilenumber = mobilenumber;
	}

	public String getFax() {
		return Fax;
	}

	public void setFax(String fax) {
		Fax = fax;
	}

	private String Zipcode;
	private String  Mobilenumber;
	private String Fax;

	private Map<String, String> map = new HashMap<String, String>();
	private UserService userService = null;
	@Override
	public String execute() {
		session = request.getSession();
		session.invalidate();
		session = null;
		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();

		try {
			userService = new UserServiceImpl();
			UserEntity userInfo = userService.addUser(userID, FirstName, LastName,MiddleName,emial,password,confirmpassword,Address1,Address2,city,State,Mobilenumber,Zipcode,Fax,gender);
			if (userInfo == null) {
				resultString = ERROR;
				errorString = "Invalid User ID";
				session.setAttribute("timeout", null);
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


	
		

	

	public String addUser() {
		session = request.getSession();
		JSONSerializer jss = new JSONSerializer();
		try {
			if(emial.contains("@"))
			{
				System.out.println("ok");
			}
			else
			{
				System.out.println("error");
			}
			
			
			if (((String) session.getAttribute("timeout")) == null) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else if (((String) session.getAttribute("timeout")).equals("true")) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else {
				userService = new UserServiceImpl();
				userService.addUser(userID, FirstName, LastName,MiddleName,emial,password,confirmpassword,Address1,Address2,city,State,Mobilenumber,Zipcode,Fax,gender);
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
	public String getUserID() {
		return userID;
	}

	/**
	 * @param userID
	 *            the userID to set
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}

	/**
	 * @return the password
	 */
	
	public String getFirstname() {
		return FirstName;
	}

	public void setFirstname(String firstname) {
		this.FirstName = firstname;
	}

	public String getLastname() {
		return LastName;
	}

	public void setLastname(String lastname) {
		this.LastName = lastname;
	}

	
}

	/**
	 * @param password
	 *            the password to set
	 */
	