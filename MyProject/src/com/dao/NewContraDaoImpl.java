package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.common.HibernateUtil;
import com.entities.NewContraEntity;

public class NewContraDaoImpl implements NewContraDao {

	@Override
	public void addUser(NewContraEntity entity) {
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
	public List<NewContraEntity> getContraInfo() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<NewContraEntity> list = null;
		try {
			list = session.createQuery("FROM DraftContraEntity").list();
		} catch (HibernateException e) {
			throw e;
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public void deletecontra(int id, Class<NewContraEntity> class1) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "DELETE from DraftContraEntity  where id = :id";
			Query query = session.createQuery(hql);
 			query.setInteger("id", id);
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
