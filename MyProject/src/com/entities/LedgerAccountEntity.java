package com.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "ledgeraccount")
public class LedgerAccountEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id

	private int id;
	private String branchname;
	private String branchcode;
	private String subgroupname;
	private String maingroup;
	private String accountname;
	private String accountcode;
	private long openingbalance;
	private String type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
}
