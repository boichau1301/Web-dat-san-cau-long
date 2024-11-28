package com.assignment.caulong.models;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name="UuDai")
public class Promotion {
	@Id
	@Column(name="MaUuDai")
	private int id;
	@Column(name="NgayBatDau")
	private Date start;
	@Column(name="NgayKetThuc")
	private Date end;
	@Column(name="PhanTranGiam")
	private double percentage;
	@Column(name="DieuKienGiam")
	private String requirement;
	
	public Promotion() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Promotion(int id, Date start, Date end, double percentage, String requirement) {
		super();
		this.id = id;
		this.start = start;
		this.end = end;
		this.percentage = percentage;
		this.requirement = requirement;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
}
