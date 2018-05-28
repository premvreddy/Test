package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.common.HibernateUtil;
import com.entities.DraftJournalEntity;

public class JournalDaoImpl implements JournalDao {

	@Override
	public void addUser(DraftJournalEntity entity) {
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

	@Override
	@SuppressWarnings("unchecked")
	public List<DraftJournalEntity> getJournalInfo() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<DraftJournalEntity> list = null;
		try {
			list = session.createQuery("FROM DraftJournalEntity").list();
		} catch (HibernateException e) {
			throw e;
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public void deletejournal(int id, Class<DraftJournalEntity> class1) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "DELETE from DraftJournalEntity  where id = :id";
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

	/*@Override
	public List<DraftJournalEntity> getJournalNo(Calendar todayDate) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hqlQuery = "select distinct draftjournalentity from DraftJournalEntity draftjournalentity where tDate = ? ";
			Query query = session.createQuery(hqlQuery);
			query.setParameter(0, todayDate);
			trx.commit();
			session.flush();
			@SuppressWarnings("unchecked")
			List<DraftJournalEntity> resultList = query.list();
			return resultList;
		}
		catch(HibernateException e) {
			if(trx != null) {
				trx.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
		
	}*/

}
