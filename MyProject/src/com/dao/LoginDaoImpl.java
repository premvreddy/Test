package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.common.HibernateUtil;
import com.entities.UserInfoEntity;

public class LoginDaoImpl implements LoginDao {

	@Override
	public void addUser(UserInfoEntity entity) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			session.save(entity);
			trx.commit();
			session.flush();
		} catch (HibernateException e) {
			trx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}

	/*@Override
	public UserInfoEntity find(String userId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		UserInfoEntity entity = (UserInfoEntity) session.get(UserInfoEntity.class, new String(userId));
		return entity;
	}
*/
	

	@SuppressWarnings("unchecked")
	@Override
	public List<UserInfoEntity> listLogin() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<UserInfoEntity> list = null;
		try {
			list = session.createQuery("FROM UserInfoEntity").list();
		} catch (HibernateException e) {
			throw e;
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public UserInfoEntity validateLoginUser(String userName) {
 		Session session = HibernateUtil.getSessionFactory().openSession();
		UserInfoEntity loginBean = null;
		try {
			session.beginTransaction();
			String hql = "from UserInfoEntity where userName = :userName and deleteFlag = '1'";
			Query query = session.createQuery(hql);
			query.setParameter("userName", userName);
			loginBean = (UserInfoEntity) query.uniqueResult();
		} catch (HibernateException e) {
			throw e;
		} finally {
			session.close();
		}
		return loginBean;
	}

/*	@Override
	public void delete(UserInfoEntity entity) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			session.delete(entity);
			trx.commit();
			session.flush();
		} catch (HibernateException e) {
			trx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}*/

	@Override
	public void update(int userId, UserInfoEntity entity) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			UserInfoEntity entity1 = (UserInfoEntity) session.get(UserInfoEntity.class, userId);
			entity1.setPassword(entity.getPassword());
			entity1.setUserName(entity.getUserName());
			entity1.setUserType(entity.getUserType());
			entity1.setEmployeeName(entity.getEmployeeName());
			entity1.setDesignation(entity.getDesignation());
			entity1.setMobilenumber(entity.getMobilenumber());
			entity1.setAge(entity.getAge());
			entity1.setBankname(entity.getBankname());
			entity1.setBranchname(entity.getBranchname());
			entity1.setEmployeeId(entity.getEmployeeId());
			entity1.setDateofbirth(entity.getDateofbirth());
			entity1.setDateofjoining(entity.getDateofjoining());
			entity1.setGender(entity.getGender());
			entity1.setHobbies(entity.getHobbies());
			entity1.setReqto(entity.getReqto());
			entity1.setFathername(entity.getFathername());
			entity1.setRaddress(entity.getRaddress());
			entity1.setCaddress(entity.getCaddress());
			entity1.setBloodgroup(entity.getBloodgroup());
			entity1.setResno(entity.getResno());
			entity1.setApname(entity.getApname());
			entity1.setApnumber(entity.getApnumber());
			entity1.setOtherdetails(entity.getOtherdetails());
			trx.commit();
			session.flush();
		}
		catch(HibernateException e) {
			trx.rollback();
			throw e;
		} 
		finally {
			session.close();
		}	
}

	@Override
	public void deleteaddusers(int userId, Class<UserInfoEntity> class1) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "DELETE from UserInfoEntity  where userId = :userId";
			Query query = session.createQuery(hql);
 			query.setInteger("userId", userId);
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