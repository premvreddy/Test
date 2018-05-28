package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.common.HibernateUtil;
import com.dto.LedgerInfoDto;
import com.entities.AshareEntity;
import com.entities.LedgerAccountEntity;
import com.entities.LedgerDetailEntity;
import com.entities.MemberDetailsEntity;
import com.entities.NominalShareEntity;
import com.entities.RegularShareEntity;

public class LedgerAccountDaoImpl implements LedgerAccountDao {

	@Override
	public void addUser(LedgerAccountEntity entity) {
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
	public List<LedgerAccountEntity> accountLedger() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<LedgerAccountEntity> list = null;
		try {
			list = session.createQuery("FROM LedgerAccountEntity").list();
		} catch (HibernateException e) {
			throw e;
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public void update(int id, LedgerAccountEntity entity) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			LedgerAccountEntity entity1 = (LedgerAccountEntity) session.get(
					LedgerAccountEntity.class, id);
			entity1.setBranchname(entity.getBranchname());
			entity1.setBranchcode(entity.getBranchcode());
			entity1.setSubgroupname(entity.getSubgroupname());
			entity1.setMaingroup(entity.getMaingroup());
			entity1.setAccountname(entity.getAccountname());
			entity1.setAccountcode(entity.getAccountcode());
			entity1.setOpeningbalance(entity.getOpeningbalance());
			entity1.setType(entity.getType());

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
	public void deleteledgeracc(int id, Class<LedgerAccountEntity> class1) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			String hql = "DELETE from LedgerAccountEntity where id = :id";
			Query query = session.createQuery(hql);
			query.setInteger("id", id);
			query.executeUpdate();
			trx.commit();
			session.flush();
		} catch (HibernateException e) {
			if (trx != null) {
				trx.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LedgerDetailEntity> getLedgerInfo(LedgerInfoDto reqDto,
			String accountno) {
		// TODO Auto-generated method stub
		List<LedgerDetailEntity> infoDtos = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Query query = session.getNamedQuery("getLedgerInfo");
			query.setString("fromDate", reqDto.getFromDate());
			query.setString("toDate", reqDto.getToDate());
			query.setString("accountno", accountno);
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
	public List<RegularShareEntity> getLedgerDetailList() {
		// TODO Auto-generated method stub
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

	@SuppressWarnings({ "null", "unchecked" })
	@Override
	public List<LedgerDetailEntity> getNameFromAccount(String accountno) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			String hql = "select distinct accountname from LedgerDetailEntity  where accountno = :accountno";
			Query query = session.createQuery(hql);
			query.setString("accountno", accountno);
			trx.commit();
			/* session.flush(); */
			List<LedgerDetailEntity> listEntity = new ArrayList<LedgerDetailEntity>();
			List<Object> objectList = query.list();

			if(objectList.size() > 0) {
				Object object1 = objectList.get(0);
				String name = (String) object1;
				LedgerDetailEntity entity = new LedgerDetailEntity();
				entity.setAccountname(name);
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
	
	@SuppressWarnings({ "null", "unchecked" })
	@Override
	public List<NominalShareEntity> getNominalShareNameFromAccount(String accountno) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			String hql = "select distinct name from NominalShareEntity where accountno = :accountno";
			Query query = session.createQuery(hql);
			query.setString("accountno", accountno);
			trx.commit();
			/* session.flush(); */
			List<NominalShareEntity> listEntity = new ArrayList<NominalShareEntity>();
			List<Object> objectList = query.list();

			if(objectList.size() > 0) {
				Object object1 = objectList.get(0);
				String name = (String) object1;
				NominalShareEntity entity = new NominalShareEntity();
				entity.setName(name);
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
	
	@SuppressWarnings({ "null", "unchecked" })
	@Override
	public List<AshareEntity> getAshareNameFromAccount(String accountno) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			String hql = "select distinct name from AshareEntity where accountno = :accountno";
			Query query = session.createQuery(hql);
			query.setString("accountno", accountno);
			trx.commit();
			/* session.flush(); */
			List<AshareEntity> listEntity = new ArrayList<AshareEntity>();
			List<Object> objectList = query.list();

			Object object1 = objectList.get(0);
			String name = (String) object1;
			AshareEntity entity = new AshareEntity();
			entity.setName(name);
			listEntity.add(entity);
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

	
	@SuppressWarnings({ "null", "unchecked" })
	@Override
	public List<LedgerAccountEntity> getLedgerAccountNameFromAccount(String accountcode) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {
			trx = session.beginTransaction();
			String hql = "select distinct name from LedgerAccountEntity where accountno = :accountno";
			Query query = session.createQuery(hql);
			query.setString("accountcode", accountcode);
			trx.commit();
			 session.flush(); 
			List<LedgerAccountEntity> listEntity = new ArrayList<LedgerAccountEntity>();
			List<Object> objectList = query.list();

			Object object1 = objectList.get(0);
			String accountname = (String) object1;
			LedgerAccountEntity entity = new LedgerAccountEntity();
			entity.setAccountname(accountname);
			listEntity.add(entity);
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
	@SuppressWarnings({ "null", "unchecked" })
	@Override
	public List<LedgerAccountEntity> getNameFromAccount1() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<LedgerAccountEntity> list = new ArrayList<LedgerAccountEntity>();
		try {
			list = session.createQuery("FROM LedgerAccountEntity").list();
		} catch (HibernateException e) {
			throw e;
		} finally {
			session.close();
		}
		return list;
		// Transaction trx = null;
		// try{
		// trx = session.beginTransaction();
		// String hql =
		// "select distinct accountcode from LedgerAccountEntity  where  subgroupname='cash'";
		// Query query = session.createQuery(hql);
		// // query.setString("subgroupname", accountno);
		// trx.commit();
		// /*session.flush();*/
		// List<String> listEntity = query.list();
		// return listEntity;
		//
		// }
		// catch(HibernateException e ) {
		// if(trx != null) {
		// trx.rollback();
		// }
		// else
		// {
		// trx.commit();
		// }
		// throw e;
		// } finally {
		//
		// session.close();
		// }
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberDetailsEntity> getmemberinfo(LedgerInfoDto reqDto,
			String accountno) {
		List<MemberDetailsEntity> infoDtos = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Query query = session.getNamedQuery("getMemberinfo");
			query.setString("fromDate", reqDto.getFromDate());
			query.setString("toDate", reqDto.getToDate());
			query.setString("accountno", accountno);
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

	@SuppressWarnings({ "unchecked", "null" })
	@Override
	public List<RegularShareEntity> getNameacFromAccount(String accountno) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction trx = null;
		try {

			trx = session.beginTransaction();
			String hql = "select name,address,cell from RegularShareEntity  where accountno = :accountno";
			Query query = session.createQuery(hql);
			query.setString("accountno", accountno);
			trx.commit();
			/* session.flush(); */

			List<RegularShareEntity> listEntity = new ArrayList<RegularShareEntity>();
			List<Object> objectList = query.list();

			Object[] object1 = (Object[]) objectList.get(0);
			String name = (String) object1[0];
			String address = (String) object1[1];
			Long cellNumber = (Long) object1[2];

			RegularShareEntity entity = new RegularShareEntity();
			entity.setCell(cellNumber);
			entity.setName(name);
			entity.setAddress(address);
			listEntity.add(entity);
			return listEntity;
		}

		catch (HibernateException e) {
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

	@Override
	public List<NominalShareEntity> nominalShareList() {
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
}
