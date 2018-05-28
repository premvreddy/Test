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
import com.entities.ReceiptEntity;
import com.entities.RejectEntity;


public class RecieptAccountDaoImpl implements RecieptAccountDao {
	
	
 
	@Override
	public void addUser(ReceiptEntity entity) {
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
	public List<ReceiptEntity> getReceiptInfo(RegularInfoDto reqDto) {
		// TODO Auto-generated method stub
			List<ReceiptEntity> infoDtos = null;
			Session session = HibernateUtil.getSessionFactory().openSession();
			try {
				Query query = session.getNamedQuery("getReceiptInfo");
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
	public String getAccountNameFromAccountNo(String accountno, String entityName) throws TransactionException{
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
	public Long getCellFromAccountNo(String accountno) throws TransactionException {
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
		} 
		finally {
			session.close();
		}
		
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<ReceiptEntity> getRno(String receiptNo) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "FROM ReceiptEntity where receiptno = :receiptno";
			Query query = session.createQuery(hql);
			query.setString("receiptno", receiptNo);
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
	public boolean insert(String receiptNo) {
		// TODO Auto-generated method stub
		List<ReceiptEntity> rd= getRno(receiptNo);
		
		if(rd!=null)
		{
			insertIntoLedgers(rd);
			insertIntoMembers(rd);
		}
		if(rd!=null)
		{
			deleteintodraft(receiptNo);
			
		}
		
		return true;
	}


	private void deleteintodraft(String receiptNo) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "DELETE from DraftDepositEntity where receiptno = :receiptno";
			Query query = session.createQuery(hql);
			query.setString("receiptno", receiptNo);
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


	
	private void insertIntoMembers(List<ReceiptEntity> rd) {
		// TODO Auto-generated method stub
		
		Long balance=new Long(0);
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			MemberDetailsEntity le =new MemberDetailsEntity();
			for(ReceiptEntity a: rd)
			{
				le.setAccountno(a.getAccountno());
			
			String hql = "SELECT openingbalance from RegularShareEntity where accountno = :accountno";
			Query query = session.createQuery(hql);
			query.setString("accountno", le.getAccountno());
			balance= (Long) query.uniqueResult();
			
			} 
			for(ReceiptEntity r:rd){
				le.setAccountname(r.getName());
				le.setAccountno(r.getAccountno());
				le.setDate(r.getDate());
				le.setParticulars("Towards Receipt" +r.getReceiptno());
				le.setEntryNo(r.getReceiptno());
				le.setCredit((double) r.getAmount());
				le.setType("Cr");
				le.setMemberId(r.getMemberid());
				le.setBalance(balance);
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
	


	private void insertIntoLedgers(List<ReceiptEntity> rd) {
		// TODO Auto-generated method stub
		
		Long balance=new Long(0);
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			LedgerDetailEntity le =new LedgerDetailEntity();
			for(ReceiptEntity a: rd)
			{
				le.setAccountno(a.getAccountno());
			
			String hql = "SELECT openingbalance from RegularShareEntity where accountno = :accountno";
			Query query = session.createQuery(hql);
			query.setString("accountno", le.getAccountno());
			balance= (Long) query.uniqueResult();
			
			} 
			for(ReceiptEntity r:rd){
				le.setAccountname(r.getName());
				le.setAccountno(r.getAccountno());
				le.setDate(r.getDate());
				le.setParticulars("Towards Receipt" +r.getReceiptno());
				le.setEntryNo(r.getReceiptno());
				le.setCredit((double) r.getAmount());
				le.setType("Cr");
				le.setMemberId(r.getMemberid());
				le.setBalance(balance);
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
	public boolean reject(String receiptNo) {
		// TODO Auto-generated method stub
List<ReceiptEntity> rd= getRno(receiptNo);
		
		if(rd!=null)
		{
			insertIntoRreceipt(rd);
		}
		if(rd!=null)
		{
			deleteintodraft(receiptNo);
		}
		return true;
	}


	private void insertIntoRreceipt(List<ReceiptEntity> rd) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			RejectEntity le =new RejectEntity();
			for(ReceiptEntity r:rd){
				le.setAccountname(r.getName());
				le.setAccountno(r.getAccountno());
				le.setDate(r.getDate());
				le.setParticulars("Towards Receipt" +r.getReceiptno());
				le.setEntryNo(r.getReceiptno());
				le.setCredit((double) r.getAmount());
				le.setType("Cr");
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
	public List<ReceiptEntity> getReceiptNo(Calendar todayDate) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hqlQuery = "select distinct receiptentity from ReceiptEntity receiptentity where receiptdate = ? ";
			Query query = session.createQuery(hqlQuery);
			query.setParameter(0, todayDate);
			trx.commit();
			session.flush();
			@SuppressWarnings("unchecked")
			List<ReceiptEntity> resultList = query.list();
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
	