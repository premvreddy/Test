package com.actions;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.entities.AgentEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.services.AgentService;
import com.services.AgentServiceImpl;

import flexjson.JSONSerializer;

public class AgentAction extends ActionSupport implements ServletRequestAware {

	private static final long serialVersionUID = 1L;
	private String resultString = SUCCESS;
	private String errorString = "";
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
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

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map = map;
	}

	private HttpServletRequest request = null;

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

	public String getOtherd1tails() {
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private Map<String, String> map = new HashMap<String, String>();
	private AgentService agentservice = null;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String execute() {

		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();
		try {
			agentservice = new AgentServiceImpl();
			AgentEntity agent = agentservice.adduser(agentname, agentcode, city, area, pin, contactnumber, mobilenumber,
					gender, otherdetails, address);
			if (agent == null) {
				resultString = ERROR;
				errorString = "Invalid User ID";
				session.setAttribute("timeout", null);
			}
		}

		catch (Exception e) {
			resultString = ERROR;
			errorString = e.getMessage();
		}
		String jsondata = "";
		JSONSerializer jss = new JSONSerializer();
		map.put("resultString", resultString);
		map.put("errorString", errorString);
		jsondata = jss.serialize(map);
		request.setAttribute("jsondata", jsondata);
		return jsondata;

	}

	public HttpServletRequest getRequest() {
		return request;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	

}
