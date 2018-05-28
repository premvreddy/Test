package com.services;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.dto.NominalInfoDto;
import com.entities.NominalShareEntity;

public interface NominalShareService {

	NominalShareEntity addUser(String bankname,String bankcode,String memberid,String accountno, String userName,String password,String name,String gender,int age,long phone,long res,long cell,String qualification,
			String caste,String occupation,String address,String paddress,long fsalary,long fbusiness,long frent,long fsource,String afhname,String idoccupation,String idaddress,String omembership,String ipapplicant,String membersociety,
			String nmname,String relation,String nmaddress,String name1,String accountno1,String name2,String accountno2, long shareamount, long openingbalance,
			String obtype,String subgroup,String maingroup,Date accountopendate,String dob,String pannumber,String aadhaarnumber,String flatno,String caddress2,String landmark,String city,String district,String state,String cpin,
			String pflatno,String paddress2,String plandmark,String pcity,String pdistrict,String ptate,String ppin);

	/*List<NominalShareEntity> getShareList();*/

	List<NominalShareEntity> getNominalInfo( NominalInfoDto nomDto) throws ParseException;

	void updateNominal(int slno, String bankname, String bankcode, String memberid, String accountno, String userName,
			String password, String name, String gender, int age, long phone, long res, long cell, String qualification,
			String caste, String occupation, String address, String paddress, long fsalary, long fbusiness, long frent,
			long fsource, String afhname, String idoccupation, String idaddress, String omembership, String ipapplicant,
			String membersociety, String nmname, String relation, String nmaddress, String name1, String accountno1,
			String name2, String accountno2, long shareamount, long openingbalance, String obtype, String subgroup,
			String maingroup);

	void deletenominalshare(int slno, Class<NominalShareEntity> class1);

	List<Integer> getmember();	
	
}











/*package com.services;

import com.entities.NominalShareEntity;

public interface NominalShareService {
	NominalShareEntity addUser(String bankname,String bankcode,String memberid,String accountno, String userName,String password,String name,String gender,int age,long phone,long res,long cell,String qualification,
			String caste,String occupation,String address,String paddress,long fsalary,long fbusiness,long frent,long fsource,String afhname,String idoccupation,String idaddress,String omembership,String ipapplicant,String membersociety,
			String nmname,String relation,String nmaddress,String name1,String accountno1,String name2,String accountno2);
}
*/