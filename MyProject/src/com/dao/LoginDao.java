package com.dao;

import java.util.List;

import com.entities.UserInfoEntity;

public interface LoginDao {

	void addUser(UserInfoEntity entity);

	/*UserInfoEntity find(String userId);*/

	/*void updateUser(UserInfoEntity entity);*/

	List<UserInfoEntity> listLogin();

	UserInfoEntity validateLoginUser(String userName);

	void update(int userId, UserInfoEntity entity);

	void deleteaddusers(int userId, Class<UserInfoEntity> class1);


}
