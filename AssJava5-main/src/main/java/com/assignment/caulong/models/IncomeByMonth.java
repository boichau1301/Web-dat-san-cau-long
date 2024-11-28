package com.assignment.caulong.models;

public class IncomeByMonth {
	private String courtName;
	private String courtAddress;
	private double courtPrice;
	private long totalBookings;
	private double totalHours;
	private double totalRevenue;
	private double netRevenue;

	public IncomeByMonth(String courtName, String courtAddress, double courtPrice, long totalBookings,
			double totalHours, double totalRevenue, double netRevenue) {
		super();
		this.courtName = courtName;
		this.courtAddress = courtAddress;
		this.courtPrice = courtPrice;
		this.totalBookings = totalBookings;
		this.totalHours = totalHours;
		this.totalRevenue = totalRevenue;
		this.netRevenue = netRevenue;
	}

	public IncomeByMonth() {
		super();
	}

	public String getCourtName() {
		return courtName;
	}

	public void setCourtName(String courtName) {
		this.courtName = courtName;
	}

	public String getCourtAddress() {
		return courtAddress;
	}

	public void setCourtAddress(String courtAddress) {
		this.courtAddress = courtAddress;
	}

	public double getCourtPrice() {
		return courtPrice;
	}

	public void setCourtPrice(double courtPrice) {
		this.courtPrice = courtPrice;
	}

	public long getTotalBookings() {
		return totalBookings;
	}

	public void setTotalBookings(long totalBookings) {
		this.totalBookings = totalBookings;
	}

	public double getTotalHours() {
		return totalHours;
	}

	public void setTotalHours(double totalHours) {
		this.totalHours = totalHours;
	}

	public double getTotalRevenue() {
		return totalRevenue;
	}

	public void setTotalRevenue(double totalRevenue) {
		this.totalRevenue = totalRevenue;
	}

	public double getNetRevenue() {
		return netRevenue;
	}

	public void setNetRevenue(double netRevenue) {
		this.netRevenue = netRevenue;
	}

}
