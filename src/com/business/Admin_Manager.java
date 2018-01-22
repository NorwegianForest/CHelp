package com.business;

import com.DBQuery.DataProcess;

public class Admin_Manager {
	private String name;
	private String password;
	private String type;

	public Admin_Manager(String name, String password, String type) {
		this.name = name;
		this.password = password;
		this.type = type;
	}

	public boolean check() {
		String sql = "select count(*) from " + type + " where name='" + name + "' and password='" + password + "'";
		int count = Integer.parseInt(DataProcess.getSingleResult(sql, "count(*)"));

		if(count>0)	{
			return true;
		} else {
			return false;
		}
	}
}
