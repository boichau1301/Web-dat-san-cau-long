package com.assignment.caulong.controllers;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.caulong.models.IncomeByMonth;
import com.assignment.caulong.service.IncomeService;

@Controller
@RequestMapping("/employee")
public class IncomeController {
	
    private IncomeService incomeService; // Dịch vụ để lấy dữ liệu
	
    @Autowired
	public IncomeController(IncomeService incomeService) {
		super();
		this.incomeService = incomeService;
	}
	
	private int FIRST_PAGE_NUMBER = 0;
	private int NUMBER_OF_ITEM_PER_PAGE = 3;
	
	@RequestMapping("/report")
	public String showRevenueReport(@RequestParam("p") Optional<Integer> p,
	                                 @RequestParam("month") Optional<Integer> month,
	                                 @RequestParam("year") Optional<Integer> year,
	                                 Model model) {
	    // Lấy ngày hiện tại nếu tháng và năm không được truyền vào
	    LocalDate now = LocalDate.now();
	    int currentMonth = month.orElse(now.getMonthValue());
	    int currentYear = year.orElse(now.getYear());

	    // Lấy danh sách các tháng và năm có sẵn để hiển thị trong dropdown
	    List<Integer> availableMonths = incomeService.getAvailableMonths();
	    List<Integer> availableYears = incomeService.getAvailableYears();

	    model.addAttribute("currentMonth", currentMonth);
	    model.addAttribute("currentYear", currentYear);
	    model.addAttribute("availableMonths", availableMonths);
	    model.addAttribute("availableYears", availableYears);

	    // Xử lý số trang
	    int pageNum = p.orElse(FIRST_PAGE_NUMBER);
	    if (pageNum < 0) {
	        pageNum = FIRST_PAGE_NUMBER;
	    }

	    // Tạo Pageable
	    Pageable pageable = PageRequest.of(pageNum, NUMBER_OF_ITEM_PER_PAGE);
	    Page<IncomeByMonth> page = incomeService.getRevenueByMonthYear(currentMonth, currentYear, pageable);

	    // Thêm thuộc tính trang vào model
	    model.addAttribute("page", page);
	    model.addAttribute("revenueReports", page.getContent());
	    model.addAttribute("feature", "income");

	    return "nhanvien/doanhthutheothang"; // Trả về tên của JSP
	}

	
	@RequestMapping("/time")
	public String showReportTimeSlot(Model model, 
	                                 @RequestParam(value = "month", required = false) Integer month, 
	                                 @RequestParam(value = "year", required = false) Integer year) {

	    // Lấy ngày hiện tại nếu tháng và năm không được truyền vào
	    LocalDate now = LocalDate.now();
	    int currentMonth = (month != null) ? month : now.getMonthValue();
	    int currentYear = (year != null) ? year : now.getYear();

	    // Lấy danh sách các tháng và năm có sẵn để hiển thị trong dropdown
	    List<Integer> availableMonths = incomeService.getAvailableMonths();
	    List<Integer> availableYears = incomeService.getAvailableYears();

	    // Lấy báo cáo theo tháng và năm
	    List<Object[]> timeSlotReports = incomeService.getBookingReportByTimeSlot(currentMonth, currentYear);
	    System.out.println(timeSlotReports);

	    // Thêm thông tin vào model
	    model.addAttribute("month", currentMonth);
	    model.addAttribute("year", currentYear);
	    model.addAttribute("months", availableMonths); // Các tháng có sẵn
	    model.addAttribute("years", availableYears); // Các năm có sẵn
	    model.addAttribute("timeSlotReports", timeSlotReports); // Báo cáo khung giờ
	  
	    return "nhanvien/thongkekhunggio"; // Trả về JSP
	}
}
