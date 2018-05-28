package com.services;

import java.util.Date;
import java.util.List;

import com.dao.JournalDao;
import com.dao.JournalDaoImpl;
import com.entities.DraftJournalEntity;

public class JournalServiceImpl implements JournalService {
	private JournalDao dao = null;
	@Override
	public DraftJournalEntity addUser(String tNumber, String accountno,
			String reference, double credit, double debit, String narration,String bankname, String bankcode, Date tDate, String tType) {
		// TODO Auto-generated method stub
		dao = new JournalDaoImpl();
		DraftJournalEntity entity=new DraftJournalEntity();
		entity.settNumber(tNumber);
		entity.setAccountno(accountno);
		entity.setReference(reference);
		entity.setDebit(debit);
		entity.setCredit(credit);
		entity.setNarration(narration);
		entity.setBankname(bankname);
		entity.setBankcode(bankcode);
		entity.setDate(new Date());
		entity.settType(tType);
		
		dao.addUser(entity);
		return entity;
		
	}
	@Override
	public List<DraftJournalEntity> getJournalInfo() {
		// TODO Auto-generated method stub
		dao =new JournalDaoImpl();
		return dao.getJournalInfo();
	}
	@Override
	public void deletejournal(int id, Class<DraftJournalEntity> class1) {
		// TODO Auto-generated method stub
		dao=new JournalDaoImpl();
		DraftJournalEntity entity = new DraftJournalEntity();
		entity.setId(id);
		dao.deletejournal(id, class1);
	}
	/*@Override
	public List<DraftJournalEntity> getJournalNo(Calendar todayDate) {
		dao = new JournalDaoImpl();
		return dao.getJournalNo(todayDate);
	}
*/

}
