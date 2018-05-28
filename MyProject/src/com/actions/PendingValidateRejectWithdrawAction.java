package com.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.services.WithdrawService;
import com.services.WithdrawServiceImpl;

public class PendingValidateRejectWithdrawAction extends ActionSupport implements ServletRequestAware {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request = null;
	private HttpSession session;
	
	private String resultString = SUCCESS;
	private String errorString = "";
	
	//private Map<String, String> map = new HashMap<String, String>();
	private WithdrawService withdrawService = null;

	@Override
	public String execute() {
		session = request.getSession();
		
		//Map<String, String> map = new HashMap<String, String>();

		try { 
			
			String withdrawNo=request.getParameter("withdrawNo");
			String buttonName=request.getParameter("button");
			
			
			withdrawService = new WithdrawServiceImpl();
		
			if(buttonName.equals("Validate")){
				
				boolean flag=withdrawService.validatewithdraw(withdrawNo);
				if(flag==true){
					resultString = SUCCESS;
					}
				else{
					resultString = ERROR;
					}
				}
			
			if(buttonName.equals("Reject")){
				
				boolean flag=withdrawService.rejectwithdraw(withdrawNo);
				if(flag==true){
					resultString = SUCCESS;
					}
				else{
					resultString = ERROR;
					}
				}
		}
		catch(Exception e){
			
		}
		return SUCCESS;
	}
			
		

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}


	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	
	
	}