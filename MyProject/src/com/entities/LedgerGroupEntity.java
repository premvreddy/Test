package com.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "ledgergroup")
public class LedgerGroupEntity implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	
	private int id;
	private String branchname;
	private String branchcode;
	private String groupname;
	private String subgroupname;
	private String maingroup;
	private String groupcode;
	
	public String getGroupcode() {
		return groupcode;
	}
	public void setGroupcode(String groupcode) {
		this.groupcode = groupcode;
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
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	
}
