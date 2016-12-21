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
			SELECT * from NguoiDung where TenDangNhap = ? and Email = ?;
			<sql:param value="${param.username}" />
			<sql:param value="${param.email}" />
		</sql:query>
		
		<c:if test="${result_0.rowCount <= 0}">
            
            
            <c:redirect url="DangNhap.jsp" >
                <c:param name="errMsg" value = "Tên đăng nhập hoặc email không chính xác! Vui lòng thử lại" />
            </c:redirect>
        </c:if> 
		
        <sql:update dataSource ="${snapshot}" var="count">
            UPDATE NguoiDung SET MatKhau = ?
            WHERE TenDangNhap='${param.username}'
            <sql:param value="${param.password}" />
            
        </sql:update>
        <c:if test="${count>=1}">
            <c:redirect url="DangNhap.jsp" >
                <c:param name="susMsg" value = "Cập nhật mật khẩu thành công!" />
            </c:redirect>
        </c:if>
        
        
        
        
		
		
        
        
	
</body>
</html>