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
@Table(name = "vehicleloan")
@NamedNativeQuery(name="getRegularInfo", query = "select * from regularshare where accountopendate between :fromDate and :toDate", resultClass=RegularShareEntity.class )
public class VehicleLoanEntity implements Serializable{
	
		private static final long serialVersionUID = 1L;
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private int id;
		private String memberid;
		private String loanaccountnumber;
		private String loannumber;
		private String name;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
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
		private String paddress;
		private String coobligantname;
		private String professions;
		private String securites;
		private String permanentadd;
		private String make;
		private String article;
		private String priceofchasis;
		private String installment;
		private String commencing;
		@Temporal(value = TemporalType.DATE)
	    @Column(name="accountdate")
		private Date date;
		
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public String getMemberid() {
			return memberid;
		}
		public void setMemberid(String memberid) {
			this.memberid = memberid;
		}
		public String getOccupation() {
			return occupation;
		}

		public void setOccupation(String occupation) {
			this.occupation = occupation;
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
		public String getPaddress() {
			return paddress;
		}

		public void setPaddress(String paddress) {
			this.paddress = paddress;
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
		
		
}
