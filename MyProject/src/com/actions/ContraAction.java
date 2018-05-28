package com.actions;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.HibernateException;

import com.common.Constants;
import com.entities.DraftContraEntity;
import com.entities.LedgerAccountEntity;
import com.entities.RegularShareEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.services.ContraService;
import com.services.ContraServiceImpl;
import com.services.LedgerAccountServiceImpl;

import flexjson.JSONSerializer;

public class ContraAction extends ActionSupport implements ServletRequestAware {

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request = null;
	private HttpSession session;
	private String resultString = SUCCESS;
	private String errorString = "";
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	
	private int id;
	private String tNumber;
	private String accountno;
	private String reference;
	private double credit;
	private double debit;
	private String narration;
	private Date tDate;
	private String branchname;
	private String branchcode;
	private String tType;
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	private Map<String, String> map = new HashMap<String, String>();
	private  ContraService contraService = null;
	@Override
	public String execute() {
		session = request.getSession();
		session.invalidate();
		session = null;
		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();
		
		try{
			contraService = new ContraServiceImpl();
		DraftContraEntity DraftInfo = contraService.addUser(tNumber,accountno,reference,credit,debit,narration,branchname,branchcode,tDate,tType);
		if (DraftInfo == null) {
			resultString = ERROR;
			
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
			
			} else {
				contraService = new ContraServiceImpl();
				contraService.addUser(tNumber,accountno,reference,credit,debit,narration,branchname,branchcode,tDate,tType);
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
	public HttpServletRequest getRequest() {
		return request;
	}
	public String gettNumber() {
		return tNumber;
	}
	public void settNumber(String tNumber) {
		this.tNumber = tNumber;
	}
	public String getAccountno() {
		return accountno;
	}
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public double getCredit() {
		return credit;
	}
	public void setCredit(double credit) {
		this.credit = credit;
	}
	public double getDebit() {
		return debit;
	}
	public void setDebit(double debit) {
		this.debit = debit;
	}
	public String getNarration() {
		return narration;
	}
	public void setNarration(String narration) {
		this.narration = narration;
	}
	
	
	
	public String ContraInsertList() {
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
				contraService = new ContraServiceImpl();
				List<DraftContraEntity> contralist = contraService.getContraInfo();
				
				List<RegularShareEntity> ledgerinfo = new LedgerAccountServiceImpl().getLedgerDetailList();
				
				List<LedgerAccountEntity> accountEntities = new LedgerAccountServiceImpl().getNameFromAccount1();
				List<LedgerAccountEntity> ledgerAccountEntities = new ArrayList<LedgerAccountEntity>();
				List<String> accountno = new ArrayList<String>();
			    for(LedgerAccountEntity ledgerAccountEntity : accountEntities){
			    	if((ledgerAccountEntity.getSubgroupname().equals("Cash") || ledgerAccountEntity.getSubgroupname().equals("Bank Account")) && ledgerAccountEntity.getAccountcode() != null) {
			    		accountno.add(ledgerAccountEntity.getAccountcode());
			    		ledgerAccountEntities.add(ledgerAccountEntity);
			    	}
			    }
				session.setAttribute("contralist1", ledgerAccountEntities);
				
				
				session.setAttribute("contralist", contralist);
				System.out.printf("list of Contra:"+contralist);
				map.put("list", jss.serialize(contralist));
				
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
	
	public String DeleteContra() {
		session = request.getSession();
		try{
			
				contraService = new ContraServiceImpl();
				contraService.deletecontra(id, DraftContraEntity.class);
			
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date gettDate() {
		return tDate;
	}
	public void settDate(Date tDate) {
		this.tDate = tDate;
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
	public String gettType() {
		return tType;
	}
	public void settType(String tType) {
		this.tType = tType;
	}
	

}
