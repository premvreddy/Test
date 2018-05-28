package com.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.HibernateException;

import com.entities.BranchEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.services.BranchService;
import com.services.BranchServiceImpl;

import flexjson.JSONSerializer;

public class BranchAction extends ActionSupport implements  ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request = null;
	private HttpSession session;
	private String resultString = SUCCESS;
	private String errorString = "";
	@slno
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String bankname;
	private String bankcode;
	private String branchname;
	private String branchcode;
	private String address1;
	private String address2;
	private String address3;
	private String address4;
	private String city;
	private String district;
	private String state;
	private String pin;
	private long contactnumber;
	
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public String getBankcode() {
		return bankcode;
	}
	public void setBankcode(String bankcode) {
		this.bankcode = bankcode;
	}
	public String getBranchname() {
		return branchname;
	}
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}
	public String getBranchcode() {
		return branchcode;
	}
	public void setBranchcode(String branchcode) {
		this.branchcode = branchcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getAddress4() {
		return address4;
	}
	public void setAddress4(String address4) {
		this.address4 = address4;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public long getContactnumber() {
		return contactnumber;
	}
	public void setContactnumber(long contactnumber) {
		this.contactnumber = contactnumber;
	}


	private Map<String, String> map = new HashMap<String, String>();
	private BranchService branchService = null;
	@Override
	public String execute() {
		session = request.getSession();
		session.invalidate();
		session = null;
		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();
		
		try{
			branchService = new BranchServiceImpl();
		BranchEntity branchInfo = branchService.addUser(bankname,bankcode,branchname,branchcode,address1,address2,address3,address4,city,district,state,pin,contactnumber);
		if (branchInfo == null) {
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
	
		try{
		
			branchService = new BranchServiceImpl();
			branchService.addUser(bankname,bankcode,branchname,branchcode,address1,address2,address3,address4,city,district,state,pin,contactnumber);
		
						
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

  public String branchList() {
 	session = request.getSession();
			branchService = new BranchServiceImpl();
			List<BranchEntity> branchinfo = branchService.getBranchList();
			session.setAttribute("brlist", branchinfo);
			   String jsondata = "";
				JSONSerializer jss = new JSONSerializer();
				map.put("resultString", resultString);
				map.put("errorString", errorString);
				jsondata = jss.serialize(map);
				request.setAttribute("jsondata", jsondata);
				return "jsondata";
		}


public HttpServletRequest getRequest() {
	return request;
}

@Override
public void setServletRequest(HttpServletRequest request) {
	this.request = request;
	
}







	
}
