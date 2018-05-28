package com.services;

import com.dao.AgentDao;
import com.dao.AgentDaoImpl;
import com.entities.AgentEntity;

public class AgentServiceImpl implements AgentService {
private AgentDao dao=null;
	@Override
	public AgentEntity adduser(String agentname, String agentcode, String city, String area, String pin,
			String contactnumber, String mobilenumber, String gender, String otherdetails, String address) {
		
		dao=new AgentDaoImpl();
		AgentEntity entity=new AgentEntity();
		entity.setAgentname(agentname);
		entity.setAgentcode(agentcode);
		entity.setCity(city);
		entity.setArea(area);
		entity.setPin(pin);
		entity.setContactnumber(contactnumber);
		entity.setMobilenumber(mobilenumber);
		entity.setGender(gender);
		entity.setOtherdetails(otherdetails);
		entity.setAddress(address);
		dao.adduser(entity);
		return entity;
	}

}
