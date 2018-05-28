package com.services;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.dto.RegularInfoDto;
import com.entities.FixedDepositEntity;


public interface FixedDepositService {

	FixedDepositEntity adduser( String tDate,String memberid, String deposittype, String accountno, String fdaccountold, String name, String paddress, String occupation, String husbandname, int age, String resaddress, long resno, long mobileno, long aadharno, String panno, String deposiamount, String deposiperiod, String depositinterest, String dob, int minorage, String nmname, String nmaddress, String details, Date accountopendate);



	List<FixedDepositEntity> getFixedInfo(RegularInfoDto reqDto) throws ParseException;

	

	List<Integer> getmember();

	

	


}
