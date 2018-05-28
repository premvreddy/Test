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
import com.dto.NominalInfoDto;
import com.entities.NominalShareEntity;

public class NominalShareDaoImpl implements NominalShareDao {
	
	@Override
	public void addUser(NominalShareEntity entity) {
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
	public List<NominalShareEntity> getNominalInfo(NominalInfoDto nomDto) {
		// TODO Auto-generated method stub
			List<NominalShareEntity> infoDtos = null;
			Session session = HibernateUtil.getSessionFactory().openSession();
			try {
				Query query = session.getNamedQuery("getNominalInfo");
				query.setString("fromDate", nomDto.getFromDate());
				query.setString("toDate", nomDto.getToDate());
				//query.setString("accountno", "%" + nomDto.getAccountno() + "%");
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
	public void update(int slno, NominalShareEntity entity) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			NominalShareEntity entity1 = (NominalShareEntity) session.get(NominalShareEntity.class, slno);
			entity1.setBankname(entity.getBankname());
			entity1.setBankcode(entity.getBankcode());
			entity1.setMemberid(entity.getMemberid());
			entity1.setAccountno(entity.getAccountno());
			entity1.setUserName(entity.getUserName());
			entity1.setPassword(entity.getPassword());
			entity1.setName(entity.getName());
			entity1.setGender(entity.getGender());
			entity1.setAge(entity.getAge());
			entity1.setPhone(entity.getPhone());
			entity1.setRes(entity.getRes());
			entity1.setCell(entity.getCell());
			entity1.setQualification(entity.getQualification());
			entity1.setCaste(entity.getCaste());
			entity1.setOccupation(entity.getOccupation());
			entity1.setAddress(entity.getAddress());
			entity1.setPaddress(entity.getPaddress());
			entity1.setFsalary(entity.getFsalary());
			entity1.setFbusiness(entity.getFbusiness());
			entity1.setFrent(entity.getFrent());
			entity1.setFsource(entity.getFsource());
			entity1.setAfhname(entity.getAfhname());
			entity1.setIdoccupation(entity.getIdoccupation());
			entity1.setIdaddress(entity.getIdaddress());
			entity1.setOmembership(entity.getOmembership());
			entity1.setIpapplicant(entity.getIpapplicant());
			entity1.setMembersociety(entity.getMembersociety());
			entity1.setNmname(entity.getNmname());
			entity1.setRelation(entity.getRelation());
			entity1.setNmaddress(entity.getNmaddress());
			entity1.setName1(entity.getName1());
			entity1.setAccountno1(entity.getAccountno1());
			entity1.setName2(entity.getName2());
			entity1.setAccountno2(entity.getAccountno2());
			entity1.setShareamount(entity.getShareamount());
			entity1.setOpeningbalance(entity.getOpeningbalance());
			entity1.setObtype(entity.getObtype());
			entity1.setSubgroup(entity.getSubgroup());
			entity1.setMaingroup(entity.getMaingroup());
			
			trx.commit();
			session.flush();
		}
		catch(HibernateException e) {
			trx.rollback();
			throw e;
		} 
		finally {
			session.close();
		}	
	}
	


	@Override
	public void deletenominalshares(int slno, Class<NominalShareEntity> class1) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try{
			trx = session.beginTransaction();
			String hql = "DELETE from NominalShareEntity  where slno = :slno";
			Query query = session.createQuery(hql);
 			query.setInteger("slno", slno);
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


	
	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> membershare() {
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml"); 
		List<Integer> memid = new ArrayList<Integer>();
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		try{
		Query qry = session.createQuery("select slno from NominalShareEntity");
				 
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















/*package com.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.common.HibernateUtil;
import com.entities.NominalShareEntity;


public class NominalShareDaoImpl implements NominalShareDao {
	public void addUser(NominalShareEntity entity) {
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
}*/
