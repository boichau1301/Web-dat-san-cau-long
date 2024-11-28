package com.assignment.caulong.models;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "HoaDonDatSan")
public class CourtReceipt {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SoHoaDon")
	private Integer invoiceNumber;

	@ManyToOne
	@JoinColumn(name = "MaDatSan")
	private CourtOrder courtOrder;

	@Column(name = "NgayThanhToan")
	private Date paymentDate;

	@Column(name = "TongTien")
	private Double totalAmount;

	@Column(name = "TrangThaiThanhToan", columnDefinition = "BIT DEFAULT 0")
	private Boolean paymentStatus = false; // false: unpaid, true: paid

	@Column(name = "GiamGia")
	private Double discount; // Discount amount

	@ManyToOne
	@JoinColumn(name = "MaNhanVien")
	private Employee employee;
	
	public CourtReceipt(Integer invoiceNumber, CourtOrder courtOrder, Date paymentDate, Double totalAmount,
			Boolean paymentStatus, Double discount, Employee employee) {
		super();
		this.invoiceNumber = invoiceNumber;
		this.courtOrder = courtOrder;
		this.paymentDate = paymentDate;
		this.totalAmount = totalAmount;
		this.paymentStatus = paymentStatus;
		this.discount = discount;
		this.employee = employee;
	}

	public CourtReceipt() {
		super();
	}

	public Integer getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(Integer invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public CourtOrder getCourtOrder() {
		return courtOrder;
	}

	public void setCourtOrder(CourtOrder courtOrder) {
		this.courtOrder = courtOrder;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Boolean getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(Boolean paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

}