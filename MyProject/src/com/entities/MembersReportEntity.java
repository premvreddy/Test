package com.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.actions.slno;
@Entity
@Table(name = "membersreport")
@NamedNativeQuery(name="getmembersInfo", query = "select * from membersreport where  reportdate between :fromDate and :toDate and accountno like :accountno", resultClass=MembersReportEntity.class )
public class MembersReportEntity implements Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@slno
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int slno;
	private String name;
	@Temporal(value = TemporalType.DATE)
    @Column(name="reportdate")
	private Date date;
	private String accountno;
	private String memberid;
	private long cellno;
	private int age;
	private String gender;
	private String accounttype;
	
	public String getAccounttype() {
		return accounttype;
	}
	public void setAccounttype(String accounttype) {
		this.accounttype = accounttype;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getAccountno() {
		return accountno;
	}
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public long getCellno() {
		return cellno;
	}
	public void setCellno(long cellno) {
		this.cellno = cellno;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
	
}
