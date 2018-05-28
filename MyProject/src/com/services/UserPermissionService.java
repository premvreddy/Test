package com.services;

import com.entities.UserPermissionsEntity;

public interface UserPermissionService {

	 UserPermissionsEntity getUserPermissions(String userName);
	 
	 void setUserPerm(String userName);
	 
	  void updateUserPerm(String userName,String homeAllAccess,String homeEntyAccess,String homeEditAccess,
				 String memberAllAccess,String memberEntryAccess, String memberEditAccess,String depositAllAccess,String depositEntryAccess,String depositEditAccess,
				 String loansAllAccess,String loansEntryAccess,String loansEditAccess,String pigmiAllAccess,String pigmiEntryAccess,String pigmiEditAccess,
				 String accountsAllAccess,String accountsEntryAccess,String accountsEditAccess);

	  void deleteUserPerms(String userName, Class<UserPermissionsEntity> class1);


}
