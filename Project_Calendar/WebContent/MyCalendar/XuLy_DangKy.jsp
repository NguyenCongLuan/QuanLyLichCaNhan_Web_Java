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
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/QuanLyLichCaNhan?useUnicode=yes&characterEncoding=UTF-8"
		user="root" password="trongtri96"/>
        
        <sql:query dataSource ="${snapshot}" var="result_0">
			SELECT * from NguoiDung where TenDangNhap = ?;
			<sql:param value="${param.tendangnhap}" />
		</sql:query>
		
		<c:if test="${result_0.rowCount > 0}">
            
            <c:redirect url="DangNhap.jsp" >
                <c:param name="errMsg" value = "Đăng ký thất bại! Tên đăng nhập này đã được sử dụng" />
            </c:redirect>
        </c:if> 
        
        <sql:query dataSource ="${snapshot}" var="result_1">
			SELECT * from NguoiDung where Email = ?;
			<sql:param value="${param.email1}" />
		</sql:query>
		
		<c:if test="${result_1.rowCount > 0}">
            
            <c:redirect url="DangNhap.jsp" >
                <c:param name="errMsg" value = "Đăng ký thất bại! Email này đã được sử dụng" />
            </c:redirect>
        </c:if> 
        
        <sql:query dataSource ="${snapshot}" var="result_2">
			SELECT * from NguoiDung where SoDienThoai = ?;
			<sql:param value="${param.sdt}" />
		</sql:query>
		
		<c:if test="${result_2.rowCount > 0}">
            
            <c:redirect url="DangNhap.jsp" >
                <c:param name="errMsg" value = "Đăng ký thất bại! Số điện thoại này đã được sử dụng" />
            </c:redirect>
        </c:if> 
		
		
        
        <sql:update dataSource="${snapshot}" var="result1">
        	
            INSERT INTO NguoiDung(TenDangNhap, MatKhau, 
             HoTen, Email, GioiTinh, NgaySinh, CongTy, DiaChi, SoDienThoai) VALUES (?, ?, 
            ?, ?, ?, ?, ?, ?, ?);
            <sql:param value="${param.tendangnhap}" />
            <sql:param value="${param.password1}" />
            <sql:param value="${param.hoten}" />
            <sql:param value="${param.email1}" />
            <sql:param value="${param.gioitinh}" />
            <sql:param value="${param.ngaysinh}" />
            <sql:param value="${param.congty}" />
            <sql:param value="${param.diachi}" />
            <sql:param value="${param.sdt}" />
           
        </sql:update>
        
        <c:if test="${result1>=1}">
            
 
            <c:redirect url="DangNhap.jsp" >
                <c:param name="susMsg" value="Đăng ký thành công. Xin mời đăng nhập!" />
            </c:redirect>
        </c:if> 
        
	
</body>
</html>