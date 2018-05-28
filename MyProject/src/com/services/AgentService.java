package com.services;

import com.entities.AgentEntity;

public interface AgentService {

	AgentEntity adduser(String agentname, String agentcode, String city, String area, String pin, String contactnumber,
			String mobilenumber, String gender, String otherdetails, String address);

	
	

}
