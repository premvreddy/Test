package com.common;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static final SessionFactory sessionFactory = buildSessionFactory();

	/*
	 * static { try { sessionFactory = new
	 * Configuration().configure("hibernate.cfg.xml").buildSessionFactory(); }
	 * catch (Throwable ex) { System.err.println(
	 * "Initial SessionFactory creation failed." + ex); throw new
	 * ExceptionInInitializerError(ex); } }
	 */
	private static SessionFactory buildSessionFactory() {
		try {
			return new Configuration().configure().buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

}
