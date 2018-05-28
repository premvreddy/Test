package com.services;

import grandcentral.security.TokenAuthority;

public class LoginManager {

	/**
	 * Method to validate password with sha3 algorithm
	 * 
	 * @param password
	 * @param dbPassword
	 * @return
	 */
	public boolean validatePassword(String password, String dbPassword) {
		boolean result = true;
		TokenAuthority authority = new TokenAuthority();
		TokenAuthority.setPassword(password);
		String passwordToken = authority.generateToken();
		TokenAuthority.setToken(passwordToken);
		if (authority.validateToken() != null && password.equals(dbPassword)) {
			result = true;
		} else {
			result = false;
		}
		return result;
	}

}
