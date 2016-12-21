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
		url="jdbc:mysql://localhost:3306/QuanLyLichCaNhan"
		user="root" password="trongtri96"/>
 
 
        <sql:update dataSource="${snapshot}" var="result">
        	
            INSERT INTO DanhNhap(TenDN, MatKhau) VALUES (?,?);
            <sql:param value="${param.tendangnhap}" />
            <sql:param value="${param.password1}" />
            
           
        </sql:update>
        
        
	
</body>
</html>