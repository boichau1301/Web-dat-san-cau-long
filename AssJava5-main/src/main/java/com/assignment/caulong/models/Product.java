package com.assignment.caulong.models;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="SanPham")
public class Product {
	
	@Id
	@Column(name="MaSanPham")
    private String maSanPham;
	@Column(name="TenSanPham")
    private String tenSanPham;
	@Column(name="DonGia")
    private Double donGia;
	@ManyToOne 
	@JoinColumn(name = "MaLoai")
	private ProductType loaiSanPham;
    @Column(name="MoTa")
    private String moTa;
    @OneToMany(mappedBy = "prouduct", cascade = CascadeType.ALL)
    private List<ProductImage> productImages;
   
}
