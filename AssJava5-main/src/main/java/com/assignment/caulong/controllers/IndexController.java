package com.assignment.caulong.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.assignment.caulong.models.BadmintonCourt;
import com.assignment.caulong.models.Product;
import com.assignment.caulong.repository.BadmintonCourtRepository;
import com.assignment.caulong.repository.ProductRepository;

import jakarta.websocket.server.PathParam;

import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class IndexController {
	@Autowired
	BadmintonCourtRepository badmintonRepo;
	
	@Autowired
	ProductRepository prodRep;
	
	@GetMapping("/")
	public String getWebSite(Model model,Principal principal)
	{
		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		if(authentication !=null) {
			authentication.isAuthenticated();
		}
		List<BadmintonCourt> cacSan=badmintonRepo.findAll();
		System.out.println("Số lượng: "+cacSan.size());
		model.addAttribute("cacsancau", cacSan);
		List<Product> cacSanPham=prodRep.findAll();
		model.addAttribute("cacSanPham", cacSanPham);
		if(principal!=null) {
		System.out.println(principal.getName());
		}
		return "index";
	}
	
	@RequestMapping("/SortByAddress")
	public String getMethodName(@RequestParam("timKhuVuc") String address,Model model) {
		List<BadmintonCourt> cacSan=badmintonRepo.findByAddressContaining(address);
		System.out.println(address);
		model.addAttribute("cacsancau", cacSan);
		List<Product> cacSanPham=prodRep.findAll();
		model.addAttribute("cacSanPham", cacSanPham);
		return "index";
	}
	
	@RequestMapping("/DanhSachSanTheoTinh")
	public String LayDanhSachSan(Model model)
	{
		
		List<BadmintonCourt> cacSan=badmintonRepo.findByAddressContaining("Hà Nội");
		model.addAttribute("cacsancauHaNoi", cacSan);
		
		List<BadmintonCourt> cacSanhcm=badmintonRepo.findByAddressContaining("Hồ Chí Minh");
		model.addAttribute("cacsancauHCM", cacSanhcm);
		return "DanhSachSan";
	}
	
	@RequestMapping("/DanhSachSanTheoLoaiSan")
	public String LayDanhSachSanTheoLoai(Model model)
	{
		
//		List<BadmintonCourt> cacSan=badmintonRepo.findByAddressContaining("Hà Nội");
//		model.addAttribute("cacsancauHaNoi", cacSan);
//		
//		List<BadmintonCourt> cacSanhcm=badmintonRepo.findByAddressContaining("Hồ Chí Minh");
//		model.addAttribute("cacsancauHCM", cacSanhcm);
		
		List<BadmintonCourt> cacSanThuong=badmintonRepo.findByTypeContaining("Sân Thường");
		
		List<BadmintonCourt> cacSanPhoThong=badmintonRepo.findByTypeContaining("Sân Phổ Thông");
		
		List<BadmintonCourt> cacSanCaoCap=badmintonRepo.findByTypeContaining("Sân Cao Cấp");
		
		List<BadmintonCourt> cacSanVip=badmintonRepo.findByTypeContaining("Sân VIP");
		
		model.addAttribute("cacsancauthuong", cacSanThuong);
		model.addAttribute("cacsancauphothong", cacSanPhoThong);
		model.addAttribute("cacsancaucaocap", cacSanCaoCap);
		model.addAttribute("cacsancauvip", cacSanVip);
		
		return "DanhSachSan";
	}
	
}
