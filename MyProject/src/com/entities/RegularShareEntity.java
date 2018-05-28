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
@Table(name = "regularshare")
@NamedNativeQuery(name="getVehicleInfo", query = "select * from vehicleloan where accountdate between :fromDate and :toDate", resultClass=VehicleLoanEntity.class )
public class RegularShareEntity implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int slno;
	private String bankname;
	private String bankcode;
	private String memberid;
	private String memberid1;
	private String accountno;
	private String userName;
	private String password;
	private String name;
	private String gender;
	private int age;
	private long phone;
	private long res;
	private long cell;
	private String qualification;
	private String caste;
	private String occupation;
	private String address;
	private String paddress;
	private long fsalary;
	private long fbusiness;
	private long frent;
	private long fsource;
	private String afhname;
	private String idoccupation;
	private String idaddress;
	private String omembership;
	private String ipapplicant;
	private String membersociety;
	private String nmname;
	private String relation;
	private String nmaddress;
	private String name1;
	private String accountno1;
	private String name2;
	private String accountno2;
	private long shareamount;
	private long openingbalance;
	private String obtype;
	private String subgroup;
	private String maingroup;
	@Temporal(value = TemporalType.DATE)
    @Column(name="accountopendate")
	private Date date;
	
	private String dob;
	private String pannumber;
	private String aadhaarnumber;
	
	private String flatno;
	private String caddress2;
	private String landmark;
	private String city;
	private String district;
	private String state;
	private String cpin;
	
	private String pflatno;
	public String getPflatno() {
		return pflatno;
	}
	public void setPflatno(String pflatno) {
		this.pflatno = pflatno;
	}
	public String getPaddress2() {
		return paddress2;
	}
	public void setPaddress2(String paddress2) {
		this.paddress2 = paddress2;
	}
	public String getPlandmark() {
		return plandmark;
	}
	public void setPlandmark(String plandmark) {
		this.plandmark = plandmark;
	}
	public String getPcity() {
		return pcity;
	}
	public void setPcity(String pcity) {
		this.pcity = pcity;
	}
	public String getPdistrict() {
		return pdistrict;
	}
	public void setPdistrict(String pdistrict) {
		this.pdistrict = pdistrict;
	}
	public String getPstate() {
		return pstate;
	}
	public void setPstate(String pstate) {
		this.pstate = pstate;
	}
	public String getPpin() {
		return ppin;
	}
	public void setPpin(String ppin) {
		this.ppin = ppin;
	}
	private String paddress2;
	private String plandmark;
	private String pcity;
	private String pdistrict;
	private String pstate;
	private String ppin;
	
	public String getFlatno() {
		return flatno;
	}
	public void setFlatno(String flatno) {
		this.flatno = flatno;
	}
	
	public String getCaddress2() {
		return caddress2;
	}
	public void setCaddress2(String caddress2) {
		this.caddress2 = caddress2;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCpin() {
		return cpin;
	}
	public void setCpin(String cpin) {
		this.cpin = cpin;
	}
	public String getAadhaarnumber() {
		return aadhaarnumber;
	}
	public void setAadhaarnumber(String aadhaarnumber) {
		this.aadhaarnumber = aadhaarnumber;
	}
	public String getPannumber() {
		return pannumber;
	}
	public void setPannumber(String pannumber) {
		this.pannumber = pannumber;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getSlno() {
		return slno;
	}
	public void setSlno(int slno) {
		this.slno = slno;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public String getBankcode() {
		return bankcode;
	}
	public void setBankcode(String bankcode) {
		this.bankcode = bankcode;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	
	
	public String getMemberid1() {
		return memberid1;
	}
	public void setMemberid1(String memberid1) {
		this.memberid1 = memberid1;
	}
	public String getAccountno() {
		return accountno;
	}
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public long getRes() {
		return res;
	}
	public void setRes(long res) {
		this.res = res;
	}
	public long getCell() {
		return cell;
	}
	public void setCell(long cell) {
		this.cell = cell;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getCaste() {
		return caste;
	}
	public void setCaste(String caste) {
		this.caste = caste;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getFsalary() {
		return fsalary;
	}
	public void setFsalary(long fsalary) {
		this.fsalary = fsalary;
	}
	public String getPaddress() {
		return paddress;
	}
	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}
	public long getFbusiness() {
		return fbusiness;
	}
	public void setFbusiness(long fbusiness) {
		this.fbusiness = fbusiness;
	}
	public long getFrent() {
		return frent;
	}
	public void setFrent(long frent) {
		this.frent = frent;
	}
	public long getFsource() {
		return fsource;
	}
	public void setFsource(long fsource) {
		this.fsource = fsource;
	}
	public String getAfhname() {
		return afhname;
	}
	public void setAfhname(String afhname) {
		this.afhname = afhname;
	}
	public String getIdoccupation() {
		return idoccupation;
	}
	public void setIdoccupation(String idoccupation) {
		this.idoccupation = idoccupation;
	}
	public String getIdaddress() {
		return idaddress;
	}
	public void setIdaddress(String idaddress) {
		this.idaddress = idaddress;
	}
	public String getOmembership() {
		return omembership;
	}
	public void setOmembership(String omembership) {
		this.omembership = omembership;
	}
	public String getIpapplicant() {
		return ipapplicant;
	}
	public void setIpapplicant(String ipapplicant) {
		this.ipapplicant = ipapplicant;
	}
	public String getMembersociety() {
		return membersociety;
	}
	public void setMembersociety(String membersociety) {
		this.membersociety = membersociety;
	}
	public String getNmname() {
		return nmname;
	}
	public void setNmname(String nmname) {
		this.nmname = nmname;
	}
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}
	public String getNmaddress() {
		return nmaddress;
	}
	public void setNmaddress(String nmaddress) {
		this.nmaddress = nmaddress;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getAccountno1() {
		return accountno1;
	}
	public void setAccountno1(String accountno1) {
		this.accountno1 = accountno1;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getAccountno2() {
		return accountno2;
	}
	public void setAccountno2(String accountno2) {
		this.accountno2 = accountno2;
	}
	public long getShareamount() {
		return shareamount;
	}
	public void setShareamount(long shareamount) {
		this.shareamount = shareamount;
	}
	public long getOpeningbalance() {
		return openingbalance;
	}
	public void setOpeningbalance(long openingbalance) {
		this.openingbalance = openingbalance;
	}
	public String getObtype() {
		return obtype;
	}
	public void setObtype(String obtype) {
		this.obtype = obtype;
	}
	public String getSubgroup() {
		return subgroup;
	}
	public void setSubgroup(String subgroup) {
		this.subgroup = subgroup;
	}
	public String getMaingroup() {
		return maingroup;
	}
	public void setMaingroup(String maingroup) {
		this.maingroup = maingroup;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	
	
	
}







