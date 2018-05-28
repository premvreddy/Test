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
import com.dto.VehicleInfoDto;
import com.entities.AshareEntity;
import com.entities.NominalShareEntity;
import com.entities.RegularShareEntity;
import com.entities.VehicleLoanEntity;

public class VehicleLoanDaoImpl implements VehicleLoanDao {

	@Override
	public void adduser(VehicleLoanEntity entity) {
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

	@SuppressWarnings("unchecked")
	@Override
	public List<NominalShareEntity> nominallist() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<NominalShareEntity> list = null;
		try {
			list = session.createQuery("FROM NominalShareEntity").list();
		} catch (HibernateException e) {
			throw e;
		} finally {
			session.close();
		}
		return list;
	
	}
	@SuppressWarnings({ "null", "unchecked" })
	@Override
	public List<NominalShareEntity> getNominalShareNameFromAccount(String memberid) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			String hql = "select distinct name,paddress,occupation,age from NominalShareEntity where memberid = :memberid";
					
			Query query = session.createQuery(hql);
			query.setString("memberid", memberid);
			System.out.println("hi");
			trx.commit();
			
			/* session.flush(); */
			List<NominalShareEntity> listEntity = new ArrayList<NominalShareEntity>();
			List<Object> objectList = query.list();

			if(objectList.size() > 0) {
				Object[] object1 = (Object[]) objectList.get(0);
				String name = (String) object1[0];
				String paddress = (String) object1[1];
				String occupation = (String) object1[2];
				int age= (Integer) object1[3];
				NominalShareEntity entity = new NominalShareEntity();
				entity.setName(name);
				entity.setPaddress(paddress);
				entity.setOccupation(occupation);
				entity.setAge(age);
				listEntity.add(entity);
			}
			return listEntity;

		} catch (HibernateException e) {
			if (trx != null) {
				trx.rollback();
			} else {
				trx.commit();
			}
			throw e;
		} finally {

			session.close();
		}
	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> vehiclemember() {
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml"); 
		List<Integer> memid = new ArrayList<Integer>();
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		try{
		Query qry = session.createQuery("select id from VehicleLoanEntity");
				 
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

	@SuppressWarnings("unchecked")
	@Override
	public List<RegularShareEntity> RegularList() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<RegularShareEntity> list = null;
		try {
			list = session.createQuery("FROM RegularShareEntity").list();
		} catch (HibernateException e) {
			throw e;
		} finally {
			session.close();
		}
		return list;
	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AshareEntity> ashareList() {
	
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<AshareEntity> list = null;
		try {
			list = session.createQuery("FROM AshareEntity").list();
		} catch (HibernateException e) {
			throw e;
		} finally {
			session.close();
		}
		return list;
	
	}

	@SuppressWarnings({ "unchecked", "null" })
	@Override
	public List<RegularShareEntity> getregularname(String memberid) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			String hql = "select distinct name,paddress,occupation,age from RegularShareEntity where memberid = :memberid";
			Query query = session.createQuery(hql);
			query.setString("memberid", memberid);
			System.out.println("hi");
			trx.commit();
			
			/* session.flush(); */
			List<RegularShareEntity> listEntity = new ArrayList<RegularShareEntity>();
			
			List<Object> objectList = query.list();

			if(objectList.size() > 0) {
				Object[] object1 = (Object[]) objectList.get(0);
				String name = (String) object1[0];
				String paddress = (String) object1[1];
				String occupation = (String) object1[2];
				int age= (Integer) object1[3];
				RegularShareEntity entity = new RegularShareEntity();
				entity.setName(name);
				entity.setPaddress(paddress);
				entity.setOccupation(occupation);
				entity.setAge(age);
				listEntity.add(entity);
			}
			return listEntity;

		} catch (HibernateException e) {
			if (trx != null) {
				trx.rollback();
			} else {
				trx.commit();
			}
			throw e;
		} finally {

			session.close();
		}


}

	@SuppressWarnings({ "unchecked", "null" })
	@Override
	public List<AshareEntity> getAsharename(String memberid) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			String hql = "select distinct name,paddress,occupation,age from AshareEntity where memberid = :memberid";
			Query query = session.createQuery(hql);
			query.setString("memberid", memberid);
			System.out.println("hi");
			trx.commit();
			
			/* session.flush(); */
			List<AshareEntity> listEntity = new ArrayList<AshareEntity>();
			List<Object> objectList = query.list();

			if(objectList.size() > 0) {
				Object[] object1 = (Object[]) objectList.get(0);
				String name = (String) object1[0];
				String paddress = (String) object1[1];
				String occupation = (String) object1[2];
				int age= (Integer) object1[3];
				AshareEntity entity = new AshareEntity();
				entity.setName(name);
				entity.setPaddress(paddress);
				entity.setOccupation(occupation);
				entity.setAge(age);
				listEntity.add(entity);
			}
			return listEntity;

		} catch (HibernateException e) {
			if (trx != null) {
				trx.rollback();
			} else {
				trx.commit();
			}
			throw e;
		} finally {

			session.close();
		}

}

	@SuppressWarnings("unchecked")
	@Override
	public List<VehicleLoanEntity> GetVehicleInfo(VehicleInfoDto vldto) {
		
		List<VehicleLoanEntity> infoDtos = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Query query = session.getNamedQuery("getVehicleInfo");
			query.setString("fromDate", vldto.getFromDate());
			query.setString("toDate", vldto.getToDate());
			
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
	
	}

