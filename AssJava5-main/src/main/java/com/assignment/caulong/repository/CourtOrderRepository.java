package com.assignment.caulong.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.assignment.caulong.models.CourtOrder;
import com.assignment.caulong.models.IncomeByMonth;
import com.assignment.caulong.models.MonthlyStats;
import com.assignment.caulong.models.RevenueByCourt;

public interface CourtOrderRepository extends JpaRepository<CourtOrder, Integer> {
	
	@Query("select co from CourtOrder co "
			+ "where co.customer.name like coalesce(:searchCustomer, co.customer.name) "
			+ "and co.badmintonCourt.name like coalesce(:searchCourt, co.badmintonCourt.name) "
			+ "and co.status = coalesce(:status, co.status) "
			+ "and hour(co.start) >= :min and hour(co.end) <= :max")
	Page<CourtOrder> findSearch(String searchCustomer, String searchCourt, String status, int min, int max, Pageable pageable);
	
	List <CourtOrder> findByDateBetween(Date dateStart, Date dateEnd);
	List <CourtOrder> findByStatusLike(String status);
	
	@Query("SELECT "
	        + "new com.assignment.caulong.models.MonthlyStats("
	        + "COALESCE(SUM(r.totalAmount), 0), "
	        + "COUNT(o.id), "
	        + "COUNT(DISTINCT o.customer)) "
	        + "FROM CourtOrder o "
	        + "LEFT JOIN CourtReceipt r ON o.id = r.courtOrder.id "
	        + "WHERE r.paymentStatus = true AND r.paymentDate >= :startDate AND r.paymentDate < :endDate")
	MonthlyStats countByIncomeMonthNow(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

		
	@Query("SELECT new com.assignment.caulong.models.RevenueByCourt(c.name AS courtName, SUM(r.totalAmount) AS totalRevenue) " +
		       "FROM CourtReceipt r " +
		       "JOIN r.courtOrder o " +
		       "JOIN o.badmintonCourt c " +
		       "WHERE r.paymentStatus = true AND r.paymentDate BETWEEN :startDate AND :endDate " +
		       "GROUP BY c.name " +
		       "ORDER BY totalRevenue DESC")
	List<RevenueByCourt> findRevenueByCourtForCurrentMonth(
			@Param("startDate") Date startDate, 
            @Param("endDate") Date endDate);

	@Query("SELECT DISTINCT MONTH(hd.paymentDate) FROM CourtReceipt hd")
    List<Integer> findDistinctMonths();

    @Query("SELECT DISTINCT YEAR(hd.paymentDate) FROM CourtReceipt hd")
    List<Integer> findDistinctYears();

	@Query("SELECT new com.assignment.caulong.models.IncomeByMonth( "
	        + "sc.name, "  // Tên sân
	        + "sc.address, "  // Địa chỉ sân
	        + "sc.price, "  // Giá sân
	        + "COUNT(o.id), "  // Số lượt đặt
	        + "SUM(TIMESTAMPDIFF(MINUTE, o.start, o.end) / 60.0), "  // Tổng số giờ đặt
	        + "SUM(sc.price * TIMESTAMPDIFF(MINUTE, o.start, o.end) / 60.0), "  // Tổng doanh thu từ các lần đặt
	        + "SUM(sc.price * TIMESTAMPDIFF(MINUTE, o.start, o.end) / 60.0) * 0.15) "  // Doanh thu ròng
	        + "FROM CourtOrder o "
	        + "JOIN o.badmintonCourt sc "
	        + "JOIN o.courtReceipt r "
	        + "WHERE r.paymentStatus = true "
	        + "AND MONTH(r.paymentDate) = :month "
	        + "AND YEAR(r.paymentDate) = :year "
	        + "GROUP BY sc.name, sc.address, sc.price "
	        + "ORDER BY SUM(sc.price * TIMESTAMPDIFF(MINUTE, o.start, o.end) / 60.0) DESC")
	Page<IncomeByMonth> getMonthlyRevenueReport(@Param("month") int month, @Param("year") int year, Pageable pageable);
	

	@Query(value = "SELECT " +
            "    CASE " +
            "        WHEN GioBatDau BETWEEN '06:00:00' AND '07:59:59' THEN '6h-8h' " +
            "        WHEN GioBatDau BETWEEN '08:00:00' AND '09:59:59' THEN '8h-10h' " +
            "        WHEN GioBatDau BETWEEN '10:00:00' AND '11:59:59' THEN '10h-12h' " +
            "        WHEN GioBatDau BETWEEN '12:00:00' AND '13:59:59' THEN '12h-14h' " +
            "        WHEN GioBatDau BETWEEN '14:00:00' AND '15:59:59' THEN '14h-16h' " +
            "        WHEN GioBatDau BETWEEN '16:00:00' AND '17:59:59' THEN '16h-18h' " +
            "        WHEN GioBatDau BETWEEN '18:00:00' AND '19:59:59' THEN '18h-20h' " +
            "        ELSE '20h trở đi' " +
            "    END AS KhungGio, " +
            "    COUNT(dsc.MaDatSan) AS SoLuotDat, " +
            "    SUM(DATEDIFF(HOUR, dsc.GioBatDau, dsc.GioKetThuc)) AS TongSoGioDaDat, " +
            "    SUM(sc.GiaSan * DATEDIFF(HOUR, dsc.GioBatDau, dsc.GioKetThuc)) AS DoanhThu " +
            "FROM " +
            "    DatSanCau dsc " +
            "JOIN " +
            "    SanCau sc ON dsc.MaSan = sc.MaSan " +
            "JOIN " +
            "    HoaDonDatSan hd ON dsc.MaDatSan = hd.MaDatSan " +
            "WHERE " +
            "    MONTH(dsc.NgayDat) = :thang " +
            "    AND YEAR(dsc.NgayDat) = :nam " +
            "    AND hd.TrangThaiThanhToan = 1 " +
            "GROUP BY " +
            "    CASE " +
            "        WHEN GioBatDau BETWEEN '06:00:00' AND '07:59:59' THEN '6h-8h' " +
            "        WHEN GioBatDau BETWEEN '08:00:00' AND '09:59:59' THEN '8h-10h' " +
            "        WHEN GioBatDau BETWEEN '10:00:00' AND '11:59:59' THEN '10h-12h' " +
            "        WHEN GioBatDau BETWEEN '12:00:00' AND '13:59:59' THEN '12h-14h' " +
            "        WHEN GioBatDau BETWEEN '14:00:00' AND '15:59:59' THEN '14h-16h' " +
            "        WHEN GioBatDau BETWEEN '16:00:00' AND '17:59:59' THEN '16h-18h' " +
            "        WHEN GioBatDau BETWEEN '18:00:00' AND '19:59:59' THEN '18h-20h' " +
            "        ELSE '20h trở đi' " +
            "    END " +
            "ORDER BY KhungGio", nativeQuery = true)
	List<Object[]> getBookingReportByTimeSlot(@Param("thang") int month, @Param("nam") int year);
	
}
