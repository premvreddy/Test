package com.actions;

import java.util.ArrayList;
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
import com.entities.AshareEntity;
import com.entities.NominalShareEntity;
import com.entities.PersonalLoanEntity;
import com.entities.RegularShareEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.services.PersonalLoanService;
import com.services.PersonalLoanServiceImpl;

import flexjson.JSONSerializer;

public class PersonalLoanAction extends ActionSupport implements ServletRequestAware {

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
	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	private String memberid;
	private String loantype;
	private String loanaccountno;
	private String loannumber;
	
	private String name;
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private String husbandname;
	private int age;
	private String occupation;
	private String phone;
	private String residentialnumber;
	public String getCell() {
		return cell;
	}

	public void setCell(String cell) {
		this.cell = cell;
	}

	private String cell;
	private String memberofcommittee;
	private String belongsSCST;
	private String monthlyincome;
	private String incomecertificate;
	private String immovableproperty;
	private String estimatedproperty;
	private String loanduration;
	private String loanpurpose;
	private String memberofsociety;
	private long officeaddress;
	public String getPaddress() {
		return paddress;
	}

	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}

	private String paddress;
   
	private String memidone;
	public String getMemidone() {
		return memidone;
	}

	public void setMemidone(String memidone) {
		this.memidone = memidone;
	}

	public String getMemberidstwo() {
		return memberidstwo;
	}

	public void setMemberidstwo(String memberidstwo) {
		this.memberidstwo = memberidstwo;
	}

	private String custnameone;
	private String husbnameone;
	private int ageone;
	private String resnumberone;
	private String mobnumberone;
	private String membercommitteeone;
	private String SCSTone;
	private String mincomeone;
	private String salaryone;
	private String immovablepropsone;
	private String estimatedpropsone;
	private long officeaddsone;
	private String resaddressone;

	private String memberidstwo;
	private String customernamestwo;
	private String husbandnamestwo;
	private int agestwo;
	private String resnostwo;
	private String mobilenostwo;
	private String committeestwo;
	private String SCSTtwo;
	private String mincomestwo;
	private String Salarystwo;
	private String ImmovablePropertystwo;
	private String estimatedpropstwo;
	private long officestwo;
	private String resdstwo;
	

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLoantype() {
		return loantype;
	}

	public void setLoantype(String loantype) {
		this.loantype = loantype;
	}

	public String getLoanaccountno() {
		return loanaccountno;
	}

	public void setLoanaccountno(String loanaccountno) {
		this.loanaccountno = loanaccountno;
	}

	public String getLoannumber() {
		return loannumber;
	}

	public void setLoannumber(String loannumber) {
		this.loannumber = loannumber;
	}

	
	public String getHusbandname() {
		return husbandname;
	}

	public void setHusbandname(String husbandname) {
		this.husbandname = husbandname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getResidentialnumber() {
		return residentialnumber;
	}

	public void setResidentialnumber(String residentialnumber) {
		this.residentialnumber = residentialnumber;
	}

	

	public String getMemberofcommittee() {
		return memberofcommittee;
	}

	public void setMemberofcommittee(String memberofcommittee) {
		this.memberofcommittee = memberofcommittee;
	}

	public String getBelongsSCST() {
		return belongsSCST;
	}

	public void setBelongsSCST(String belongsSCST) {
		this.belongsSCST = belongsSCST;
	}

	public String getMonthlyincome() {
		return monthlyincome;
	}

	public void setMonthlyincome(String monthlyincome) {
		this.monthlyincome = monthlyincome;
	}

	public String getIncomecertificate() {
		return incomecertificate;
	}

	public void setIncomecertificate(String incomecertificate) {
		this.incomecertificate = incomecertificate;
	}

	public String getImmovableproperty() {
		return immovableproperty;
	}

	public void setImmovableproperty(String immovableproperty) {
		this.immovableproperty = immovableproperty;
	}

	public String getEstimatedproperty() {
		return estimatedproperty;
	}

	public void setEstimatedproperty(String estimatedproperty) {
		this.estimatedproperty = estimatedproperty;
	}

	public String getLoanduration() {
		return loanduration;
	}

	public void setLoanduration(String loanduration) {
		this.loanduration = loanduration;
	}

	public String getLoanpurpose() {
		return loanpurpose;
	}

	public void setLoanpurpose(String loanpurpose) {
		this.loanpurpose = loanpurpose;
	}

	public String getMemberofsociety() {
		return memberofsociety;
	}

	public void setMemberofsociety(String memberofsociety) {
		this.memberofsociety = memberofsociety;
	}

	public long getOfficeaddress() {
		return officeaddress;
	}

	public void setOfficeaddress(long officeaddress) {
		this.officeaddress = officeaddress;
	}

	


	public String getCustnameone() {
		return custnameone;
	}

	public void setCustnameone(String custnameone) {
		this.custnameone = custnameone;
	}

	public String getHusbnameone() {
		return husbnameone;
	}

	public void setHusbnameone(String husbnameone) {
		this.husbnameone = husbnameone;
	}

	public int getAgeone() {
		return ageone;
	}

	public void setAgeone(int ageone) {
		this.ageone = ageone;
	}

	public String getResnumberone() {
		return resnumberone;
	}

	public void setResnumberone(String resnumberone) {
		this.resnumberone = resnumberone;
	}

	public String getMobnumberone() {
		return mobnumberone;
	}

	public void setMobnumberone(String mobnumberone) {
		this.mobnumberone = mobnumberone;
	}

	public String getMembercommitteeone() {
		return membercommitteeone;
	}

	public void setMembercommitteeone(String membercommitteeone) {
		this.membercommitteeone = membercommitteeone;
	}

	public String getSCSTone() {
		return SCSTone;
	}

	public void setSCSTone(String sCSTone) {
		SCSTone = sCSTone;
	}

	public String getMincomeone() {
		return mincomeone;
	}

	public void setMincomeone(String mincomeone) {
		this.mincomeone = mincomeone;
	}

	public String getSalaryone() {
		return salaryone;
	}

	public void setSalaryone(String salaryone) {
		this.salaryone = salaryone;
	}

	public String getImmovablepropsone() {
		return immovablepropsone;
	}

	public void setImmovablepropsone(String immovablepropsone) {
		this.immovablepropsone = immovablepropsone;
	}

	public String getEstimatedpropsone() {
		return estimatedpropsone;
	}

	public void setEstimatedpropsone(String estimatedpropsone) {
		this.estimatedpropsone = estimatedpropsone;
	}

	public long getOfficeaddsone() {
		return officeaddsone;
	}

	public void setOfficeaddsone(long officeaddsone) {
		this.officeaddsone = officeaddsone;
	}

	public String getResaddressone() {
		return resaddressone;
	}

	public void setResaddressone(String resaddressone) {
		this.resaddressone = resaddressone;
	}

	

	public String getCustomernamestwo() {
		return customernamestwo;
	}

	public void setCustomernamestwo(String customernamestwo) {
		this.customernamestwo = customernamestwo;
	}

	public String getHusbandnamestwo() {
		return husbandnamestwo;
	}

	public void setHusbandnamestwo(String husbandnamestwo) {
		this.husbandnamestwo = husbandnamestwo;
	}

	public int getAgestwo() {
		return agestwo;
	}

	public void setAgestwo(int agestwo) {
		this.agestwo = agestwo;
	}

	public String getResnostwo() {
		return resnostwo;
	}

	public void setResnostwo(String resnostwo) {
		this.resnostwo = resnostwo;
	}

	public String getMobilenostwo() {
		return mobilenostwo;
	}

	public void setMobilenostwo(String mobilenostwo) {
		this.mobilenostwo = mobilenostwo;
	}

	public String getCommitteestwo() {
		return committeestwo;
	}

	public void setCommitteestwo(String committeestwo) {
		this.committeestwo = committeestwo;
	}

	public String getSCSTtwo() {
		return SCSTtwo;
	}

	public void setSCSTtwo(String sCSTtwo) {
		SCSTtwo = sCSTtwo;
	}

	public String getMincomestwo() {
		return mincomestwo;
	}

	public void setMincomestwo(String mincomestwo) {
		this.mincomestwo = mincomestwo;
	}

	public String getSalarystwo() {
		return Salarystwo;
	}

	public void setSalarystwo(String salarystwo) {
		Salarystwo = salarystwo;
	}

	public String getImmovablePropertystwo() {
		return ImmovablePropertystwo;
	}

	public void setImmovablePropertystwo(String immovablePropertystwo) {
		ImmovablePropertystwo = immovablePropertystwo;
	}

	public String getEstimatedpropstwo() {
		return estimatedpropstwo;
	}

	public void setEstimatedpropstwo(String estimatedpropstwo) {
		this.estimatedpropstwo = estimatedpropstwo;
	}

	public long getOfficestwo() {
		return officestwo;
	}

	public void setOfficestwo(long officestwo) {
		this.officestwo = officestwo;
	}

	public String getResdstwo() {
		return resdstwo;
	}

	public void setResdstwo(String resdstwo) {
		this.resdstwo = resdstwo;
	}

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	private Map<String, String> map = new HashMap<String, String>();
	private PersonalLoanService personalLoanService = null;

	@Override
	public String execute() {

		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();

		try {
			personalLoanService = new PersonalLoanServiceImpl();
			PersonalLoanEntity personalLoanInfo = personalLoanService.addUser(memberid,loantype, loanaccountno, loannumber,
					name, husbandname, age, occupation, phone, residentialnumber, cell,
					memberofcommittee, belongsSCST, monthlyincome, incomecertificate, immovableproperty,
					estimatedproperty, loanduration, loanpurpose, memberofsociety, officeaddress, paddress,
					memidone, custnameone, husbnameone, ageone, resnumberone, mobnumberone, membercommitteeone, SCSTone,
					mincomeone, salaryone, immovablepropsone, estimatedpropsone, officeaddsone, resaddressone,
					memberidstwo, customernamestwo, husbandnamestwo, agestwo, resnostwo, mobilenostwo, committeestwo,
					SCSTtwo, mincomestwo, Salarystwo, ImmovablePropertystwo, estimatedpropstwo, officestwo, resdstwo);
			if (personalLoanInfo == null) {
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
	
	public String personallist() {
		session = request.getSession();
		personalLoanService = new PersonalLoanServiceImpl();
		List<String> Memberid = new ArrayList<String>();
		List<NominalShareEntity> list2 = personalLoanService.personalnominallist();
		for (NominalShareEntity c : list2) {
			if (c.getMemberid() != null) {
				Memberid.add(c.getMemberid());
			}
		}
		personalLoanService = new PersonalLoanServiceImpl();

		List<RegularShareEntity> regularinfo = personalLoanService.PersonalRegularList();
		List<String> Memberid1 = new ArrayList<String>();
	    for(RegularShareEntity c : regularinfo){
	    	if(c.getMemberid() != null) {
	    		Memberid1.add(c.getMemberid());
	    	}
	    }
	    List<AshareEntity> list3 = personalLoanService.PersonalashareList();
		List<String> Memberid2 = new ArrayList<String>();
	    for(AshareEntity c : list3){
	    	if(c.getAccountno() != null) {
	    		Memberid2.add(c.getAccountno());
	    	}
	    }
		session.setAttribute("personalacclist", Memberid);
		session.setAttribute("personalacclist1", Memberid1);
		session.setAttribute("personalacclist2", Memberid2);
		
		String jsondata = "";
		JSONSerializer jss = new JSONSerializer();
		map.put("accountnoList", jss.serialize(Memberid));
		map.put("resultString", resultString);
		map.put("errorString", errorString);
		jsondata = jss.serialize(map);
		request.setAttribute("jsondata", jsondata);
		return "jsondata";

	}
	
	public String personalnominalname(){
		
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
				personalLoanService  = new PersonalLoanServiceImpl();
				List<RegularShareEntity> infoList = personalLoanService.PersonalRegularName(memberid);
				if(infoList != null && infoList.size() > 0) {
					map.put("entityName", jss.serialize(infoList.get(0).getName()));
					map.put("entityName2", jss.serialize(infoList.get(0).getPaddress()));
					map.put("entityName3", jss.serialize(infoList.get(0).getOccupation()));
					map.put("entityName4", jss.serialize(infoList.get(0).getAge()));
				}
				
				if(map.get("entityName").contains(" ")) {
					List<NominalShareEntity> nominalShareInfoList = personalLoanService.PersonalNominalName(memberid);
					
					if(nominalShareInfoList != null) {
						map.put("entityName", jss.serialize(nominalShareInfoList.get(0).getName()));
						map.put("entityName2", jss.serialize(nominalShareInfoList.get(0).getPaddress()));
						map.put("entityName3", jss.serialize(nominalShareInfoList.get(0).getOccupation()));
						map.put("entityName4", jss.serialize(nominalShareInfoList.get(0).getAge()));
					}
				}
				
				if(map.get("entityName").contains(" ")) {
					List<AshareEntity> ashareInfoList = personalLoanService.AShareName(memberid);
					
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
	
		
	public String personalmemberList() {
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
				personalLoanService = new PersonalLoanServiceImpl();
				List<Integer> memberid = personalLoanService.getpersonalmember();
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
	
}
