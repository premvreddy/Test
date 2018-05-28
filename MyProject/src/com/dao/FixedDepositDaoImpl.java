package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.common.HibernateUtil;
import com.dto.RegularInfoDto;
import com.entities.FixedDepositEntity;


public class FixedDepositDaoImpl implements FixedDepositDao{

	@Override
	public void adduser(FixedDepositEntity entity) {
		Session session= HibernateUtil.getSessionFactory().openSession();
		Transaction trx= null;
		try{
			trx= session.beginTransaction();
			session.save(entity);
			trx.commit();
			session.flush();
			
		}catch(HibernateException e){
			trx.rollback();
			throw e;
		}finally{
			session.close();
		}
		
	}

	

	@Override
	public List<FixedDepositEntity> getFixedInfo(RegularInfoDto reqDto) {
		
		List<FixedDepositEntity> infoDtos = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Query query = session.getNamedQuery("getFixedInfo");
			query.setString("fromDate", reqDto.getFromDate());
			query.setString("toDate", reqDto.getToDate());
			//query.setString("memberid", memberid);
			infoDtos = query.list();
		} catch (HibernateException e) {
			throw e;
		} catch (Exception e) {
			try {
				throw e;
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return infoDtos;
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> membershare() {
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml"); 
		List<Integer> memid = new ArrayList<Integer>();
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		try{
		Query qry = session.createQuery("select slno from FixedDepositEntity");
				 
		                    memid =qry.list();
		                     
		}
		catch(Exception e)
		{
			System.out.println("excpetion" +e);
		}
		finally{
			session.close();
			factory.close();
		}
		
						return memid;	
	}



	



	
	
	}


