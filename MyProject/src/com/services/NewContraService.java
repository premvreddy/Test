package com.services;

import java.util.Date;
import java.util.List;

import com.entities.NewContraEntity;


public interface NewContraService {

	List<NewContraEntity> getContraInfo();

	void deletecontra(int id, Class<NewContraEntity> class1);

	NewContraEntity addUser(String tNumber, String accountno,
			String reference, double credit, double debit, String narration,
			String branchname, String branchcode, Date tDate, String tType);

/*	List<Integer> getnewcontra();*/

}
