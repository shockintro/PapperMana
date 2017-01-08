package com.qnu.thesis.model;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class thesisAuthor {
	private int id;
	private String name;
	private String author_account;
	private String author_password;
	private String phone;
	private Date create_date;
	private Date modify_date;
	private String author_position;
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public Date getModify_date() {
		return modify_date;
	}
	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}
	public String getAuthor_account() {
		return author_account;
	}
	public void setAuthor_account(String author_account) {
		this.author_account = author_account;
	}
	public String getAuthor_password() {
		return author_password;
	}
	public void setAuthor_password(String author_password) {
		this.author_password = author_password;
	}
	public String getAuthor_position() {
		return author_position;
	}
	public void setAuthor_position(String author_position) {
		this.author_position = author_position;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
}
