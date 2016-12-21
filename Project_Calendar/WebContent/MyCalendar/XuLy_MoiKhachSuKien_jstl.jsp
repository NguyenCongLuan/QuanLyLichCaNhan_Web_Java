<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<% request.setCharacterEncoding("UTF-8"); %>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/QuanLyLichCaNhan?useUnicode=yes&characterEncoding=UTF-8"
		user="root" password="trongtri96"/>
		
		
		
<sql:update dataSource="${snapshot}" var="result1">
        	
            INSERT INTO SuKien(TenSuKien, DiaDiem, NgayBatDau, GioBatDau, NgayKetThuc, GioKetThuc,
            BaoQua, BaoTruoc, SoLanLap, KhoangThoiGianLap, ChuKyLap, MoTa, TenDangNhap) 
              VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
            <sql:param value="${param.tensukien}" />
            <sql:param value="${param.diadiem}" />
            <sql:param value="${param.ngaybatdau}" />
            <sql:param value="${param.giobatdau}" />
            <sql:param value="${param.ngayketthuc}" />
            <sql:param value="${param.gioketthuc}" />
            <sql:param value="${param.BaoQua}" />
            <sql:param value="${param.BaoTruoc}" />
            <sql:param value="${param.SoLanLap}" />
            <sql:param value="${param.KhoangThoiGianLap}" />
            <sql:param value="${param.ChuKyLap}" />
            <sql:param value="${param.comment}" />
            <sql:param value="${sessionScope['loginUser']}" />
        </sql:update>
        
        
        <sql:query dataSource ="${snapshot}" var="result0">
select * from SuKien where TenDangNhap = '${sessionScope['loginUser']}' order by MaSuKien desc limit 1 ;

</sql:query>    

<sql:query dataSource ="${snapshot}" var="result">
select TenDangNhap from NguoiDung 
where TenDangNhap='${param.email}' or HoTen='${param.email}' or Email='${param.email}'
	        or SoDienThoai='${param.email}';
</sql:query>


<c:forEach var = "row0" items = "${result0.rows}">

<c:forEach var = "row" items = "${result.rows}">
	<sql:update dataSource="${snapshot}" var="result2">
        	
            INSERT INTO MoiKhach_SuKien(MaSuKien, TenDangNhap_KhachMoi) values (?, ?);
            <sql:param value="${row0.MaSuKien}" />
            <sql:param value="${row.TenDangNhap}" />
            
        </sql:update>
</c:forEach>
</c:forEach>

<c:if test="${result2>=1}">
             <% request.setCharacterEncoding("UTF-8"); %>
 
            <c:redirect url="TimBanBe.jsp" >
                <c:param name="susMsg" value="Đã thêm 1 sự kiện có khách thành công!" />
                <c:param name="id_email" value="${param.email}"/>
            </c:redirect>
        </c:if> 
        
<%-- <c:if test="${result1>=1}">
             <% request.setCharacterEncoding("UTF-8"); %>
 
            <c:redirect url="ThemSuKien.jsp" >
                <c:param name="susMsg" value="Đã thêm 1 sự kiện thành công!" />
            </c:redirect>
        </c:if>  --%>


<%-- <c:if test="${not empty param.email}">
	<sql:query dataSource="${snapshot}" var="selectQ">
	        select count(*) as kount from NguoiDung
	        where TenDangNhap='${param.email}' or HoTen='${param.email}' or Email='${param.email}'
	        or SoDienThoai='${param.email}'
	        
	      </sql:query>
	 
	      <c:forEach items="${selectQ.rows}" var="r">
	        <c:choose>
	          <c:when test="${r.kount gt 0}">
	            
	            
	            <c:redirect url="TrangChu.jsp" >
	            <% request.setCharacterEncoding("UTF-8"); %>
	               <c:param name="Msg_MoiKhach" value="${param.email}"/>
	               
	            </c:redirect>
	            
	            
	            <sql:update dataSource="${snapshot}" var="result1">
        	
            INSERT INTO SuKien(TenSuKien, DiaDiem, NgayBatDau, GioBatDau, NgayKetThuc, GioKetThuc,
            BaoQua, BaoTruoc, SoLanLap, KhoangThoiGianLap, ChuKyLap, MoTa, TenDangNhap) 
              VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
            <sql:param value="${param.tensukien}" />
            <sql:param value="${param.diadiem}" />
            <sql:param value="${param.ngaybatdau}" />
            <sql:param value="${param.giobatdau}" />
            <sql:param value="${param.ngayketthuc}" />
            <sql:param value="${param.gioketthuc}" />
            <sql:param value="${param.BaoQua}" />
            <sql:param value="${param.BaoTruoc}" />
            <sql:param value="${param.SoLanLap}" />
            <sql:param value="${param.KhoangThoiGianLap}" />
            <sql:param value="${param.ChuKyLap}" />
            <sql:param value="${param.comment}" />
            <sql:param value="${sessionScope['loginUser']}" />
        </sql:update>
	            
	            <sql:query dataSource ="${snapshot}" var="result0">
select * from SuKien where TenDangNhap = '${sessionScope['loginUser']}' order by MaSuKien desc limit 1 ;

</sql:query>            
	            <sql:query dataSource ="${snapshot}" var="result">
select TenDangNhap from NguoiDung 
where TenDangNhap='${param.email}' or HoTen='${param.email}' or Email='${param.email}'
	        or SoDienThoai='${param.email}';
</sql:query>

<c:forEach var = "row0" items = "${result0.rows}">

<c:forEach var = "row" items = "${result.rows}">
	<sql:update dataSource="${snapshot}" var="result2">
        	
            INSERT INTO MoiKhach_SuKien(MaSuKien, TenDangNhap_KhachMoi) values (?, ?);
            <sql:param value="${row0.MaSuKien}" />
            <sql:param value="${row.TenDangNhap}" />
            
        </sql:update>
</c:forEach>
</c:forEach>
	            
        
        <c:if test="${result2>=1}">
             <% request.setCharacterEncoding("UTF-8"); %>
 
            <c:redirect url="ThemSuKien.jsp" >
                <c:param name="susMsg" value="Đã thêm 1 sự kiện có khách thành công!" />
                <c:param name="susMsg_Username" value="${param.email}" />
            </c:redirect>
        </c:if> 
	            
	            
	          </c:when>
	          <c:otherwise>
	            <c:redirect url="ThemSuKien.jsp" >
	              <c:param name="errMsg_Khach" value="User bạn mời không tồn tại! Vui lòng thử lại" />
	            </c:redirect>
	          </c:otherwise>
	        </c:choose>
	 
	      </c:forEach>
</c:if>

<sql:update dataSource="${snapshot}" var="result1">
        	
            INSERT INTO SuKien(TenSuKien, DiaDiem, NgayBatDau, GioBatDau, NgayKetThuc, GioKetThuc,
            BaoQua, BaoTruoc, SoLanLap, KhoangThoiGianLap, ChuKyLap, MoTa, TenDangNhap) 
              VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
            <sql:param value="${param.tensukien}" />
            <sql:param value="${param.diadiem}" />
            <sql:param value="${param.ngaybatdau}" />
            <sql:param value="${param.giobatdau}" />
            <sql:param value="${param.ngayketthuc}" />
            <sql:param value="${param.gioketthuc}" />
            <sql:param value="${param.BaoQua}" />
            <sql:param value="${param.BaoTruoc}" />
            <sql:param value="${param.SoLanLap}" />
            <sql:param value="${param.KhoangThoiGianLap}" />
            <sql:param value="${param.ChuKyLap}" />
            <sql:param value="${param.comment}" />
            <sql:param value="${sessionScope['loginUser']}" />
        </sql:update>
        
        <c:if test="${result1>=1}">
             <% request.setCharacterEncoding("UTF-8"); %>
 
            <c:redirect url="ThemSuKien.jsp" >
                <c:param name="susMsg" value="Đã thêm 1 sự kiện thành công!" />
            </c:redirect>
        </c:if> 
 <c:if test="${empty param.email}">
 <sql:update dataSource="${snapshot}" var="result1">
        	
            INSERT INTO SuKien(TenSuKien, DiaDiem, NgayBatDau, GioBatDau, NgayKetThuc, GioKetThuc,
            BaoQua, BaoTruoc, SoLanLap, KhoangThoiGianLap, ChuKyLap, MoTa, TenDangNhap) 
              VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
            <sql:param value="${param.tensukien}" />
            <sql:param value="${param.diadiem}" />
            <sql:param value="${param.ngaybatdau}" />
            <sql:param value="${param.giobatdau}" />
            <sql:param value="${param.ngayketthuc}" />
            <sql:param value="${param.gioketthuc}" />
            <sql:param value="${param.BaoQua}" />
            <sql:param value="${param.BaoTruoc}" />
            <sql:param value="${param.SoLanLap}" />
            <sql:param value="${param.KhoangThoiGianLap}" />
            <sql:param value="${param.ChuKyLap}" />
            <sql:param value="${param.comment}" />
            <sql:param value="${sessionScope['loginUser']}" />
        </sql:update>
        <c:if test="${result1>=1}">
             <% request.setCharacterEncoding("UTF-8"); %>
 
            <c:redirect url="ThemSuKien.jsp" >
                <c:param name="susMsg_2" value="Đã thêm 1 sự kiện thành công!" />
                <c:param name="susMsg_Username" value="${param.email}" />
            </c:redirect>
        </c:if> 
 </c:if> --%>
             
</body>
</html>