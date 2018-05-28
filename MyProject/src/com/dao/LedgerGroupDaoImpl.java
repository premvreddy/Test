package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.common.HibernateUtil;
import com.entities.LedgerGroupEntity;


public class LedgerGroupDaoImpl implements LedgerGroupDao {
	@Override
	public void addUser(LedgerGroupEntity entity) {
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
	public List<LedgerGroupEntity> listLedger() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<LedgerGroupEntity> list = null;
		try {
			list = session.createQuery("FROM LedgerGroupEntity").list();
		} catch (HibernateException e) {
			throw e;
		} finally {
			session.close();
		}
		return list;
	}
	@SuppressWarnings("null")
	@Override
	public String getNameFromSubGroup(String groupname) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "select distinct maingroup from LedgerGroupEntity  where groupname = :groupname";
			Query query = session.createQuery(hql);
			query.setString("groupname", groupname);
			trx.commit();
			session.flush();
			return (String)query.uniqueResult();
		}
		catch(HibernateException e ) {
			if(trx != null) {
				trx.rollback();
			}
			else
			{
				trx.commit();
			}
			throw e;
		} finally {
			
			session.close();
		}
	}
}
	
