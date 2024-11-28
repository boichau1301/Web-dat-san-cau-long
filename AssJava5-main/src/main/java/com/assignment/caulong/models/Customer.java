package com.assignment.caulong.models;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "KhachHang")
public class Customer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaKhachHang")
	private int id;
	@Column(name = "HoTen", length = 100)
	private String name;
	@Column(name = "Email", length = 100, unique = true)
	private String email;
	@Column(name = "SoDienThoai", length = 15, unique = true)
	private String phoneNumber;
	@Column(name = "DiaChi")
	private String address;
	@Column(name = "Username", length = 50, unique = true)
	private String username;
	@Column(name = "Password")
	private String password;
	@OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
	private List<CourtOrder> orders;

	public Customer() {
		super();
	}

	public Customer(String name, String email, String phoneNumber, String address, String username, String password) {
		super();
		this.name = name;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.username = username;
		this.password = password;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<CourtOrder> getOrders() {
		return orders;
	}

	public void setOrders(List<CourtOrder> orders) {
		this.orders = orders;
	}

}
