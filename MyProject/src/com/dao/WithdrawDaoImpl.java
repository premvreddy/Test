package com.dao;

import java.util.Calendar;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.TransactionException;

import com.common.HibernateUtil;
import com.dto.RegularInfoDto;
import com.entities.LedgerDetailEntity;
import com.entities.MemberDetailsEntity;
import com.entities.RejectWithdrawEntity;
import com.entities.WithdrawEntity;

public class WithdrawDaoImpl implements WithdrawDao {

	@Override
	public void addUser(WithdrawEntity entity) {
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
	public List<WithdrawEntity> getWithdrawInfo(RegularInfoDto reqDto) {
		// TODO Auto-generated method stub
		List<WithdrawEntity> infoDtos = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Query query = session.getNamedQuery("getWithdrawInfo");
			query.setString("fromDate", reqDto.getFromDate());
			query.setString("toDate", reqDto.getToDate());
			infoDtos = query.list();
		} catch(HibernateException e) {
			throw e;
		} catch(Exception e) {
			try {
				throw e;
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return infoDtos;
	}

	@Override
	public String getAccountNameFromAccountNo(String accountno, String entityName) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "SELECT name from " + entityName +  " where accountno = :accountno";
			
			Query query = session.createQuery(hql);
			query.setString("accountno", accountno);
			trx.commit();
			session.flush();
			
			return (String)query.uniqueResult();
		}
		catch(HibernateException e) {
			if(trx != null) {
				trx.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
	}
	
	
	@Override
	public String getLedgerAccountEntityAccountNameFromAccountNo(String accountcode) throws TransactionException{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "SELECT accountname from LedgerAccountEntity where accountcode = :accountcode";
			
			Query query = session.createQuery(hql);
			query.setString("accountcode", accountcode);
			trx.commit();
			session.flush();
			
			return (String)query.uniqueResult();
		}
		catch(HibernateException e) {
			if(trx != null) {
				trx.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public Long getCellFromAccountno(String accountno) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "SELECT cell from RegularShareEntity where accountno = :accountno";
			Query query = session.createQuery(hql);
			query.setString("accountno", accountno);

			trx.commit();
			session.flush();
			
			return (Long)query.uniqueResult();
		}
		catch(HibernateException e) {
			if(trx != null) {
				trx.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public boolean insert(String withdrawNo) {
		// TODO Auto-generated method stub
List<WithdrawEntity> rd= getRno(withdrawNo);
		
		if(rd!=null)
		{
			insertIntoLedgers(rd);
			insertIntoMembers(rd);
		}
		if(rd!=null)
		{
			deleteintodraft(withdrawNo);
			
		}
		
		return true;
	}

	
	private void deleteintodraft(String withdrawNo) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "DELETE from DraftWithdrawEntity where withdrawno = :withdrawno";
			Query query = session.createQuery(hql);
			query.setString("withdrawno", withdrawNo);
 			query.executeUpdate();
 			trx.commit();
 			session.flush();				
		} catch(HibernateException e){
			if(trx != null) {
				trx.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
	}

	private void insertIntoMembers(List<WithdrawEntity> rd) {
		// TODO Auto-generated method stub
		/*Long balance=new Long(0);*/
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			MemberDetailsEntity le =new MemberDetailsEntity();
			/*for(ReceiptEntity a: rd)
			{
				le.setAccountno(a.getAccountno());
			
			String hql = "SELECT openingbalance from RegularShareEntity where accountno = :accountno";
			Query query = session.createQuery(hql);
			query.setString("accountno", le.getAccountno());
			balance= (Long) query.uniqueResult();
			
			} */
			for(WithdrawEntity r:rd){
				le.setAccountname(r.getName());
				le.setAccountno(r.getAccountno());
				le.setDate(r.getDate());
				le.setParticulars("Towards Withdraw" +r.getWithdrawno());
				le.setEntryNo(r.getWithdrawno());
				le.setDebit((double) r.getAmount());
				le.setType("Dr");
				le.setMemberId(r.getMemberid());
				/*le.setBalance(balance);*/
			}
			session.persist(le);
			trx.commit();
			session.flush();			
		} catch (HibernateException e){
			trx.rollback();
			throw e;
		} finally {
			session.close();
 		}
	}

	private void insertIntoLedgers(List<WithdrawEntity> rd) {
		// TODO Auto-generated method stub
		/*Long balance=new Long(0);*/
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			LedgerDetailEntity le =new LedgerDetailEntity();
			/*for(WithdrawEntity a: rd)
			{
				le.setAccountno(a.getAccountno());
			
			String hql = "SELECT openingbalance from RegularShareEntity where accountno = :accountno";
			Query query = session.createQuery(hql);
			query.setString("accountno", le.getAccountno());
			balance= (Long) query.uniqueResult();
			
			} */
			for(WithdrawEntity r:rd){
				le.setAccountname(r.getName());
				le.setAccountno(r.getAccountno());
				le.setDate(r.getDate());
				le.setParticulars("Towards Withdraw" +r.getWithdrawno());
				le.setEntryNo(r.getWithdrawno());
				le.setDebit((double) r.getAmount());
				le.setType("Dr");
				le.setMemberId(r.getMemberid());
				/*le.setBalance(balance);*/
			}
			session.persist(le);
			trx.commit();
			session.flush();			
		} catch (HibernateException e){
			trx.rollback();
			throw e;
		} finally {
			session.close();
 		}
	}

	@SuppressWarnings("unchecked")
	private List<WithdrawEntity> getRno(String withdrawNo) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "FROM WithdrawEntity where withdrawno = :withdrawno";
			Query query = session.createQuery(hql);
			query.setString("withdrawno", withdrawNo);
			trx.commit();
			session.flush();

			return query.list();
		}
		catch(HibernateException e) {
			if(trx != null) {
				trx.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public boolean reject(String withdrawNo) {
		// TODO Auto-generated method stub
		List<WithdrawEntity> rd= getRno(withdrawNo);
		
		if(rd!=null)
		{
			insertIntoRwithdraw(rd);
		}
		if(rd!=null)
		{
			deleteintodraft(withdrawNo);
		}
		return true;
	}

	private void insertIntoRwithdraw(List<WithdrawEntity> rd) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			RejectWithdrawEntity le =new RejectWithdrawEntity();
			for(WithdrawEntity r:rd){
				le.setAccountname(r.getName());
				le.setAccountno(r.getAccountno());
				le.setDate(r.getDate());
				le.setParticulars("Towards Withdraw" +r.getWithdrawno());
				le.setEntryNo(r.getWithdrawno());
				le.setDebit((double) r.getAmount());
				le.setType("Dr");
				le.setMemberId(r.getMemberid());
			}
			session.persist(le);
			trx.commit();
			session.flush();			
		} catch (HibernateException e){
			trx.rollback();
			throw e;
		} finally {
			session.close();
 		}
	}

	@Override
	public List<WithdrawEntity> getWithdrawNo(Calendar todayDate) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hqlQuery = "select distinct withdrawentity from WithdrawEntity withdrawentity where withdrawdate = ? ";
			Query query = session.createQuery(hqlQuery);
			query.setParameter(0, todayDate);
			trx.commit();
			session.flush();
			@SuppressWarnings("unchecked")
			List<WithdrawEntity> resultList = query.list();
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
	}
}

