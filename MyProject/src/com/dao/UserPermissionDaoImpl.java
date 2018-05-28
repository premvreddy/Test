package com.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.common.HibernateUtil;
import com.entities.UserPermissionsEntity;

public class UserPermissionDaoImpl implements UserPermissionDao{

	@Override
	public void updateUserPermissions(String userName,UserPermissionsEntity entity) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			
			trx = session.beginTransaction();
		
			String hql = "UPDATE  UserPermissionsEntity set homeAllAccess =:homeAllAccess,homeEntryAccess =:homeEntryAccess, homeEditAccess =:homeEditAccess, memberAllAccess =:memberAllAccess, memberEntryAccess =:memberEntryAccess, memberEditAccess =:memberEditAccess, depositAllAccess =:depositAllAccess, depositEntryAccess =:depositEntryAccess, depositEditAccess =:depositEditAccess, loansAllAccess =:loansAllAccess, loansEntryAccess =:loansEntryAccess, loansEditAccess =:loansEditAccess, pigmiAllAccess =:pigmiAllAccess, pigmiEntryAccess =:pigmiEntryAccess, pigmiEditAccess =:pigmiEditAccess, accountsAllAccess =:accountsAllAccess,accountsEntryAccess =:accountsEntryAccess, accountsEditAccess =:accountsEditAccess WHERE userName=:userName";
			
			Query query = session.createQuery(hql);
			query.setString("homeAllAccess",entity.getHomeAllAccess());
			query.setString("homeEntryAccess",entity.getHomeEntryAccess());
			query.setString("homeEditAccess",entity.getHomeEditAccess());
			query.setString("memberAllAccess",entity.getMemberAllAccess());
			query.setString("memberEntryAccess",entity.getMemberEntryAccess());
			query.setString("memberEditAccess",entity.getMemberEditAccess());
			query.setString("depositAllAccess",entity.getDepositAllAccess());
			query.setString("depositEntryAccess",entity.getDepositEntryAccess());
			query.setString("depositEditAccess",entity.getDepositEditAccess());
			query.setString("loansAllAccess", entity.getLoansAllAccess());
			query.setString("loansEntryAccess", entity.getLoansEntryAccess());
			query.setString("loansEditAccess", entity.getLoansEditAccess());
			query.setString("pigmiAllAccess", entity.getPigmiAllAccess());
			query.setString("pigmiEntryAccess",entity.getPigmiEntryAccess());
			query.setString("pigmiEditAccess", entity.getPigmiEditAccess());
			query.setString("accountsAllAccess", entity.getAccountsAllAccess());
			query.setString("accountsEntryAccess", entity.getAccountsEntryAccess());
			query.setString("accountsEditAccess", entity.getAccountsEditAccess());
			
			query.setString("userName", userName);
			query.executeUpdate();
			trx.commit();
			session.flush();
		} catch (HibernateException e) {
			if(trx != null) {
				trx.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public UserPermissionsEntity getUserPermissions(String userName) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		UserPermissionsEntity userPerms = null;
		try{
			String hql = "FROM UserPermissionsEntity where userName=:userName";
			Query query = session.createQuery(hql);
			query.setParameter("userName", userName);
			userPerms = (UserPermissionsEntity) query.uniqueResult();
		}
		catch(HibernateException e){
			throw e;
		}
		finally{
			session.close();
		}
		return userPerms;
	}

	@Override
	public void setUserPerm(UserPermissionsEntity entity) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			session.save(entity);
			trx.commit();
			session.flush();
		} catch (HibernateException e) {
			if(trx != null) {
				trx.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
		
	}

	@Override
	public void deleteUserPerms(String userName, Class<UserPermissionsEntity> class1) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "DELETE from UserPermissionsEntity  where username = :userName";
			Query query = session.createQuery(hql);
 			query.setString("userName", userName);
 			query.executeUpdate();
 			trx.commit();
 			session.flush();				
		} catch(HibernateException e) {
			if(trx != null) {
				trx.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
		
	}
	
	

}
