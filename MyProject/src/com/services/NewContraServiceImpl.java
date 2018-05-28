package com.services;

import java.util.Date;
import java.util.List;

import com.dao.NewContraDao;
import com.dao.NewContraDaoImpl;
import com.entities.NewContraEntity;

public class NewContraServiceImpl implements NewContraService {
	private NewContraDao dao = null;
	
	@Override
	public NewContraEntity addUser(String tNumber, String accountno,
			String reference, double credit, double debit, String narration,String branchname, String branchcode, Date tDate, String tType) {
		// TODO Auto-generated method stub
		dao = new NewContraDaoImpl();
		NewContraEntity entity=new NewContraEntity();
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
	public List<NewContraEntity> getContraInfo() {
		// TODO Auto-generated method stub
		dao =new NewContraDaoImpl();
		return dao.getContraInfo();
	}
	@Override
	public void deletecontra(int id, Class<NewContraEntity> class1) {
		// TODO Auto-generated method stub
		dao=new NewContraDaoImpl();
		NewContraEntity entity = new NewContraEntity();
		entity.setId(id);
		dao.deletecontra(id, class1);
	}
	/*@Override
	public List<Integer> getnewcontra() {
		// TODO Auto-generated method stub
		return null;
	}*/

}
