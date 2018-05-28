package com.actions;

import java.util.Calendar;
import java.util.Date;
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
import com.dto.RegularInfoDto;
import com.entities.ReceiptEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.services.RecieptAccountService;
import com.services.RecieptAccountServiceImpl;

import flexjson.JSONSerializer;

public class ReceiptAction extends ActionSupport implements ModelDriven<RegularInfoDto>, ServletRequestAware{

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
	private int slno;
	/*private String bankname;
	private String bankcode;*/
	private String branchname;
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
	private String branchcode;
	private String userName;
	private String memberid;

	private String receiptno;
	private String accoounttype;
	private String accountno;
	private String name;
	private long amount;
	private long cell;
	private String remarks;
	private int thousand;
	private int fivehundered;
	private int hundered;
	private int fifty;
	private int twenty;
	private int ten;
	private int five;
	private int two;
	private int one;
	private int coins;
	
	private RegularInfoDto reqDto = new RegularInfoDto();
	private Date receiptdate;
	
	public int getSlno() {
		return slno;
	}

	public void setSlno(int slno) {
		this.slno = slno;
	}

	/*public String getBankname() {
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
	}*/

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getReceiptno() {
		return receiptno;
	}

	public void setReceiptno(String receiptno) {
		this.receiptno = receiptno;
	}

	
	public String getAccoounttype() {
		return accoounttype;
	}

	public void setAccoounttype(String accoounttype) {
		this.accoounttype = accoounttype;
	}

	public String getAccountno() {
		return accountno;
	}

	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public long getCell() {
		return cell;
	}

	public void setCell(long cell) {
		this.cell = cell;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public int getThousand() {
		return thousand;
	}

	public void setThousand(int thousand) {
		this.thousand = thousand;
	}

	public int getFivehundered() {
		return fivehundered;
	}

	public void setFivehundered(int fivehundered) {
		this.fivehundered = fivehundered;
	}

	public int getHundered() {
		return hundered;
	}

	public void setHundered(int hundered) {
		this.hundered = hundered;
	}

	public int getFifty() {
		return fifty;
	}

	public void setFifty(int fifty) {
		this.fifty = fifty;
	}

	public int getTwenty() {
		return twenty;
	}

	public void setTwenty(int twenty) {
		this.twenty = twenty;
	}

	public int getTen() {
		return ten;
	}

	public void setTen(int ten) {
		this.ten = ten;
	}

	public int getFive() {
		return five;
	}

	public void setFive(int five) {
		this.five = five;
	}

	public int getTwo() {
		return two;
	}

	public void setTwo(int two) {
		this.two = two;
	}

	public int getOne() {
		return one;
	}

	public void setOne(int one) {
		this.one = one;
	}

	public int getCoins() {
		return coins;
	}

	public void setCoins(int coins) {
		this.coins = coins;
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

	
	private Map<String, String> map = new HashMap<String, String>();
	private RecieptAccountService receiptService = null;
	@Override
	public String execute() {
		session = request.getSession();
		session.invalidate();
		session = null;
		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();
		
		try{
			receiptService = new RecieptAccountServiceImpl();
		ReceiptEntity receiptInfo = receiptService.addUser(branchname, branchcode, userName,memberid,receiptno,receiptdate,accoounttype,accountno,name,amount,cell,remarks,thousand,fivehundered,hundered ,fifty ,twenty,ten,five,two,one,coins);
		if (receiptInfo == null) {
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
				receiptService = new RecieptAccountServiceImpl();
				receiptService.addUser(branchname, branchcode, userName,memberid,receiptno,receiptdate,accoounttype,accountno,name,amount,cell,remarks,thousand,fivehundered,hundered ,fifty ,twenty,ten,five,two,one,coins);
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
	
	
	public String receiptList() {
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
				receiptService = new RecieptAccountServiceImpl();
				List<ReceiptEntity> receiptlist = receiptService.getReceiptInfo(reqDto);
				session.setAttribute("receiptlist", receiptlist);
				
				System.out.printf("list of Account:"+receiptlist);
				map.put("list", jss.serialize(receiptlist));
				map.put("fromDate", reqDto.getFromDate());
				map.put("toDate", reqDto.getToDate());
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

	
	
	public String getRecieptNo()
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
				receiptService = new RecieptAccountServiceImpl();
				
				List<ReceiptEntity> receiptlist = receiptService.getReceiptNo(todayDate);
				session.setAttribute("receiptnumberinc", receiptlist.size()+1);
				System.out.printf("list of Account:"+ receiptlist.size());
				map.put("list", jss.serialize(receiptlist));
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
	
	public String getAccountNameFromAccountNo(){
		receiptService = new RecieptAccountServiceImpl();
		String name =receiptService.getAccountNameFromAccountNo(accountno, "RegularShareEntity");
		if(name == null) {
			name = receiptService.getAccountNameFromAccountNo(accountno, "NominalShareEntity");
		}
		if(name == null) {
			name = receiptService.getAccountNameFromAccountNo(accountno, "AshareEntity");
		}
		if(name == null) {
			name = receiptService.getLedgerAccountEntityAccountNameFromAccountNo(accountno);
		}

		String jsondata = "";
		JSONSerializer jss = new JSONSerializer();
		if(name != null) {
			map.put("name",jss.serialize(name));
		}
		else {
			map.put("name",jss.serialize(""));
		}
		map.put("resultString", resultString);
		map.put("errorString", errorString);
		jsondata = jss.serialize(map);
		request.setAttribute("jsondata", jsondata);
		return "jsondata";
	}
	
	public String getCellFromAccountNo(){
		receiptService = new RecieptAccountServiceImpl();
	Long cell =receiptService.getCellFromAccountNo(accountno);
		String jsondata = "";
		JSONSerializer jss = new JSONSerializer();
		 map.put("cell",jss.serialize(cell));
		map.put("resultString", resultString);
		map.put("errorString", errorString);
		jsondata = jss.serialize(map);
		request.setAttribute("jsondata", jsondata);
		return "jsondata";
	}
	public String clearReceiptDao() {
		Calendar todayDate = Calendar.getInstance();
		session = request.getSession();
		JSONSerializer jss = new JSONSerializer();
		try{
			if(((String)session.getAttribute("timeout")) == null) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else if(((String)session.getAttribute("timeout")).equals("true")) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else {
				List<ReceiptEntity> receiptlist = receiptService.getReceiptNo(todayDate);
				session.setAttribute("receiptnumberinc", receiptlist.size()+1);
			}
		} catch (HibernateException e) {
			resultString = ERROR;
			if(e.getCause() == null) {
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
	
	public RecieptAccountService getReceiptService() {
		return receiptService;
	}

	public void setReceiptService(RecieptAccountService receiptService) {
		this.receiptService = receiptService;
	}


	@Override
	public RegularInfoDto getModel() {
		// TODO Auto-generated method stub
		return reqDto;
	}

	public Date getReceiptdate() {
		return receiptdate;
	}

	public void setReceiptdate(Date receiptdate) {
		this.receiptdate = receiptdate;
	}
}
