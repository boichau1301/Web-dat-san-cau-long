package com.assignment.caulong.models;

import java.io.Serializable;
import java.util.Objects;

import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor

public class CartId implements Serializable {

	private int MaKhachHang;
	private String MaSanPham;
	
	@Override
	public int hashCode() {
		return Objects.hash(MaKhachHang, MaSanPham);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartId other = (CartId) obj;
		return MaKhachHang == other.MaKhachHang && MaSanPham == other.MaSanPham;
	}
	
	

}