package com.actions;

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
import com.entities.FixedDepositEntity;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.services.FixedDepositService;
import com.services.FixedDepositServiceImpl;

import flexjson.JSONSerializer;

public class FixedDepositAction extends ActionSupport implements ServletRequestAware, ModelDriven<RegularInfoDto> {

	private static final long serialVersionUID = 1L;
	private HttpServletRequest request = null;

	private HttpSession session;
	private String resultString = SUCCESS;
	private String errorString = " ";

	@id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int slno;
	private String tDate;
	private String memberid;
	private String deposittype;
	private String accountno;
	private String fdaccountold;
	private String name;
	private String paddress;
	private String occupation;
	private String husbandname;
	private int age;
	private String resaddress;
	private long resno;
	private long mobileno;
	private long aadharno;
	private String panno;
	private String deposiamount;
	private String deposiperiod;
	private String depositinterest;
	private String dob;
	private int minorage;
	private String nmname;
	private String nmaddress;
	private String details;

	public HttpServletRequest getRequest() {
		return request;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	public String getResultString() {
		return resultString;
	}

	public void setResultString(String resultString) {
		this.resultString = resultString;
	}

	public void setErrorString(String errorString) {
		this.errorString = errorString;
	}

	public int getSlno() {
		return slno;
	}

	public void setSlno(int slno) {
		this.slno = slno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPaddress() {
		return paddress;
	}

	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String gettDate() {
		return tDate;
	}

	public void settDate(String tDate) {
		this.tDate = tDate;
	}

	public String getDeposittype() {
		return deposittype;
	}

	public void setDeposittype(String deposittype) {
		this.deposittype = deposittype;
	}

	public String getAccountno() {
		return accountno;
	}

	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}

	public String getFdaccountold() {
		return fdaccountold;
	}

	public void setFdaccountold(String fdaccountold) {
		this.fdaccountold = fdaccountold;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
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

	public String getResaddress() {
		return resaddress;
	}

	public void setResaddress(String resaddress) {
		this.resaddress = resaddress;
	}

	public long getResno() {
		return resno;
	}

	public void setResno(long resno) {
		this.resno = resno;
	}

	public long getMobileno() {
		return mobileno;
	}

	public void setMobileno(long mobileno) {
		this.mobileno = mobileno;
	}

	public long getAadharno() {
		return aadharno;
	}

	public void setAadharno(long aadharno) {
		this.aadharno = aadharno;
	}

	public String getPanno() {
		return panno;
	}

	public void setPanno(String panno) {
		this.panno = panno;
	}

	public String getDeposiamount() {
		return deposiamount;
	}

	public void setDeposiamount(String deposiamount) {
		this.deposiamount = deposiamount;
	}

	public String getDeposiperiod() {
		return deposiperiod;
	}

	public void setDeposiperiod(String deposiperiod) {
		this.deposiperiod = deposiperiod;
	}

	public String getDepositinterest() {
		return depositinterest;
	}

	public void setDepositinterest(String depositinterest) {
		this.depositinterest = depositinterest;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public int getMinorage() {
		return minorage;
	}

	public void setMinorage(int minorage) {
		this.minorage = minorage;
	}

	public String getNmname() {
		return nmname;
	}

	public void setNmname(String nmname) {
		this.nmname = nmname;
	}

	public String getNmaddress() {
		return nmaddress;
	}

	public void setNmaddress(String nmaddress) {
		this.nmaddress = nmaddress;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	private Date accountopendate;

	public Date getAccountopendate() {
		return accountopendate;
	}

	public void setAccountopendate(Date accountopendate) {
		this.accountopendate = accountopendate;
	}

	RegularInfoDto reqDto = new RegularInfoDto();
	private Map<String, String> map = new HashMap<String, String>();
	private FixedDepositService service = null;

	@Override
	public String execute() {

		/*
		 * session=request.getSession(); session.invalidate(); session=null;
		 */
		session = request.getSession();
		Map<String, String> map = new HashMap<String, String>();

		try {
			service = new FixedDepositServiceImpl();
			FixedDepositEntity sinfo = service.adduser(tDate, memberid, deposittype, accountno, fdaccountold, name,
					paddress, occupation, husbandname, age, resaddress, resno, mobileno, aadharno, panno, deposiamount,
					deposiperiod, depositinterest, dob, minorage, nmname, nmaddress, details, accountopendate);
			if (sinfo == null) {
				resultString = ERROR;
				errorString = "Invalid User Id";
				session.setAttribute("timeout", null);
			}
		} catch (Exception e) {
			resultString = ERROR;
			errorString = e.getMessage();
			e.printStackTrace();
		}
		String jsondata = "";
		JSONSerializer jss = new JSONSerializer();
		map.put(resultString, resultString);
		map.put(errorString, errorString);
		jsondata = jss.serialize(map);
		request.setAttribute(jsondata, jsondata);
		return jsondata;
	}

	public String addUser() {
		session = request.getSession();
		JSONSerializer jss = new JSONSerializer();

		try {

			service = new FixedDepositServiceImpl();
			service.adduser(tDate, memberid, deposittype, accountno, fdaccountold, name, paddress, occupation,
					husbandname, age, resaddress, resno, mobileno, aadharno, panno, deposiamount, deposiperiod,
					depositinterest, dob, minorage, nmname, nmaddress, details, accountopendate);

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

	public String fixedDetailList() {
		session = request.getSession();
		JSONSerializer jss = new JSONSerializer();
		try {
			service = new FixedDepositServiceImpl();
			List<FixedDepositEntity> info = service.getFixedInfo(reqDto);
			session.setAttribute("fixedlist", info);
			map.put("info", jss.serialize(info));
			map.put("fromDate", reqDto.getFromDate());
			map.put("toDate", reqDto.getToDate());

			// session.invalidate();

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

	public String FixedDepositList() {
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
				service = new FixedDepositServiceImpl();
				List<Integer> memberid = service.getmember();
				Integer memberidi = memberid.get(memberid.size() - 1);
				session.setAttribute("fixedsize", memberidi);
				// session.setAttribute("rlist", id.size());
				// session.setAttribute("memberSize", list.size());
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

	@Override
	public RegularInfoDto getModel() {
		// TODO Auto-generated method stub
		return null;
	}


}
