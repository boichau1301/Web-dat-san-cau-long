package com.assignment.caulong.models;

public class MonthlyStats {
	private Double income;
	private Long bookingCount;
	private Long customerCount;

	public MonthlyStats(Double income, Long bookingCount, Long customerCount) {
		super();
		this.income = income;
		this.bookingCount = bookingCount;
		this.customerCount = customerCount;
	}

	public MonthlyStats() {
		super();
	}

	public Double getIncome() {
		return income;
	}

	public void setIncome(Double income) {
		this.income = income;
	}

	public Long getBookingCount() {
		return bookingCount;
	}

	public void setBookingCount(Long bookingCount) {
		this.bookingCount = bookingCount;
	}

	public Long getCustomerCount() {
		return customerCount;
	}

	public void setCustomerCount(Long customerCount) {
		this.customerCount = customerCount;
	}

}
