package com.qnu.thesis.model;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
@Entity
public class thesis {
	private int id;
	private Date create_date;
	private String thesis_name;
	private String thesis_type;
	private String thesis_author;
	private String thesis_brief;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getThesis_name() {
		return thesis_name;
	}
	public void setThesis_name(String thesis_name) {
		this.thesis_name = thesis_name;
	}
	public String getThesis_type() {
		return thesis_type;
	}
	public void setThesis_type(String thesis_type) {
		this.thesis_type = thesis_type;
	}
	

	public String getThesis_author() {
		return thesis_author;
	}
	public void setThesis_author(String thesis_author) {
		this.thesis_author = thesis_author;
	}
	public String getThesis_brief() {
		return thesis_brief;
	}
	public void setThesis_brief(String thesis_brief) {
		this.thesis_brief = thesis_brief;
	}
	
	
}
