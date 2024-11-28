package com.assignment.caulong.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.caulong.models.Employee;
import com.assignment.caulong.repository.EmployeeRepository;
import com.assignment.caulong.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	private EmployeeRepository empRepo;
	private EmployeeService empService;

	@Autowired
	public EmployeeController(EmployeeRepository empRepo, EmployeeService empService) {
		super();
		this.empRepo = empRepo;
		this.empService = empService;
	}

	@GetMapping("/employeeManager")
	public String employee(Model model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		Employee employee = new Employee();
		model.addAttribute("employee", employee);
		if (page < 1) {
            return "redirect:/employee/employeeManager";
        }
		
		Page<Employee> employeeList = empService.findSearch(page);
		model.addAttribute("nhanViens", employeeList);
		model.addAttribute("currentPage", page);
		return "nhanvien/quanlynhanvien";
	}

	@GetMapping("/employeeManager/{id}")
	public String editEmployee(Model model, 
			@PathVariable("id") Optional<String> id, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		if (page < 1) {
            return "redirect:/employee/employeeManager/" + id.get();
        }
		
		Page<Employee> employeeList = empService.findSearch(page);
		Optional<Employee> employeeFound = empRepo.findById(id.orElse(""));
		Employee employee = new Employee();
		if(employeeFound.isPresent())
			employee = employeeFound.get();
		else
			model.addAttribute("errorNotFound", "Không tìm thấy nhân viên " + id.orElse(""));
		
		model.addAttribute("employee", employee);
		model.addAttribute("nhanViens", employeeList);
		model.addAttribute("currentPage", page);
		
		return "nhanvien/quanlynhanvien";
	}

	@PostMapping("/employeeUpdate")
	public String updateEmployee(Model model, 
			@ModelAttribute("employee") Employee employee) {
		Optional<Employee> found = empRepo.findById(employee.getId());
		if(found.isPresent())
			empRepo.save(employee);
		return "redirect:/employee/employeeManager";
	}

	@GetMapping("/employeeRemove/{id}")
	public String removeEmployee(Model model, 
			@PathVariable("id") Optional<String> id) {
		if (!id.isEmpty()) {
			Optional<Employee> employee = empRepo.findById(id.orElse(null));
			if (employee.isPresent()) {
				empRepo.delete(employee.get());
				model.addAttribute("message", "Xóa nhân viên thành công");
			} else {
				model.addAttribute("message", "Xóa nhân viên thất bại");
			}
		} else {
			model.addAttribute("message", "Xóa nhân viên thất bại");
		}
		return "redirect:/employee/employeeManager";
	}

	@GetMapping("/employeeAdd")
	public String addEmployee(Model model) {
		Employee employee = new Employee();

		model.addAttribute("employee", employee);

		return "nhanvien/ThemNhanVien";
	}

	@PostMapping("/employeeAdd")
	public String saveEmployee(Model model, 
			@Validated @ModelAttribute Employee employee, 
			BindingResult result) {
		
		if(result.hasErrors())
			return "/nhanvien/ThemNhanVien";
		
		empRepo.save(employee);
		
		return "redirect:/employee/employeeManager";
	}

}
