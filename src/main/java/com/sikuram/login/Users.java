package com.sikuram.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.SQLExceptionList;

public class Users {

	private long id;
	private String name;
	private String email;
	private String pwd;	
	private int isAdmin;
	
	public int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public boolean validateUser(Connection con) throws SQLException{
		String sql = "Select count(*) as userExist from admin.usermst where email=? and pwd=?";
		System.out.println("SQL Select ===> " +sql);
		int count = 0;
		PreparedStatement ps = con.prepareStatement(sql);
		int i = 0;
		
		ps.setString(++i, email);
		ps.setString(++i, pwd);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			
			count = Integer.parseInt(rs.getString("UserExist"));
		}
		System.out.println("Count ===> "+count);
		
		ps.close();
		
		if(count > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	public Users getUser(Connection con) throws SQLException{
		String sql = "SELECT * FROM admin.usermst where email=? and pwd=?";
		
		System.out.println("SQL Select ===> "+ sql);
		
		int count = 0;
		PreparedStatement ps = con.prepareStatement(sql);
		int i = 0;
		
		ps.setString(++i, email);
		ps.setString(++i, pwd);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			id= rs.getLong("id");
			name = rs.getString("name");
			email = rs.getString("email");
			pwd = rs.getString("pwd");
			isAdmin = rs.getInt("isAdmin");
		}
		
		return this;
	}
	
}
