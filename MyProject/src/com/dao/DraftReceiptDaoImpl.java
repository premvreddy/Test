package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.common.HibernateUtil;
import com.entities.DraftDepositEntity;


public class DraftReceiptDaoImpl implements DraftReceiptDao{

	@Override
	public void addUser(DraftDepositEntity entity) {
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
	public List<DraftDepositEntity> getValidateInfo() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<DraftDepositEntity> list = null;
		try {
			list = session.createQuery("FROM DraftDepositEntity").list();
		} catch (HibernateException e) {
			throw e;
		} finally {
			session.close();
		}
		return list;
	}
		
}


