package com.assignment.caulong.controllers;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.assignment.caulong.models.MonthlyStats;
import com.assignment.caulong.models.RevenueByCourt;
import com.assignment.caulong.repository.CourtOrderRepository;

@Controller
public class AdminController {

	CourtOrderRepository courtOrderDao;
	
	@Autowired
	public AdminController(CourtOrderRepository courtOrderDao) {
		super();
		this.courtOrderDao = courtOrderDao;
	}

	@ResponseBody
	@GetMapping("countByIncomeMonthNow")
	MonthlyStats countByIncomeMonthNow() {
		// Lấy ngày hiện tại
		LocalDate today = LocalDate.now();

		// Chuyển LocalDate sang java.sql.Date
		Date startDate = Date.valueOf(today.withDayOfMonth(1)); // Ngày đầu tháng hiện tại
		Date endDate = Date.valueOf(today.plusMonths(1).withDayOfMonth(1)); // Ngày đầu tháng kế tiếp

		// Gọi phương thức countByIncomeMonthNow với các tham số startDate và endDate
		return courtOrderDao.countByIncomeMonthNow(startDate, endDate);
	}
	
	@ResponseBody
	@GetMapping("/admin/revenueByCourt")
	List<RevenueByCourt> showRevenueByCourt(Model model) {
	    // Lấy ngày hiện tại
	    LocalDate today = LocalDate.now();

	    // Chuyển LocalDate sang java.sql.Date
	    Date startDate = Date.valueOf(today.withDayOfMonth(1)); // Ngày đầu tháng hiện tại
	    Date endDate = Date.valueOf(today.plusMonths(1).withDayOfMonth(1)); // Ngày đầu tháng kế tiếp

	    return courtOrderDao.findRevenueByCourtForCurrentMonth(startDate, endDate);
	}


	@GetMapping("/employee/index")
	public String showView(Model model) {
	    // Lấy ngày hiện tại
	    LocalDate today = LocalDate.now();

	    // Chuyển LocalDate sang java.sql.Date
	    Date startDate = Date.valueOf(today.withDayOfMonth(1)); // Ngày đầu tháng hiện tại
	    Date endDate = Date.valueOf(today.plusMonths(1).withDayOfMonth(1)); // Ngày đầu tháng kế tiếp
	    
	    // Lấy thông tin thống kê từ DAO
	    MonthlyStats stats = courtOrderDao.countByIncomeMonthNow(startDate, endDate);
	    
	    // Gán kết quả vào model
	    model.addAttribute("income", stats.getIncome());
	    model.addAttribute("bookingCount", stats.getBookingCount());
	    model.addAttribute("customerCount", stats.getCustomerCount());
	    List<RevenueByCourt> revenueData = courtOrderDao.findRevenueByCourtForCurrentMonth(startDate, endDate);
	    
	    model.addAttribute("revenueData", revenueData);
	    // Trả về view JSP
	    return "nhanvien/trangchuadmin";
	}

}
