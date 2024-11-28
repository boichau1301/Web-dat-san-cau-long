package com.assignment.caulong.controllers;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.assignment.caulong.models.BadmintonCourt;
import com.assignment.caulong.models.BadmintonCourtDTO;
import com.assignment.caulong.models.BadmintonCourtPic;
import com.assignment.caulong.repository.BadmintonCourtRepository;
import com.assignment.caulong.service.BadmintonCourtService;
import com.assignment.caulong.service.UploadService;
import com.assignment.caulong.util.UrlString;

@Controller
@RequestMapping("/employee")
public class BadmintonCourtController {

	private BadmintonCourtRepository courtRepo;
	private BadmintonCourtService courtService;
	private UploadService uploadService;

	@Autowired
	public BadmintonCourtController(BadmintonCourtRepository courtRepo,
			BadmintonCourtService courtService, UploadService uploadService) {
		super();
		this.courtRepo = courtRepo;
		this.courtService = courtService;
		this.uploadService = uploadService;
	}

	@GetMapping("/badmintonManager")
	public String badmintoncourt(Model model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "searchName", required = false) String searchName,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "searchCountry", required = false) String searchCountry,
			@RequestParam(value = "minPrice", required = false, defaultValue = "0") int minPrice,
			@RequestParam(value = "maxPrice", required = false, defaultValue = "1000000") int maxPrice,
			@RequestParam(value = "sort", required = false) String sort) {
		
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("searchName", searchName);
		params.put("searchType", searchType);
		params.put("searchCountry", searchCountry);
		params.put("minPrice", minPrice);
		params.put("maxPrice", maxPrice);
		params.put("sort", sort);
		String urlString = UrlString.param(model, params);
		model.addAttribute("urlString", urlString);
		
		model.addAttribute("sanChiTiet", new BadmintonCourt());
		if (page < 1)
            return "redirect:/badmintonManager" + urlString;
		
		Page<BadmintonCourt> list = courtService.findAll(searchName, searchType, searchCountry, minPrice, maxPrice, sort, page);
		model.addAttribute("sans", list);
		model.addAttribute("currentPage", page);
		return "nhanvien/quanlysan";
	}
	
	@GetMapping("/badmintonManager/{id}")
	public String detailBadminton(Model model, 
			@PathVariable("id") Optional<Integer> id, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "searchName", required = false) String searchName,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "searchCountry", required = false) String searchCountry,
			@RequestParam(value = "minPrice", required = false, defaultValue = "0") int minPrice,
			@RequestParam(value = "maxPrice", required = false, defaultValue = "1000000") int maxPrice,
			@RequestParam(value = "sort", required = false) String sort) {
		
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("searchName", searchName);
		params.put("searchType", searchType);
		params.put("searchCountry", searchCountry);
		params.put("minPrice", minPrice);
		params.put("maxPrice", maxPrice);
		params.put("sort", sort);
		String urlString = UrlString.param(model, params);
		model.addAttribute("urlString", urlString);
		
		model.addAttribute("sanChiTiet", new BadmintonCourt());
		if (page < 1)
            return "redirect:/employee/badmintonManager/" + id.get() + urlString;
		
		Optional<BadmintonCourt> found = courtRepo.findById(id.orElse(-1));
		BadmintonCourt court = new BadmintonCourt();
		if(found.isPresent())
			court = found.get();
		else
			model.addAttribute("errorNotFound", "Không tìm thấy sân " + id.orElse(-1));
		
		Page<BadmintonCourt> list = courtService.findAll(searchName, searchType, searchCountry, minPrice, maxPrice, sort, page);
		model.addAttribute("sanChiTiet", court);
		model.addAttribute("sans", list);
		model.addAttribute("currentPage", page);
		return "nhanvien/quanlysan";
	}
	
	@PostMapping("/badmintonUpdate")
	public String updateBadminton(Model model,
			@ModelAttribute("sanChiTiet") BadmintonCourt court) {
		Optional<BadmintonCourt> found = courtRepo.findById(court.getId());
		if(found.isPresent())
			courtRepo.save(court);
		return "redirect:/employee/badmintonManager";
	}
	
	@GetMapping("/badmintonRemove/{id}")
	public String removeBadminton(Model model, @PathVariable("id") Optional<Integer> id) {
		if (!id.isEmpty()) {
			Optional<BadmintonCourt> court = courtRepo.findById(id.orElse(-1));
			if (court.isPresent()) {
				courtRepo.delete(court.get());
				model.addAttribute("message", "Xóa sân thành công");
			} else {
				model.addAttribute("message", "Xóa sân thất bại");
			}
		} else {
			model.addAttribute("message", "Xóa sân thất bại");
		}
		return "redirect:/employee/badmintonManager";
	}
	
	@GetMapping("/badmintonAdd")
	public String addBadminton(Model model) {
		BadmintonCourtDTO court = new BadmintonCourtDTO();
		model.addAttribute("court", court);
		return "nhanvien/themsan";
	}
	
	@PostMapping("/badmintonAdd")
	public String saveBadminton(Model model, @Validated @ModelAttribute("court") BadmintonCourtDTO courtDTO, BindingResult result) {
		if (courtDTO.getImages().isEmpty())
			result.addError(new FieldError("productDTO", "image", "Hình ảnh phải có"));
		
		if(result.hasErrors()) {
			return "nhanvien/themsan";
		}
		
		BadmintonCourt court = new BadmintonCourt(courtDTO.getId(), courtDTO.getName(), courtDTO.getType(), courtDTO.getPrice(), courtDTO.getDescription(), courtDTO.getAddress(), courtDTO.isAvailability());
		
		List<BadmintonCourtPic> pics = new ArrayList<>();
		for(MultipartFile image : courtDTO.getImages()) {
			if(!image.isEmpty()) {
				String url = uploadService.uploadMultipartFileToCloudinary(image);
				pics.add(new BadmintonCourtPic(url, court));
			}
		}
		
		court.setBadmintonCourtPics(pics);
		courtRepo.save(court);
		
		return "redirect:/employee/badmintonManager";
	}
	
	@ModelAttribute("loaiSan")
	public Map<String, String> listLoaiSan() {
		Map<String, String> map = new LinkedHashMap<>();
		map.put("thuong", "Sân Thường");
		map.put("phothong", "Sân Phổ Thông");
		map.put("caocap", "Sân Cao Cấp");
		map.put("vip", "Sân VIP");
		return map;
	}
	
	@ModelAttribute("khuvuc")
	public Map<String, String> listKhuVuc() {
		Map<String, String> map = new LinkedHashMap<>();
		map.put("tatca", "Tất cả");
		map.put("hanoi", "Hà Nội");
		map.put("tphcm", "Hồ Chí Minh");
		return map;
	}
	
	@GetMapping("/badmintonDetail/{id}")
	public String GetBadmintonDetail(Model model,@PathVariable() int id)
	{
		BadmintonCourt badmintonCourt=courtRepo.findById(id).orElse(null);
		System.out.println(badmintonCourt.getName());
		model.addAttribute("san", badmintonCourt);
		return "ChiTietSan";
	}

}
