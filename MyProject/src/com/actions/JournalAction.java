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
import com.entities.DraftJournalEntity;
import com.entities.RegularShareEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.services.JournalServiceImpl;
import com.services.LedgerAccountServiceImpl;

import flexjson.JSONSerializer;


public class JournalAction extends ActionSupport implements ServletRequestAware {

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
	private String bankname;
	private String bankcode;
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
	private  JournalServiceImpl journalService = null;
	@Override
	public String execute() {
		session = request.getSession();
		session.invalidate();
		session = null;
		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();
		
		try{
			journalService = new JournalServiceImpl();
		DraftJournalEntity DraftInfo = journalService.addUser(tNumber,accountno,reference,credit,debit,narration,bankname,bankcode,tDate,tType);
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
				journalService = new JournalServiceImpl();
				journalService.addUser(tNumber,accountno,reference,credit,debit,narration,bankname,bankcode,tDate,tType);
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
	
	
	
	public String JournalInsertList() {
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
				journalService = new JournalServiceImpl();
				List<DraftJournalEntity> journallist = journalService.getJournalInfo();
				
				List<RegularShareEntity> ledgerinfo = new LedgerAccountServiceImpl().getLedgerDetailList();
				List<String> accountno = new ArrayList<String>();
				List<String> name = new ArrayList<String>();
			    for(RegularShareEntity c : ledgerinfo){
			    	if(c.getAccountno() != null) {
			    		accountno.add(c.getAccountno());
			    		name.add(c.getAccountno());
			    	}
			    }
				session.setAttribute("journallist1", ledgerinfo);
				
				
				session.setAttribute("journallist", journallist);
				System.out.printf("list of Journal:"+journallist);
				map.put("list", jss.serialize(journallist));
				
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
	
	public String DeleteJournal() {
		session = request.getSession();
		try{
			
			journalService = new JournalServiceImpl();
			journalService.deletejournal(id, DraftJournalEntity.class);
			
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
	public String gettType() {
		return tType;
	}
	public void settType(String tType) {
		this.tType = tType;
	}
	
	/*public String getJournalNo()
	{
		session = request.getSession();
		JSONSerializer jss = new JSONSerializer();
		Calendar todayDate = Calendar.getInstance();
		System.out.println(todayDate);
		Date date = new Date();
		System.out.println(date);
		try {
			if (((String) session.getAttribute("timeout")) == null) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else if (((String) session.getAttribute("timeout")).equals("true")) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else {
				journalService = new JournalServiceImpl();
				
				List<DraftJournalEntity> journallist = journalService.getJournalNo(todayDate);
				session.setAttribute("Journalnumberinc", journallist.size()+1);
				System.out.printf("list of Account:"+ journallist.size());
				map.put("list", jss.serialize(journallist));
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
	}*/
}



