package com.assignment.caulong.models;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "SanCau")
public class BadmintonCourt {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaSan")
	private int id;
	@Column(name = "TenSan")
	private String name;
	@Column(name = "LoaiSan", columnDefinition = "nvarchar")
	private String type;
	@Column(name = "GiaSan")
	private double price;
	@Column(name = "MoTa")
	private String description;
	@Column(name = "DiaChi")
	private String address;
	@Column(name = "TrangThai")
	private boolean availability;
	@OneToMany(mappedBy = "badmintonCourt", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<CourtOrder> courtorders;
	@OneToMany(mappedBy = "badmintonCourt", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<BadmintonCourtPic> badmintonCourtPics;

	public BadmintonCourt(int id, String name, String type, double price, String description, String address,
			boolean availability) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.price = price;
		this.description = description;
		this.address = address;
		this.availability = availability;
	}
	
	public BadmintonCourt(int id, String name, String type, double price, String description, String address,
			boolean availability, List<BadmintonCourtPic> badmintonCourtPics) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.price = price;
		this.description = description;
		this.address = address;
		this.availability = availability;
		this.badmintonCourtPics = badmintonCourtPics;
	}
	
}
