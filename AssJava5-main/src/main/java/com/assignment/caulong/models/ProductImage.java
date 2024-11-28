package com.assignment.caulong.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="HinhSanPham")
public class ProductImage {

	@Id
	@Column(name="MaSanPham")
	private String maSanPham;
	
	@Column(name="DuongDanHinh")
	private String duongDanHinh;
	
	@ManyToOne
	@JoinColumn(name="MaSanPham", referencedColumnName="MaSanPham", insertable=false, updatable=false)
	private Product prouduct;
		
}
