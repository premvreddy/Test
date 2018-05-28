package com.dao;

import java.util.List;

import com.entities.DraftJournalEntity;

public interface JournalDao {
	void addUser(DraftJournalEntity entity);

	List<DraftJournalEntity> getJournalInfo();

	void deletejournal(int id, Class<DraftJournalEntity> class1);

	/*List<DraftJournalEntity> getJournalNo(Calendar todayDate);*/
}
