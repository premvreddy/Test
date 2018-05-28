package com.services;

import java.util.List;

import com.entities.BranchEntity;

public interface BranchService {

	

	public BranchEntity addUser(String bankname, String bankcode,
			String branchname, String branchcode, String address1,
			String address2, String address3, String address4, String city,
			String district, String state, String pin, long contactnumber);

	List<BranchEntity> getBranchList();
}
