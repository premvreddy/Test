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
import com.dto.VehicleInfoDto;
import com.entities.AshareEntity;
import com.entities.NominalShareEntity;
import com.entities.RegularShareEntity;
import com.entities.VehicleLoanEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.services.VehicleLoanService;
import com.services.VehicleLoanServiceImpl;

import flexjson.JSONSerializer;

public class VehicleLoanAction extends ActionSupport implements ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request = null;
	private HttpSession session;
	private String resultString = SUCCESS;
	private String errorString = "";
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String memberid;
	private String loanaccountnumber;
	private String loannumber;
	private int age;
	private String occupation;
	private String nationality;
	private String income;
	private String makevehicle;
	private String usepurpose;
	private String normalpurpose;
	private String fathersname;
	private String accidentsoccurred;
	private String bankrupt;
	private String property;
	private String contract;
	private String nameandaddress;
	private String coobligantname;
	private String professions;
	private String securites;
	private String permanentadd;
	private String make;
	private String article;
	private String priceofchasis;
	private String installment;
	private String commencing;
	private String paddress;
	private String name;
	private Date accountdate;
	
	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	private VehicleInfoDto vldto = new VehicleInfoDto();
	
	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getPaddress() {
		return paddress;
	}

	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLoanaccountnumber() {
		return loanaccountnumber;
	}

	public void setLoanaccountnumber(String loanaccountnumber) {
		this.loanaccountnumber = loanaccountnumber;
	}

	public String getLoannumber() {
		return loannumber;
	}

	public void setLoannumber(String loannumber) {
		this.loannumber = loannumber;
	}
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getIncome() {
		return income;
	}

	public void setIncome(String income) {
		this.income = income;
	}

	public String getMakevehicle() {
		return makevehicle;
	}

	public void setMakevehicle(String makevehicle) {
		this.makevehicle = makevehicle;
	}

	public String getUsepurpose() {
		return usepurpose;
	}

	public void setUsepurpose(String usepurpose) {
		this.usepurpose = usepurpose;
	}

	public String getNormalpurpose() {
		return normalpurpose;
	}

	public void setNormalpurpose(String normalpurpose) {
		this.normalpurpose = normalpurpose;
	}

	public String getFathersname() {
		return fathersname;
	}

	public void setFathersname(String fathersname) {
		this.fathersname = fathersname;
	}

	public String getAccidentsoccurred() {
		return accidentsoccurred;
	}

	public void setAccidentsoccurred(String accidentsoccurred) {
		this.accidentsoccurred = accidentsoccurred;
	}

	public String getBankrupt() {
		return bankrupt;
	}

	public void setBankrupt(String bankrupt) {
		this.bankrupt = bankrupt;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public String getContract() {
		return contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	public String getNameandaddress() {
		return nameandaddress;
	}

	public void setNameandaddress(String nameandaddress) {
		this.nameandaddress = nameandaddress;
	}
	public Date getAccountdate() {
		return accountdate;
	}

	public void setAccountdate(Date accountdate) {
		this.accountdate = accountdate;
	}

	public String getCoobligantname() {
		return coobligantname;
	}

	public void setCoobligantname(String coobligantname) {
		this.coobligantname = coobligantname;
	}

	public String getProfessions() {
		return professions;
	}

	public void setProfessions(String professions) {
		this.professions = professions;
	}

	public String getSecurites() {
		return securites;
	}

	public void setSecurites(String securites) {
		this.securites = securites;
	}

	public String getPermanentadd() {
		return permanentadd;
	}

	public void setPermanentadd(String permanentadd) {
		this.permanentadd = permanentadd;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public String getPriceofchasis() {
		return priceofchasis;
	}

	public void setPriceofchasis(String priceofchasis) {
		this.priceofchasis = priceofchasis;
	}

	public String getInstallment() {
		return installment;
	}

	public void setInstallment(String installment) {
		this.installment = installment;
	}

	public String getCommencing() {
		return commencing;
	}

	public void setCommencing(String commencing) {
		this.commencing = commencing;
	}
	

	private Map<String, String> map = new HashMap<String, String>();
	private VehicleLoanService vehicleloanservice = null;

	@Override
	public String execute() {
		session = request.getSession();
		session.invalidate();
		session = null;
		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();

		try {
			vehicleloanservice = new VehicleLoanServiceImpl();
			VehicleLoanEntity vehicleloanentity = vehicleloanservice.adduser(memberid, loanaccountnumber, loannumber,
					name, age, occupation, nationality, income, makevehicle, usepurpose, normalpurpose,
					fathersname, accidentsoccurred, bankrupt, property, contract, nameandaddress, paddress,
					coobligantname, professions, securites, permanentadd, make, article, priceofchasis, installment,
					commencing,accountdate);
			if (vehicleloanentity == null) {
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

	

	public String vehicleList() {
		session = request.getSession();
		vehicleloanservice = new VehicleLoanServiceImpl();
		List<String> Memberid = new ArrayList<String>();
		List<NominalShareEntity> list2 = vehicleloanservice.nominallist();
		for (NominalShareEntity c : list2) {
			if (c.getMemberid() != null) {
				Memberid.add(c.getMemberid());
			}
		}
		vehicleloanservice = new VehicleLoanServiceImpl();

		List<RegularShareEntity> regularinfo = vehicleloanservice.RegularList();
		List<String> Memberid1 = new ArrayList<String>();
	    for(RegularShareEntity c : regularinfo){
	    	if(c.getMemberid() != null) {
	    		Memberid.add(c.getMemberid());
	    	}
	    }
	    List<AshareEntity> list3 = vehicleloanservice.ashareList();
		List<String> Memberid2 = new ArrayList<String>();
	    for(AshareEntity c : list3){
	    	if(c.getAccountno() != null) {
	    		Memberid.add(c.getAccountno());
	    	}
	    }
	    
		session.setAttribute("vehicleacclist", Memberid);
		String jsondata = "";
		JSONSerializer jss = new JSONSerializer();
		map.put("accountnoList", jss.serialize(Memberid));
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
				vehicleloanservice  = new VehicleLoanServiceImpl();
				List<RegularShareEntity> infoList = vehicleloanservice.getregularname(memberid);
				if(infoList != null && infoList.size() > 0) {
					map.put("entityName", jss.serialize(infoList.get(0).getName()));
					map.put("entityName2", jss.serialize(infoList.get(0).getPaddress()));
					map.put("entityName3", jss.serialize(infoList.get(0).getOccupation()));
					map.put("entityName4", jss.serialize(infoList.get(0).getAge()));
				}
				
				if(map.get("entityName").contains(" ")) {
					List<NominalShareEntity> nominalShareInfoList = vehicleloanservice.getNominalShareNameFromAccount(memberid);
					
					if(nominalShareInfoList != null) {
						map.put("entityName", jss.serialize(nominalShareInfoList.get(0).getName()));
						map.put("entityName2", jss.serialize(nominalShareInfoList.get(0).getPaddress()));
						map.put("entityName3", jss.serialize(nominalShareInfoList.get(0).getOccupation()));
						map.put("entityName4", jss.serialize(nominalShareInfoList.get(0).getAge()));
					}
				}
				
				if(map.get("entityName").contains(" ")) {
					List<AshareEntity> ashareInfoList = vehicleloanservice.getAsharename(memberid);
					
					if(ashareInfoList != null) {
						map.put("entityName", jss.serialize(ashareInfoList.get(0).getName()));
						map.put("entityName2", jss.serialize(ashareInfoList.get(0).getPaddress()));
						map.put("entityName3", jss.serialize(ashareInfoList.get(0).getOccupation()));
						map.put("entityName4", jss.serialize(ashareInfoList.get(0).getAge()));
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
	
	public String GetVehicleList(){
		session=request.getSession();
		JSONSerializer jss=new JSONSerializer();
		try{
			
			vehicleloanservice =new VehicleLoanServiceImpl();
				
				List<VehicleLoanEntity> info = vehicleloanservice.GetVehicleInfo(vldto);
				session.setAttribute("vehiclelist", info);
				map.put("info", jss.serialize(info));
				map.put("fromDate", vldto.getFromDate());
				map.put("toDate", vldto.getToDate());
				//session.invalidate();
			}catch (HibernateException e) {
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

	
	
	public String vehiclememberList() {
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
				vehicleloanservice = new VehicleLoanServiceImpl();
				List<Integer> memberid = vehicleloanservice.getmember();
				Integer memberidi = memberid.get(memberid.size() - 1);
				session.setAttribute("membersize", memberidi);
				
				map.put("list", jss.serialize(memberidi));
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

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}


}

