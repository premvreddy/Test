package com.services;

import java.util.Date;
import java.util.List;

import com.entities.DraftJournalEntity;

public interface JournalService {
	List<DraftJournalEntity> getJournalInfo();

	void deletejournal(int id, Class<DraftJournalEntity> class1);

	DraftJournalEntity addUser(String tNumber, String accountno,
			String reference, double credit, double debit, String narration,
			String bankname, String bankcode, Date tDate, String tType);


	/*List<DraftJournalEntity> getJournalNo(Calendar todayDate);*/
}
