package com.actions;


import java.util.HashMap;
import java.util.Map;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.entities.PigmiHolderEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.services.PigmiHolderService;
import com.services.PigmiHolderServiceImpl;

import flexjson.JSONSerializer;

public class PigmiHolderAction extends ActionSupport implements ServletRequestAware  {
	
	   /**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		private HttpServletRequest request = null;
		public HttpServletRequest getRequest() {
			return request;
		}
		@Override
		public void setServletRequest(HttpServletRequest request) {
			this.request = request;
			
		}

		private String resultstring = SUCCESS;
		private String errorstring = "";
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private int id;
		private String pigmiholdername;
		private String pigmiholdercode;
		private String pigmiholderaccount;
		private String agentname;
		private String agentcode;
		private String city;
		private String area;
		private String pin;
		private String contactnumber;
		private String mobilenumber;
		private String gender;
		private String otherdetails;
		private String address;
		private HttpSession session;
		

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getPigmiholdername() {
			return pigmiholdername;
		}

		public void setPigmiholdername(String pigmiholdername) {
			this.pigmiholdername = pigmiholdername;
		}

		public String getPigmiholdercode() {
			return pigmiholdercode;
		}

		public void setPigmiholdercode(String pigmiholdercode) {
			this.pigmiholdercode = pigmiholdercode;
		}

		public String getPigmiholderaccount() {
			return pigmiholderaccount;
		}

		public void setPigmiholderaccount(String pigmiholderaccount) {
			this.pigmiholderaccount = pigmiholderaccount;
		}

		public String getAgentname() {
			return agentname;
		}

		public void setAgentname(String agentname) {
			this.agentname = agentname;
		}

		public String getAgentcode() {
			return agentcode;
		}

		public void setAgentcode(String agentcode) {
			this.agentcode = agentcode;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getArea() {
			return area;
		}

		public void setArea(String area) {
			this.area = area;
		}

		public String getPin() {
			return pin;
		}

		public void setPin(String pin) {
			this.pin = pin;
		}

		public String getContactnumber() {
			return contactnumber;
		}

		public void setContactnumber(String contactnumber) {
			this.contactnumber = contactnumber;
		}

		public String getMobilenumber() {
			return mobilenumber;
		}

		public void setMobilenumber(String mobilenumber) {
			this.mobilenumber = mobilenumber;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public String getOtherdetails() {
			return otherdetails;
		}

		public void setOtherdetails(String otherdetails) {
			this.otherdetails = otherdetails;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public HttpSession getSession() {
			return session;
		}

		public void setSession(HttpSession session) {
			this.session = session;
		}
		private Map<String,String> map= new HashMap<String,String>();
		private PigmiHolderService pigmiholderservice=null;
		
		@Override
		public String execute()
		{

			
			session = request.getSession();
			Map<String,String> map=new HashMap<String, String>();
			try{
				pigmiholderservice= new PigmiHolderServiceImpl();
				PigmiHolderEntity pigmientity= pigmiholderservice.adduser(pigmiholdername,pigmiholdercode,pigmiholderaccount,agentname,agentcode,city,area,pin,contactnumber,mobilenumber,gender, otherdetails,address);
				if (pigmientity == null) {
					resultstring = ERROR;
					errorstring = "Invalid User ID";
					session.setAttribute("timeout", null);
				} 
			}
			
			 catch (Exception e) {
				resultstring = ERROR;
				errorstring = e.getMessage();
		}
			String jsondata="";
			JSONSerializer jss = new JSONSerializer();
			map.put("resultString", resultstring);
			map.put("errorstring", errorstring);
			jsondata = jss.serialize(map);
			request.setAttribute("jsondata", jsondata);
			return jsondata;
			
		}

		
		
	}










