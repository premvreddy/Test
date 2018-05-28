package com.services;

import java.util.List;

import com.dao.LedgerGroupDao;
import com.dao.LedgerGroupDaoImpl;
import com.entities.LedgerGroupEntity;


public class LedgerGroupServiceImpl implements LedgerGroupService{
	private LedgerGroupDao dao = null;
	@Override
	public LedgerGroupEntity addUser(String branchname,String branchcode,String groupname, String subgroupname,String maingroup,String groupcode) {
		// TODO Auto-generated method stub
				dao = new LedgerGroupDaoImpl();
				LedgerGroupEntity entity = new LedgerGroupEntity();
				entity.setBranchname(branchname);
				entity.setBranchcode(branchcode);
				entity.setGroupname(groupname);
				entity.setSubgroupname(subgroupname);
				entity.setMaingroup(maingroup);
				entity.setGroupcode(groupcode);
							
				dao.addUser(entity);
				
				return entity;
	}
	@Override
	public List<LedgerGroupEntity> getLedgerList() {
		dao = new LedgerGroupDaoImpl();
		return dao.listLedger();
	}
	@Override
	public String getNameFromSubGroup(String groupname) {
	
		dao=new LedgerGroupDaoImpl();
		//LedgerGroupEntity entity = new LedgerGroupEntity();
		return dao.getNameFromSubGroup(groupname);
	}
	
}
