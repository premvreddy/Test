package com.actions;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.HibernateException;

import com.entities.UserPermissionsEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.services.UserPermissionService;
import com.services.UserPermissionServiceImpl;

import flexjson.JSONSerializer;

@SuppressWarnings("serial")
public class UserPermissionAction extends ActionSupport implements ServletRequestAware {

	private String userName;
	private HttpServletRequest request = null;
	
	
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
	
	private Date accountCreatedDate;
	private Map<String, String> map = new HashMap<String, String>();
	private UserPermissionService userPermService = null;
	private HttpSession session;
	
	@Override
	public String execute(){
		return "";
	}
	
	
	public String getUserPerm(){
		
		session = request.getSession();
		
		UserPermissionsEntity list = new UserPermissionsEntity();
		JSONSerializer jsonSerializer = new JSONSerializer();
		try{
			
			userPermService = new UserPermissionServiceImpl();
				list = userPermService.getUserPermissions(userName);
				session.setAttribute("userPerms", list);
				map.put("list", jsonSerializer.serialize(list));
			
			
		}
		catch(HibernateException e){
		    e.printStackTrace();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		String jsondata ="";
	
		jsondata = jsonSerializer.serialize(list);
		request.setAttribute("jsondata", jsondata);
		return "jsondata";
	}
	


	public void updateUserPerm(){
		session = request.getSession();
		
			try {
				userPermService = new UserPermissionServiceImpl();
	                
				    String homeAllAccess1 = homeAllAccess.equals("true")?"Y":"N";
					String homeEntryAccess1 = homeEntryAccess.equals("true")?"Y":"N";
					String homeEditAccess1 = homeEditAccess.equals("true")?"Y":"N";
					String memberAllAccess1=memberAllAccess.equals("true")?"Y":"N";
					String memberEntryAccess1 = memberEntryAccess.equals("true")?"Y":"N";
					String memberEditAccess1 = memberEditAccess.equals("true")?"Y":"N";
					String depositAllAccess1=depositAllAccess.equals("true")?"Y":"N";
					String depositEntryAccess1 = depositEntryAccess.equals("true")?"Y":"N";
					String depositEditAccess1=depositEntryAccess.equals("true")?"Y":"N";
					String loansAllAccess1 = loansAllAccess.equals("true")?"Y":"N";
					String loansEntryAccess1 = loansEntryAccess.equals("true")?"Y":"N";
					String loansEditAccess1=loansEditAccess.equals("true")?"Y":"N";
					String pigmiAllAccess1=pigmiAllAccess.equals("true")?"Y":"N";
					String pigmiEntryAccess1=pigmiEntryAccess.equals("true")?"Y":"N";
					String pigmiEditAccess1 = pigmiEditAccess.equals("true")?"Y":"N";
					String accountsAllAccess1=accountsAllAccess.equals("true")?"Y":"N";
					String accountsEntryAccess1=accountsAllAccess.equals("true")?"Y":"N";
					String accountsEditAccess1 = accountsEditAccess.equals("true")?"Y":"N";
					
					
					userPermService.updateUserPerm(userName ,homeAllAccess1,homeEntryAccess1,homeEditAccess1,
							 memberAllAccess1,memberEntryAccess1,memberEditAccess1,
							 depositAllAccess1,depositEntryAccess1,depositEditAccess1,
							 loansAllAccess1,loansEntryAccess1,loansEditAccess1,
							 pigmiAllAccess1,pigmiEntryAccess1,pigmiEditAccess1,
							 accountsAllAccess1,accountsEntryAccess1,accountsEditAccess1);
				}
			 catch (HibernateException e) {
			e.printStackTrace();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	
	
	
	public Date getAccountCreatedDate() {
		return accountCreatedDate;
	}
	public void setAccountCreatedDate(Date accountCreatedDate) {
		this.accountCreatedDate = accountCreatedDate;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
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


	public Map<String, String> getMap() {
		return map;
	}



	public void setMap(Map<String, String> map) {
		this.map = map;
	}



	public UserPermissionService getUserPermService() {
		return userPermService;
	}



	public void setUserPermService(UserPermissionService userPermService) {
		this.userPermService = userPermService;
	}



	public HttpSession getSession() {
		return session;
	}



	public void setSession(HttpSession session) {
		this.session = session;
	}


	public String getDepositEditAccess() {
		return depositEditAccess;
	}


	public void setDepositEditAccess(String depositEditAccess) {
		this.depositEditAccess = depositEditAccess;
	}


	public String getAccountsEntryAccess() {
		return accountsEntryAccess;
	}


	public void setAccountsEntryAccess(String accountsEntryAccess) {
		this.accountsEntryAccess = accountsEntryAccess;
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


	public String getAccountsEditAccess() {
		return accountsEditAccess;
	}


	public void setAccountsEditAccess(String accountsEditAccess) {
		this.accountsEditAccess = accountsEditAccess;
	}
	
}
