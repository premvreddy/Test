package com.actions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.HibernateException;

import com.common.Constants;
import com.entities.LedgerGroupEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.services.LedgerGroupService;
import com.services.LedgerGroupServiceImpl;

import flexjson.JSONSerializer;

public class LedgerGroupAction extends ActionSupport implements ServletRequestAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request = null;
	private HttpSession session;
	private String resultString = SUCCESS;
	private String errorString = "";
	@id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String branchname;
	private String branchcode;
	private String groupname;
	private String subgroupname;
	private String maingroup;
	private String groupcode;
	public String getGroupcode() {
		return groupcode;
	}
	public void setGroupcode(String groupcode) {
		this.groupcode = groupcode;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	public String getbranchname() {
		return branchname;
	}
	public void setbranchname(String branchname) {
		this.branchname = branchname;
	}
	public String getbranchcode() {
		return branchcode;
	}
	public void setbranchcode(String branchcode) {
		this.branchcode = branchcode;
	}
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	public String getSubgroupname() {
		return subgroupname;
	}
	public void setSubgroupname(String subgroupname) {
		this.subgroupname = subgroupname;
	}
	public String getMaingroup() {
		return maingroup;
	}
	public void setMaingroup(String maingroup) {
		this.maingroup = maingroup;
	}
	private Map<String, String> map = new HashMap<String, String>();
	private LedgerGroupService groupService = null;
	@Override
	public String execute() {
		session = request.getSession();
		session.invalidate();
		session = null;
		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();
		
		try{
			groupService = new LedgerGroupServiceImpl();
		LedgerGroupEntity ledgerInfo = groupService.addUser(branchname,branchcode,groupname,subgroupname,maingroup,groupcode);
		if (ledgerInfo == null) {
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
			
			if (((String) session.getAttribute("timeout")) == null) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else if (((String) session.getAttribute("timeout")).equals("true")) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else {
				groupService = new LedgerGroupServiceImpl();
				groupService.addUser(branchname,branchcode,groupname,subgroupname,maingroup,groupcode);
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
	
	
	
	
	public String ledgerList() {
		session = request.getSession();
				groupService = new LedgerGroupServiceImpl();
				List<LedgerGroupEntity> ledgerinfo = groupService.getLedgerList();
				List<String> groupname = new ArrayList<String>();
			    for(LedgerGroupEntity c : ledgerinfo){
			    	if(c.getGroupname() != null) {
			    		groupname.add(c.getGroupname());
			    	}
			    }
				session.setAttribute("lglist", ledgerinfo);
				   String jsondata = "";
					JSONSerializer jss = new JSONSerializer();
				    map.put("groupnameList",jss.serialize(groupname));
					map.put("resultString", resultString);
					map.put("errorString", errorString);
					jsondata = jss.serialize(map);
					request.setAttribute("jsondata", jsondata);
					return "jsondata";
			}
		
	
public String getNameFromSubGroup(){
	groupService = new LedgerGroupServiceImpl();
	String maingroup =groupService.getNameFromSubGroup(groupname);
		String jsondata = "";
		JSONSerializer jss = new JSONSerializer();
		 map.put("maingroup",jss.serialize(maingroup));
		map.put("resultString", resultString);
		map.put("errorString", errorString);
		jsondata = jss.serialize(map);
		request.setAttribute("jsondata", jsondata);
		return "jsondata";
		
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
