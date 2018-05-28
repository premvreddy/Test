package com.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.common.HibernateUtil;
import com.entities.PigmiHolderEntity;

public class PigmiHolderDaoImpl implements PigmiHolderDao {

	@Override
	public void adduser(PigmiHolderEntity entity) {
		Session session=HibernateUtil.getSessionFactory().openSession();
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
		
}	
		
	