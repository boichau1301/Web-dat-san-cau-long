package com.assignment.caulong.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.assignment.caulong.models.Product;
import com.assignment.caulong.repository.ProductRepository;

@Controller
public class ProductController {
	
	@Autowired
	ProductRepository prodRepo;
	
	@GetMapping("/productList")
	public String getMethodName(Model model) 
	{
		List<Product> products=prodRepo.findAll();
		model.addAttribute("", products);
		
		return "DanhSachSanPham";
	}
	
	@GetMapping("/productDetail/{maSanPham}")
	public String getProductDetail(Model model,@PathVariable("maSanPham") String maSanPham)
	{
		Product product=prodRepo.findById(maSanPham).orElse(null);
		model.addAttribute("product", product);
		return "SanPham/ChiTietSanPham";
	}
	
	@GetMapping("/addToCart/{maSanPham}")
	public String addProductToCart(@PathVariable("maSanPham") String maSanPham,Model model)
	{
		
		return "";
	}
	
}
