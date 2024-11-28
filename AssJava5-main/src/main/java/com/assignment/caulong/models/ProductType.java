package com.assignment.caulong.models;

import jakarta.persistence.Entity;

import java.util.List;

import jakarta.persistence.*;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="LoaiSanPham")
public class ProductType {
	
	 	@Id
	    @Column(name = "MaLoai", length = 50)
	    private String maLoai;
	 	
	 	@Column(name = "TenLoai")
	    private String tenLoai;
	 	
	 	 @OneToMany(mappedBy = "loaiSanPham", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	     private List<Product> products;
}
