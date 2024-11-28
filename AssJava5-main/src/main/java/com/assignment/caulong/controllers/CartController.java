package com.assignment.caulong.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.caulong.models.Cart;
import com.assignment.caulong.models.CartId;
import com.assignment.caulong.models.Customer;
import com.assignment.caulong.models.Product;
import com.assignment.caulong.repository.CartRepository;
import com.assignment.caulong.repository.CustomerRepository;
import com.assignment.caulong.repository.ProductRepository;


@Controller
public class CartController {
	@Autowired
	CartRepository cartRepo;
	@Autowired
	ProductRepository prodRepo;
	@Autowired
	CustomerRepository cusRepo;
	
	@PostMapping("/addToCart/{maSP}")
	public String addToCart(@PathVariable("maSP")String maSanPham,Model model)
	{
		Cart cartInfor=cartRepo.findByCustomerIdAndProductMaSanPham(1, maSanPham).orElse(null);
		if(cartInfor!=null)
		{
			cartInfor.setQuantity(cartInfor.getQuantity()+1);
		}
		else
		{
			Product product=prodRepo.getById(maSanPham);
			Customer customer=cusRepo.getById(1);
			Cart cart = new Cart();
			CartId cartid=new CartId();
			cart.setCartId(cartid);
			cart.setCustomer(customer);
			cart.setProduct(product);
			cart.setQuantity(1);
			cartRepo.save(cart);
		}
		return "redirect:/ShowCartInfor/1";
	}
	
	@GetMapping("/ShowCart")
	public String getCartList(Model model) {
		List<Cart> listCart=cartRepo.findAll();
		model.addAttribute("listCart", listCart);
		return "GioHang";
	}
	
	
	
	
	@GetMapping("/ShowCartInfor/{id}")
	public String showCartInFor(@PathVariable("id") int maKH,Model model)
	{
		List<Cart> listCart=cartRepo.findByCustomerId(maKH);
		model.addAttribute("listCart", listCart);
		return "GioHang";
	}
}
