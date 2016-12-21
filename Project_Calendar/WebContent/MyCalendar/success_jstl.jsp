<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 
 
<c:if test="${empty sessionScope['loginUser']}">
    <c:redirect url="DangNhap.jsp" />
</c:if>
 
<c:if test="${not empty param.user}">
	<c:redirect url="TrangChu.jsp" />
</c:if>

<c:if test="${not empty param.admin}">
	<c:redirect url="Admin_QuanLyNguoiDung.jsp" />
</c:if>