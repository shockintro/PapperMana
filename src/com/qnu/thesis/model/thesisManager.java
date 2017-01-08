package com.qnu.thesis.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class thesisManager {
	private int id;
	private String mana_password;
	private String mana_account;
	private Date create_time;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMana_password() {
		return mana_password;
	}
	public void setMana_password(String mana_password) {
		this.mana_password = mana_password;
	}
	public String getMana_account() {
		return mana_account;
	}
	public void setMana_account(String mana_account) {
		this.mana_account = mana_account;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
}
