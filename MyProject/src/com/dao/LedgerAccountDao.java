package com.dao;

import java.util.List;

import com.dto.LedgerInfoDto;
import com.entities.AshareEntity;
import com.entities.LedgerAccountEntity;
import com.entities.LedgerDetailEntity;
import com.entities.MemberDetailsEntity;
import com.entities.NominalShareEntity;
import com.entities.RegularShareEntity;


public interface LedgerAccountDao {
	void addUser(LedgerAccountEntity entity);

	List<LedgerAccountEntity> accountLedger();
	
	List<NominalShareEntity> nominalShareList();
	
	List<AshareEntity> ashareList();

	void update(int id, LedgerAccountEntity entity);

	void deleteledgeracc(int id, Class<LedgerAccountEntity> class1);

	List<LedgerDetailEntity> getLedgerInfo(LedgerInfoDto reqDto,String accountno);

	List<RegularShareEntity> getLedgerDetailList();

	List<LedgerDetailEntity> getNameFromAccount(String accountno);
	
	List<LedgerAccountEntity> getNameFromAccount1();

	List<MemberDetailsEntity> getmemberinfo(LedgerInfoDto reqDto,
			String accountno);

	List<RegularShareEntity> getNameacFromAccount(String accountno);

	List<NominalShareEntity> getNominalShareNameFromAccount(String accountno);
	
	List<AshareEntity> getAshareNameFromAccount(String accountno);
	
	List<LedgerAccountEntity> getLedgerAccountNameFromAccount(String accountcode);

	
	
}
