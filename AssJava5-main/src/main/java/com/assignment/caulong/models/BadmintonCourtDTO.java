package com.assignment.caulong.models;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

import java.util.List;

public class BadmintonCourtDTO {

	private int id;
	@NotEmpty(message = "Tên không được để trống")
	private String name;
	@NotEmpty(message = "Loại không được để trống")
	private String type;
	@Min(value = 1, message = "Giá phải trên 0")
	private double price;
	@NotEmpty(message = "Mô tả không được để trống")
	private String description;
	@NotEmpty(message = "Địa chỉ không được để trống")
	private String address;
	@NotNull(message = "Trạng thái không được để trống")
	private boolean availability;
	private List<MultipartFile> images;
	
	public BadmintonCourtDTO() {}

	public BadmintonCourtDTO(int id, String name, String type, double price, String description, String address, boolean availability, List<MultipartFile> images) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.price = price;
		this.description = description;
		this.address = address;
		this.availability = availability;
		this.images = images;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public boolean isAvailability() {
		return availability;
	}

	public void setAvailability(boolean availability) {
		this.availability = availability;
	}

	public List<MultipartFile> getImages() {
		return images;
	}

	public void setImages(List<MultipartFile> images) {
		this.images = images;
	}
	
}
