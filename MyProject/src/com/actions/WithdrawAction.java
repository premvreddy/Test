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
import com.entities.WithdrawEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.services.WithdrawService;
import com.services.WithdrawServiceImpl;

import flexjson.JSONSerializer;

public class WithdrawAction extends ActionSupport implements ModelDriven<RegularInfoDto>, ServletRequestAware{

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

	private String withdrawno;
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
	private Date withdrawdate;
	
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
	private WithdrawService withdrawService = null;
	@Override
	public String execute() {
		session = request.getSession();
		session.invalidate();
		session = null;
		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();
		
		try{
			withdrawService = new WithdrawServiceImpl();
		WithdrawEntity withdrawInfo = withdrawService.addUser(branchname, branchcode, userName,memberid,withdrawno,withdrawdate,accoounttype,accountno,name,amount,cell,remarks,thousand,fivehundered,hundered ,fifty ,twenty,ten,five,two,one,coins);
		if (withdrawInfo == null) {
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
				withdrawService = new WithdrawServiceImpl();
				withdrawService.addUser(branchname, branchcode, userName,memberid,withdrawno,withdrawdate,accoounttype,accountno,name,amount,cell,remarks,thousand,fivehundered,hundered ,fifty ,twenty,ten,five,two,one,coins);
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
	
	
	public String WithdrawList() {
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
				withdrawService = new WithdrawServiceImpl();
				List<WithdrawEntity> withdrawlist = withdrawService.getWithdrawInfo(reqDto);
				session.setAttribute("withdrawlist", withdrawlist);
				session.setAttribute("withdrawlist1",withdrawlist);
				System.out.printf("list of Account:"+withdrawlist);
				map.put("list", jss.serialize(withdrawlist));
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

	
	
	/*public String getRecieptNo()
	{
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
				withdrawService = new WithdrawServiceImpl();
				List<ReceiptEntity> receiptlist = withdrawService.getReceiptNo();
				session.setAttribute("receiptlist", receiptlist);
				System.out.printf("list of Account:"+receiptlist);
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
	}*/
	
	
	public String getAccountNameFromAccountNo(){
		
		withdrawService = new WithdrawServiceImpl();
		String name =withdrawService.getAccountNameFromAccountNo(accountno, "RegularShareEntity");
		if(name == null) {
			name = withdrawService.getAccountNameFromAccountNo(accountno, "NominalShareEntity");
		}
		if(name == null) {
			name = withdrawService.getAccountNameFromAccountNo(accountno, "AshareEntity");
		}
		if(name == null) {
			name = withdrawService.getLedgerAccountEntityAccountNameFromAccountNo(accountno);
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
		
	
		/*withdrawService = new WithdrawServiceImpl();
	String name =withdrawService.getAccountNameFromAccountNo(accountno);
		String jsondata = "";
		JSONSerializer jss = new JSONSerializer();
		 map.put("name",jss.serialize(name));
		map.put("resultString", resultString);
		map.put("errorString", errorString);
		jsondata = jss.serialize(map);
		request.setAttribute("jsondata", jsondata);
		return "jsondata";
	}*/
	
	public String getCellFromAccountNo(){
		withdrawService = new WithdrawServiceImpl();
	Long cell =withdrawService.getCellFromAccountNo(accountno);
		String jsondata = "";
		JSONSerializer jss = new JSONSerializer();
		 map.put("cell",jss.serialize(cell));
		map.put("resultString", resultString);
		map.put("errorString", errorString);
		jsondata = jss.serialize(map);
		request.setAttribute("jsondata", jsondata);
		return "jsondata";
	}
	
	
	public String clearWithdrawDao() {
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
				if(withdrawno != null && withdrawno.length() > 2) {
					resultString = ERROR;
					errorString = "Invalid Invoice Number";
				} else {
					session.removeAttribute("withdrawlist");
				}
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
	
	public String getWithdrawNo()
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
				withdrawService = new WithdrawServiceImpl();
				
				List<WithdrawEntity> withdrawlist = withdrawService.getWithdrawNo(todayDate);
				session.setAttribute("withdrawnumberinc", withdrawlist.size()+1);
				System.out.printf("list :"+ withdrawlist.size());
				map.put("list", jss.serialize(withdrawlist));
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
	
	public WithdrawService getWithdrawService() {
		return withdrawService;
	}

	public void setWithdrawService(WithdrawService withdrawService) {
		this.withdrawService = withdrawService;
	}


	@Override
	public RegularInfoDto getModel() {
		// TODO Auto-generated method stub
		return reqDto;
	}

	
	public String getWithdrawno() {
		return withdrawno;
	}

	public void setWithdrawno(String withdrawno) {
		this.withdrawno = withdrawno;
	}

	public Date getWithdrawdate() {
		return withdrawdate;
	}

	public void setWithdrawdate(Date withdrawdate) {
		this.withdrawdate = withdrawdate;
	}
}
