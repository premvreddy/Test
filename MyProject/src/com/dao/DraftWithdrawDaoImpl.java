package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.common.HibernateUtil;
import com.entities.DraftWithdrawEntity;

public class DraftWithdrawDaoImpl implements DraftWithdrawDao{

	@Override
	public void addUser(DraftWithdrawEntity entity) {
		// TODO Auto-generated method stub
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

	@SuppressWarnings("unchecked")
	@Override
	public List<DraftWithdrawEntity> getWithdrawInfo() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<DraftWithdrawEntity> list = null;
		try {
			list = session.createQuery("FROM DraftWithdrawEntity").list();
		} catch (HibernateException e) {
			throw e;
		} finally {
			session.close();
		}
		return list;
	}


}
