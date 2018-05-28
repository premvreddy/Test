package com.dao;

import com.entities.UserPermissionsEntity;

public interface UserPermissionDao {

	void updateUserPermissions(String userName, UserPermissionsEntity entity);

	UserPermissionsEntity getUserPermissions(String userName);

	 void setUserPerm(UserPermissionsEntity entity);
	 
	 void deleteUserPerms(String userName, Class<UserPermissionsEntity> class1);
}
