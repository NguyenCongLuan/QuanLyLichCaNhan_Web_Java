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
		<%-- <c:out value="${param.id}"/> --%>
		
		<c:out value="${param.id}"/>
		<c:out value="${param.val}"/>
		
		<c:if test="${param.val == true}">
		
			<sql:update dataSource="${snapshot}" var="result1">
        	
        	update NguoiDung set Khoa = false
        	where TenDangNhap = '${param.id}';
        	</sql:update>
		</c:if>
		
		<c:if test="${param.val == false}">
		
			<sql:update dataSource="${snapshot}" var="result2">
        	
        	update NguoiDung set Khoa = true
        	where TenDangNhap = '${param.id}';
        	</sql:update>
		</c:if>
		
	
        
        <c:if test="${result2>=1}">
             <% request.setCharacterEncoding("UTF-8"); %>
 
            <c:redirect url="Admin_QuanLyNguoiDung.jsp" >
                <c:param name="susMsg_1" value="Đã khóa một tài khoản thành công!" />
            </c:redirect>
        </c:if> 
        
        <c:if test="${result1>=1}">
             <% request.setCharacterEncoding("UTF-8"); %>
 
            <c:redirect url="Admin_QuanLyNguoiDung.jsp" >
                <c:param name="susMsg_1" value="Đã kích hoạt lại một tài khoản thành công!" />
            </c:redirect>
        </c:if> 
        
	
<%-- <sql:update dataSource="${snapshot}" var="result2">
        	
        	Delete from MoiKhach_SuKien
        	where TenDangNhap_KhachMoi = '${param.id}';
        	
        	
        	update NguoiDung set Khoa = true
        	where TenDangNhap = '${param.id}';
        	
        </sql:update> --%>
        
        <%-- <sql:update dataSource="${snapshot}" var="result3">
        	
        	Delete from SuKien
        	where TenDangNhap = '${param.id}';
        	
        </sql:update>
        
        <sql:update dataSource="${snapshot}" var="result1">
        	
        	Delete from NguoiDung
        	where TenDangNhap = '${param.id}';
        	
        </sql:update> --%>
        
        
             
</body>
</html>