package com.DAO;

import com.entity.User;

public interface UserDAO {
	public boolean userRegister(User us);
	
	public User login(String email, String password);
	
	public boolean checkPassword(int id ,String ps);
	
	public boolean updateProfile(User u);
	
	public boolean checkUser(String em);
	
	public boolean changePassword(String email, String password);
    
    public String getToken(String email); // New method for retrieving token

	void updateToken(String email, String token);
	
	public void removeToken(String email);


}