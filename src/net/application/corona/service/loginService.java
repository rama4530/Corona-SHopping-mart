package net.application.corona.service;

public class loginService {
	
	public boolean authenticateUser(String userId,String password) {
		System.out.println(userId);
		System.out.println(password);
		if(userId==null || password==null ||password.trim()=="") {
			return false;
		}else if(!userId.equals("admin") && !password.equals("admin")) {
			return false;
		}
		
		return true;
	}
	
	
	
}
