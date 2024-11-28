package com.assignment.caulong.models;

public class RevenueByCourt {
	
	private String courtName;
	private Double totalRevenue;

	public RevenueByCourt(String courtName, Double totalRevenue) {
		super();
		this.courtName = courtName;
		this.totalRevenue = totalRevenue;
	}

	public RevenueByCourt() {
		super();
	}

	public String getCourtName() {
		return courtName;
	}

	public void setCourtName(String courtName) {
		this.courtName = courtName;
	}

	public Double getTotalRevenue() {
		return totalRevenue;
	}

	public void setTotalRevenue(Double totalRevenue) {
		this.totalRevenue = totalRevenue;
	}

}
