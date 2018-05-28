package com.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;




@Entity
@Table(name="fixeddeposit")
@NamedNativeQuery(name="getFixedInfo", query = "select * from fixeddeposit where accountopendate between :fromDate and :toDate ", resultClass=FixedDepositEntity.class )
public class FixedDepositEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
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
	@Temporal(value = TemporalType.DATE)
    @Column(name="accountopendate")
	private Date date;
	
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	
	

}
