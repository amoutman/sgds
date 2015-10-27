package com.creditease.sgds.master.bean;

import java.util.Date;

public class Advertisement {
	
	private String id;
	private String pic_path;
	private String url;
	private Date created_by_date;
	private String created_by_id;
	private String created_by;
	private Date update_date;
	private String update_by_id;
	private String update_by;
	private Date online_date;
	private int status;
	private Date offline_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPic_path() {
		return pic_path;
	}
	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getCreated_by_date() {
		return created_by_date;
	}
	public void setCreated_by_date(Date created_by_date) {
		this.created_by_date = created_by_date;
	}
	public String getCreated_by_id() {
		return created_by_id;
	}
	public void setCreated_by_id(String created_by_id) {
		this.created_by_id = created_by_id;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public String getUpdate_by_id() {
		return update_by_id;
	}
	public void setUpdate_by_id(String update_by_id) {
		this.update_by_id = update_by_id;
	}
	public String getUpdate_by() {
		return update_by;
	}
	public void setUpdate_by(String update_by) {
		this.update_by = update_by;
	}
	public Date getOnline_date() {
		return online_date;
	}
	public void setOnline_date(Date online_date) {
		this.online_date = online_date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getOffline_date() {
		return offline_date;
	}
	public void setOffline_date(Date offline_date) {
		this.offline_date = offline_date;
	}
	

}
