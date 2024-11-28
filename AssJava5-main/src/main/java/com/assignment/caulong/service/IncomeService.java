package com.assignment.caulong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.assignment.caulong.models.IncomeByMonth;

import com.assignment.caulong.repository.CourtOrderRepository;

@Service
public class IncomeService {

	CourtOrderRepository courtOrderDao;

	@Autowired
	public IncomeService(CourtOrderRepository courtOrderDao) {
		super();
		this.courtOrderDao = courtOrderDao;
	}

	public List<Integer> getAvailableMonths() {
		// Truy vấn tháng có trong cơ sở dữ liệu
		return courtOrderDao.findDistinctMonths();
	}

	public List<Integer> getAvailableYears() {
		// Truy vấn năm có trong cơ sở dữ liệu
		return courtOrderDao.findDistinctYears();
	}

	public Page<IncomeByMonth> getRevenueByMonthYear(int month, int year, Pageable pageable) {
		// Truy vấn doanh thu theo tháng và năm
		return courtOrderDao.getMonthlyRevenueReport(month, year, pageable);
	}

	public List<Object[]> getBookingReportByTimeSlot(int month, int year) {
		return courtOrderDao.getBookingReportByTimeSlot(month, year);
	}

}