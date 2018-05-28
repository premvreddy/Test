package com.services;

import com.dao.UserPermissionDao;
import com.dao.UserPermissionDaoImpl;
import com.entities.UserPermissionsEntity;

public class UserPermissionServiceImpl  implements UserPermissionService{

	private UserPermissionDao  dao= null;
	
	
	@Override
	public UserPermissionsEntity getUserPermissions(String userName) {
		dao = new UserPermissionDaoImpl();
		return dao.getUserPermissions(userName);
	}

	@Override
	public void setUserPerm(String userName) {
		dao = new UserPermissionDaoImpl();
		UserPermissionsEntity entity = new UserPermissionsEntity();
		System.out.println(userName);
		entity.setHomeAllAccess("N");
		entity.setHomeEntryAccess("N");
		entity.setHomeEditAccess("N");
		entity.setMemberAllAccess("N");
		entity.setMemberEntryAccess("N");
		entity.setMemberEditAccess("N");
		entity.setDepositAllAccess("N");
		entity.setDepositEntryAccess("N");
		entity.setDepositEditAccess("N");
		entity.setLoansAllAccess("N");
		entity.setLoansEntryAccess("N");
		entity.setLoansEditAccess("N");
		entity.setPigmiAllAccess("N");
		entity.setPigmiEntryAccess("N");
		entity.setPigmiEditAccess("N");
		entity.setAccountsAllAccess("N");
		entity.setAccountsEntryAccess("N");
		entity.setAccountsEditAccess("N");
		entity.setUserName(userName);
		dao.setUserPerm(entity);	
		
	}

	@Override
	public void updateUserPerm(String userName,String homeAllAccess,String homeEntryAccess,String homeEditAccess,
			String memberAllAccess, String memberEntryAccess, String memberEditAccess, String depositAllAccess,
			String depositEntryAccess,String depositEditAccess,String loansAllAccess, String loansEntryAccess, 
			String loansEditAccess, String pigmiAllAccess, String pigmiEntryAccess,String pigmiEditAccess,
			String accountsAllAccess, String accountsEntryAccess,String accountsEditAccess) {
		dao = new UserPermissionDaoImpl();
		UserPermissionsEntity entity = new UserPermissionsEntity();
		 entity.setHomeAllAccess(homeAllAccess);
		 entity.setHomeEntryAccess(homeEntryAccess);
		 entity.setHomeEditAccess(homeEditAccess);
		 entity.setMemberAllAccess(memberAllAccess);
		 entity.setMemberEntryAccess(memberEntryAccess);
		 entity.setMemberEditAccess(memberEditAccess);
		 entity.setDepositAllAccess(depositAllAccess);
		 entity.setDepositEntryAccess(depositEntryAccess);
		 entity.setDepositEditAccess(depositEditAccess);
		 entity.setLoansAllAccess(loansAllAccess);
		 entity.setLoansEntryAccess(loansEntryAccess);
		 entity.setLoansEditAccess(loansEditAccess);
		 entity.setPigmiAllAccess(pigmiAllAccess);
		 entity.setPigmiEntryAccess(pigmiEntryAccess);
		 entity.setPigmiEditAccess(pigmiEditAccess);
		 entity.setAccountsAllAccess(accountsAllAccess);
		 entity.setAccountsEntryAccess(accountsEntryAccess);
		 entity.setAccountsEditAccess(accountsEditAccess);
		
		dao.updateUserPermissions(userName, entity);
		
	}

	@Override
	public void deleteUserPerms(String userName, Class<UserPermissionsEntity> class1) {
		dao = new UserPermissionDaoImpl();
		UserPermissionsEntity entity = new UserPermissionsEntity();
		entity.setUserName(userName);;
		dao.deleteUserPerms(userName, class1);
		
	}

}
