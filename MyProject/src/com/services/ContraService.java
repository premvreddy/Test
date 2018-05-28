package com.services;

import java.util.Date;
import java.util.List;

import com.entities.DraftContraEntity;


public interface ContraService {

	List<DraftContraEntity> getContraInfo();

	void deletecontra(int id, Class<DraftContraEntity> class1);

	DraftContraEntity addUser(String tNumber, String accountno,
			String reference, double credit, double debit, String narration,
			String branchname, String branchcode, Date tDate, String tType);

	

}
