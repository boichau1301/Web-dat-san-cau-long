package com.assignment.caulong.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="AnhSan")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BadmintonCourtPic {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaAnhSan")
	private int id;
	
	@Column(name="LinkAnh")
	private String linkAnh;
	
	@ManyToOne
	@JoinColumn(name="MaSan")
	private BadmintonCourt badmintonCourt;

	public BadmintonCourtPic(String linkAnh, BadmintonCourt badmintonCourt) {
		super();
		this.linkAnh = linkAnh;
		this.badmintonCourt = badmintonCourt;
	}
	
}
