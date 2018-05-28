package com.services;

import java.util.Date;
import java.util.List;

import com.dao.ContraDao;
import com.dao.ContraDaoImpl;
import com.entities.DraftContraEntity;

public class ContraServiceImpl implements ContraService {
	private ContraDao dao = null;
	@Override
	public DraftContraEntity addUser(String tNumber, String accountno,
			String reference, double credit, double debit, String narration,String branchname, String branchcode, Date tDate, String tType) {
		// TODO Auto-generated method stub
		dao = new ContraDaoImpl();
		DraftContraEntity entity=new DraftContraEntity();
		entity.settNumber(tNumber);
		entity.setAccountno(accountno);
		entity.setReference(reference);
		entity.setDebit(debit);
		entity.setCredit(credit);
		entity.setNarration(narration);
		entity.setBranchname(branchname);
		entity.setBranchcode(branchcode);
		entity.setDate(new Date());
		entity.settType(tType);
		dao.addUser(entity);
		return entity;
		
	}
	@Override
	public List<DraftContraEntity> getContraInfo() {
		// TODO Auto-generated method stub
		dao =new ContraDaoImpl();
		return dao.getContraInfo();
	}
	@Override
	public void deletecontra(int id, Class<DraftContraEntity> class1) {
		// TODO Auto-generated method stub
		dao=new ContraDaoImpl();
		DraftContraEntity entity = new DraftContraEntity();
		entity.setId(id);
		dao.deletecontra(id, class1);
	}

}
