package com.services;

import java.util.List;

import com.dao.BranchDao;
import com.dao.BranchDaoImpl;
import com.entities.BranchEntity;


public class BranchServiceImpl implements BranchService{

	private BranchDao dao=null;
	
	@Override
	public BranchEntity addUser(String bankname, String bankcode,
			String branchname, String branchcode, String address1,
			String address2, String address3, String address4, String city,
			String district, String state, String pin, long contactnumber) {
		// TODO Auto-generated method stub
		dao = new BranchDaoImpl();
		BranchEntity entity = new BranchEntity();
		entity.setBankname(bankname);
		entity.setBankcode(bankcode);
		entity.setBranchname(branchname);
		entity.setBranchcode(branchcode);
		entity.setAddress1(address1);
		entity.setAddress2(address2);
		entity.setAddress3(address3);
		entity.setAddress4(address4);
		entity.setCity(city);
		entity.setDistrict(district);
		entity.setState(state);
		entity.setPin(pin);
		entity.setContactnumber(contactnumber);
		 dao.addUser(entity);
		 
		 return entity;
	}

	@Override
	public List<BranchEntity> getBranchList() {
		dao = new BranchDaoImpl();
		return dao.listBranch();

}
}
