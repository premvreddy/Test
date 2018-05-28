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
@Table(name = "receipt")
@NamedNativeQuery(name="getReceiptInfo", query = "select * from receipt where receiptdate between :fromDate and :toDate", resultClass=ReceiptEntity.class )
public class ReceiptEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)

	private int slno;
//	private String bankname;
//	private String bankcode;
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
	@Temporal(value = TemporalType.DATE)
    @Column(name="receiptdate")
	private Date date;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
//	public String getBankname() {
//		return bankname;
//	}
//	public void setBankname(String bankname) {
//		this.bankname = bankname;
//	}
//	public String getBankcode() {
//		return bankcode;
//	}
//	public void setBankcode(String bankcode) {
//		this.bankcode = bankcode;
//	}
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
	public int getSlno() {
		return slno;
	}
	public void setSlno(int slno) {
		this.slno = slno;
	}
	
}
