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
import com.dto.LedgerInfoDto;
import com.entities.AshareEntity;
import com.entities.LedgerAccountEntity;
import com.entities.LedgerDetailEntity;
import com.entities.LedgerGroupEntity;
import com.entities.MemberDetailsEntity;
import com.entities.NominalShareEntity;
import com.entities.RegularShareEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.services.LedgerAccountService;
import com.services.LedgerAccountServiceImpl;
import com.services.LedgerGroupServiceImpl;

import flexjson.JSONSerializer;

public class LedgerAccountAction extends ActionSupport implements ModelDriven<LedgerInfoDto>,ServletRequestAware {

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
	private String subgroupname;
	private String maingroup;
	private String accountname;
	private String accountcode;
	private long openingbalance;
	private String type;
	private String accountno;
	
	public String getAccountno() {
		return accountno;
	}

	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	private LedgerInfoDto reqDto = new LedgerInfoDto();
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getAccountname() {
		return accountname;
	}

	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}

	public String getAccountcode() {
		return accountcode;
	}

	public void setAccountcode(String accountcode) {
		this.accountcode = accountcode;
	}

	public long getOpeningbalance() {
		return openingbalance;
	}

	public void setOpeningbalance(long openingbalance) {
		this.openingbalance = openingbalance;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	private Map<String, String> map = new HashMap<String, String>();
	private LedgerAccountService accountService = null;
	private LedgerGroupServiceImpl groupService = null;;
	@Override
	public String execute() {
		session = request.getSession();
		session.invalidate();
		session = null;
		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();
		
		try{
			accountService = new LedgerAccountServiceImpl();
		LedgerAccountEntity ledgerInfo = accountService.addUser(branchname,branchcode,subgroupname,maingroup,accountname,accountcode,openingbalance,type);
		if (ledgerInfo == null) {
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
				accountService = new LedgerAccountServiceImpl();
				accountService.addUser(branchname,branchcode,subgroupname,maingroup,accountname,accountcode,openingbalance,type);
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
	
	
	public String accountList() {
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
				accountService = new LedgerAccountServiceImpl();
				List<LedgerAccountEntity> list1 = accountService.getLedgerAccount();
				session.setAttribute("accountlist", list1);
				
				List<LedgerGroupEntity> list = new LedgerGroupServiceImpl().getLedgerList();
				session.setAttribute("lglist", list);
				System.out.printf("list of Account:"+list1);
				map.put("list", jss.serialize(list1));
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
	
	public String updateLedger(){
		
		session = request.getSession();
		JSONSerializer jss = new JSONSerializer();
		try {
			
			
			accountService = new LedgerAccountServiceImpl();
			accountService.updateLedger(id,branchname,branchcode,subgroupname,maingroup,accountname,accountcode, openingbalance,type);
			
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
	
	
	public String DeleteLedgerAccount() {
		session = request.getSession();
		try{
			
			accountService = new LedgerAccountServiceImpl();
			accountService.deleteledgeraccount(id, LedgerAccountEntity.class);
			
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
	public String LedgerDetailList() {
		session = request.getSession();
		JSONSerializer jss = new JSONSerializer();
		try {
			if (((String) session.getAttribute("timeout")) == null) {
				resultString = ERROR;
			
			} else if (((String) session.getAttribute("timeout")).equals("true")) {
				resultString = ERROR;
			
			} else {
				accountService = new LedgerAccountServiceImpl();
				List<LedgerDetailEntity> ledgerdetaillist = accountService.getLedgerInfo(reqDto,accountno);
				session.setAttribute("ldgdetaillist", ledgerdetaillist);
				map.put("accountnameaccountname", jss.serialize(ledgerdetaillist.get(0).getAccountname()));
				map.put("accountnumberaccountnumbers", jss.serialize(ledgerdetaillist.get(0).getAccountno()));
				System.out.printf("list of Account:"+ledgerdetaillist);
				map.put("list", jss.serialize(ledgerdetaillist));
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
	
	public String ledgerdList() {
		session = request.getSession();
				accountService = new LedgerAccountServiceImpl();
				List<RegularShareEntity> ledgerinfo = accountService.getLedgerDetailList();
				List<String> accountno = new ArrayList<String>();
			    for(RegularShareEntity c : ledgerinfo){
			    	if(c.getAccountno() != null) {
			    		accountno.add(c.getAccountno());
			    	}
			    }
			    
			    accountService = new LedgerAccountServiceImpl();
				List<LedgerAccountEntity> list1 = accountService.getLedgerAccount();
				List<String> accountno2 = new ArrayList<String>();
			    for(LedgerAccountEntity c : list1){
			    	if(c.getAccountcode() != null) {
			    		accountno.add(c.getAccountcode());
			    	}
			    }
			    
			    accountService = new LedgerAccountServiceImpl();
				List<NominalShareEntity> list2 = accountService.nominalShareList();
				List<String> accountno3 = new ArrayList<String>();
			    for(NominalShareEntity c : list2){
			    	if(c.getAccountno() != null) {
			    		accountno.add(c.getAccountno());
			    	}
			    }
			    
			    accountService = new LedgerAccountServiceImpl();
				List<AshareEntity> list3 = accountService.ashareList();
				List<String> accountno4 = new ArrayList<String>();
			    for(AshareEntity c : list3){
			    	if(c.getAccountno() != null) {
			    		accountno.add(c.getAccountno());
			    	}
			    }
			    
			   // session.setAttribute("accountlist", list2);
			    session.setAttribute("lgdlist", accountno);
				//session.setAttribute("lgdetaillist", ledgerinfo);
				   String jsondata = "";
					JSONSerializer jss = new JSONSerializer();
				    map.put("accountnoList",jss.serialize(accountno));
					map.put("resultString", resultString);
					map.put("errorString", errorString);
					jsondata = jss.serialize(map);
					request.setAttribute("jsondata", jsondata);
					return "jsondata";
			}
	
	
	public String getNameFromAccount(){
				
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
					map.put("entityName", jss.serialize(" "));
					accountService = new LedgerAccountServiceImpl();
					List<LedgerDetailEntity> infoList = accountService.getNameFromAccount(accountno);
					if(infoList != null && infoList.size() > 0) {
						map.put("entityName", jss.serialize(infoList.get(0).getAccountname()));
					}
					
					if(map.get("entityName").contains(" ")) {
						List<NominalShareEntity> nominalShareInfoList = accountService.getNominalShareNameFromAccount(accountno);
						
						if(nominalShareInfoList != null) {
							map.put("entityName", jss.serialize(nominalShareInfoList.get(0).getName()));
						}
					}
					
					if(map.get("entityName").contains(" ")) {
						List<AshareEntity> ashareInfoList = accountService.getAshareNameFromAccount(accountno);
						
						if(ashareInfoList != null) {
							map.put("entityName", jss.serialize(ashareInfoList.get(0).getName()));
						}
					}
					
					
					if(map.get("entityName").contains(" ")) {
						List<LedgerAccountEntity> laInfoList = accountService.getLedgerAccountNameFromAccount(accountcode);
						
						if(laInfoList != null) {
							map.put("entityName", jss.serialize(laInfoList.get(0).getAccountname()));
						}
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

	
	@Override
	public LedgerInfoDto getModel() {
		// TODO Auto-generated method stub
		return reqDto;
	}
	public String MemberDetailList() {
		session = request.getSession();
		JSONSerializer jss = new JSONSerializer();
		try {
			if (((String) session.getAttribute("timeout")) == null) {
				resultString = ERROR;
			
			} else if (((String) session.getAttribute("timeout")).equals("true")) {
				resultString = ERROR;
				
			} else {
				accountService = new LedgerAccountServiceImpl();
				List<MemberDetailsEntity> memberdetaillist = accountService.getMemberInfo(reqDto,accountno);
				session.setAttribute("memdetaillist", memberdetaillist);
				map.put("memberaccountname", jss.serialize(memberdetaillist.get(0).getAccountname()));
				map.put("memberaccountnumber", jss.serialize(memberdetaillist.get(0).getAccountno()));
				System.out.printf("list of Member:"+memberdetaillist);
				map.put("list", jss.serialize(memberdetaillist));
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
	public String memberList() {
		session = request.getSession();
				accountService = new LedgerAccountServiceImpl();
				List<RegularShareEntity> memberinfo = accountService.getLedgerDetailList();
				List<String> accountno = new ArrayList<String>();
			    for(RegularShareEntity c : memberinfo){
			    	if(c.getAccountno() != null) {
			    		accountno.add(c.getAccountno());
			    	}
			    }
				session.setAttribute("memberdetiallist1", memberinfo);
				   String jsondata = "";
					JSONSerializer jss = new JSONSerializer();
				    map.put("accountnoList",jss.serialize(accountno));
					map.put("resultString", resultString);
					map.put("errorString", errorString);
					jsondata = jss.serialize(map);
					request.setAttribute("jsondata", jsondata);
					return "jsondata";
}
	
	public String getNameacFromAccount() {
	 
		session = request.getSession();
		JSONSerializer jss = new JSONSerializer();
		try{
			if(((String)session.getAttribute("timeout")) == null) {
				resultString = ERROR;
			
			} else if(((String)session.getAttribute("timeout")).equals("true")) {
				resultString = ERROR;
				
			} else {
				accountService = new LedgerAccountServiceImpl();
				List<RegularShareEntity> infoList = accountService.getNameacFromAccount(accountno);
				map.put("entityName", jss.serialize(infoList.get(0).getName()));
				map.put("entityName2", jss.serialize(infoList.get(0).getAddress()));
				map.put("entityName3", jss.serialize(infoList.get(0).getCell()));
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
	
	
	public String clearledgerdetails()
	{
		session = request.getSession();
		JSONSerializer jss = new JSONSerializer();
		try{
			if(((String)session.getAttribute("timeout")) == null) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} else if(((String)session.getAttribute("timeout")).equals("true")) {
				resultString = ERROR;
				errorString = Constants.SESSION_TIMEOUT;
			} 
				 else {
					session.removeAttribute("ldgdetaillist");
					session.removeAttribute("memdetaillist");
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

}