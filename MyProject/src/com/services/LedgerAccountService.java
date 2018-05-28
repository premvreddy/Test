package com.services;

import java.text.ParseException;
import java.util.List;

import com.dto.LedgerInfoDto;
import com.entities.AshareEntity;
import com.entities.LedgerAccountEntity;
import com.entities.LedgerDetailEntity;
import com.entities.MemberDetailsEntity;
import com.entities.NominalShareEntity;
import com.entities.RegularShareEntity;


public interface LedgerAccountService {
	LedgerAccountEntity addUser(String branchname,String branchcode,String subgroupname,String maingroup,String accountname,String accountcode,long openingbalance,String type);

	List<LedgerAccountEntity> getLedgerAccount();
	
	List<NominalShareEntity> nominalShareList();
	
	List<AshareEntity> ashareList();
	
	void updateLedger(int id, String branchname, String branchcode, String subgroupname, String maingroup,
			String accountname, String accountcode, long openingbalance, String type);

	void deleteledgeraccount(int id, Class<LedgerAccountEntity> class1);

	List<LedgerDetailEntity> getLedgerInfo(LedgerInfoDto reqDto,String accountno) throws ParseException;

	List<RegularShareEntity> getLedgerDetailList();
	

	List<LedgerDetailEntity> getNameFromAccount(String accountno);

	List<MemberDetailsEntity> getMemberInfo(LedgerInfoDto reqDto,
			String accountno) throws ParseException;

	List<RegularShareEntity> getNameacFromAccount(String accountno);

	List<LedgerAccountEntity> getNameFromAccount1();

	List<NominalShareEntity> getNominalShareNameFromAccount(String accountno);
	
	List<AshareEntity> getAshareNameFromAccount(String accountno);

	List<LedgerAccountEntity> getLedgerAccountNameFromAccount(String accountcode);

	

}

