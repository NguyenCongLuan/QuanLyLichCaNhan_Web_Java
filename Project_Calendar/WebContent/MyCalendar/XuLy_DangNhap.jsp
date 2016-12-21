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
			SELECT * from NguoiDung where TenDangNhap = ? and MatKhau = ?;
			<sql:param value="${param.username}" />
			<sql:param value="${param.pass}" />
		</sql:query>
		
		<sql:query dataSource ="${snapshot}" var="result_1">
			SELECT * from Admin where Ad_TenDangNhap = ? and Ad_MatKhau = ?;
			<sql:param value="${param.username}" />
			<sql:param value="${param.pass}" />
		</sql:query>
		
		<c:if test="${param.phanquyen == 'User'}">
            
            <c:if test="${result_0.rowCount <= 0}">
	            <c:redirect url="DangNhap.jsp" >
	                <c:param name="errMsg_1" value = "Tên đăng nhập hoặc mật khẩu không hợp lệ" />
	            </c:redirect>
            </c:if>
            
            <c:if test="${result_0.rowCount > 0}">
	            <c:redirect url="TrangChu.jsp" >
	                
	            </c:redirect>
            </c:if>
        </c:if> 
        
        <c:if test="${param.phanquyen == 'Admin'}">
            
            <c:if test="${result_1.rowCount <= 0}">
	            <c:redirect url="DangNhap.jsp" >
	                <c:param name="errMsg_1" value = "Tên đăng nhập hoặc mật khẩu không hợp lệ" />
	            </c:redirect>
            </c:if>
            
            <c:if test="${result_1.rowCount > 0}">
	            <c:redirect url="Admin_QuanLyNguoiDung.jsp" >
	                
	            </c:redirect>
            </c:if>
        </c:if> 
		
</body>
</html>