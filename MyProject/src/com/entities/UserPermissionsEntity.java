package com.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="user_perms")
public class UserPermissionsEntity  implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String permissionId;
	private String userName;
	private String homeAllAccess;
	private String homeEntryAccess;
	private String homeEditAccess;
	private String memberAllAccess;
	private String memberEntryAccess;
	private String memberEditAccess;
	private String depositAllAccess;
	private String depositEntryAccess;
	private String depositEditAccess;
	private String loansAllAccess;
	private String loansEntryAccess;
	private String loansEditAccess;
	private String pigmiAllAccess;
	private String pigmiEntryAccess;
	private String pigmiEditAccess;
	private String accountsAllAccess;
	private String accountsEntryAccess;
	private String accountsEditAccess;
	
	
	public String getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(String permissionId) {
		this.permissionId = permissionId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getHomeAllAccess() {
		return homeAllAccess;
	}
	public void setHomeAllAccess(String homeAllAccess) {
		this.homeAllAccess = homeAllAccess;
	}
	public String getHomeEntryAccess() {
		return homeEntryAccess;
	}
	public void setHomeEntryAccess(String homeEntryAccess) {
		this.homeEntryAccess = homeEntryAccess;
	}
	public String getHomeEditAccess() {
		return homeEditAccess;
	}
	public void setHomeEditAccess(String homeEditAccess) {
		this.homeEditAccess = homeEditAccess;
	}
	public String getMemberAllAccess() {
		return memberAllAccess;
	}
	public void setMemberAllAccess(String memberAllAccess) {
		this.memberAllAccess = memberAllAccess;
	}
	public String getMemberEntryAccess() {
		return memberEntryAccess;
	}
	public void setMemberEntryAccess(String memberEntryAccess) {
		this.memberEntryAccess = memberEntryAccess;
	}
	public String getMemberEditAccess() {
		return memberEditAccess;
	}
	public void setMemberEditAccess(String memberEditAccess) {
		this.memberEditAccess = memberEditAccess;
	}
	public String getDepositAllAccess() {
		return depositAllAccess;
	}
	public void setDepositAllAccess(String depositAllAccess) {
		this.depositAllAccess = depositAllAccess;
	}
	public String getDepositEntryAccess() {
		return depositEntryAccess;
	}
	public void setDepositEntryAccess(String depositEntryAccess) {
		this.depositEntryAccess = depositEntryAccess;
	}
	public String getDepositEditAccess() {
		return depositEditAccess;
	}
	public void setDepositEditAccess(String depositEditAccess) {
		this.depositEditAccess = depositEditAccess;
	}
	public String getLoansAllAccess() {
		return loansAllAccess;
	}
	public void setLoansAllAccess(String loansAllAccess) {
		this.loansAllAccess = loansAllAccess;
	}
	public String getLoansEntryAccess() {
		return loansEntryAccess;
	}
	public void setLoansEntryAccess(String loansEntryAccess) {
		this.loansEntryAccess = loansEntryAccess;
	}
	public String getLoansEditAccess() {
		return loansEditAccess;
	}
	public void setLoansEditAccess(String loansEditAccess) {
		this.loansEditAccess = loansEditAccess;
	}
	public String getPigmiAllAccess() {
		return pigmiAllAccess;
	}
	public void setPigmiAllAccess(String pigmiAllAccess) {
		this.pigmiAllAccess = pigmiAllAccess;
	}
	public String getPigmiEntryAccess() {
		return pigmiEntryAccess;
	}
	public void setPigmiEntryAccess(String pigmiEntryAccess) {
		this.pigmiEntryAccess = pigmiEntryAccess;
	}
	public String getPigmiEditAccess() {
		return pigmiEditAccess;
	}
	public void setPigmiEditAccess(String pigmiEditAccess) {
		this.pigmiEditAccess = pigmiEditAccess;
	}
	public String getAccountsAllAccess() {
		return accountsAllAccess;
	}
	public void setAccountsAllAccess(String accountsAllAccess) {
		this.accountsAllAccess = accountsAllAccess;
	}
	public String getAccountsEntryAccess() {
		return accountsEntryAccess;
	}
	public void setAccountsEntryAccess(String accountsEntryAccess) {
		this.accountsEntryAccess = accountsEntryAccess;
	}
	public String getAccountsEditAccess() {
		return accountsEditAccess;
	}
	public void setAccountsEditAccess(String accountsEditAccess) {
		this.accountsEditAccess = accountsEditAccess;
	}
	
	
	
}
