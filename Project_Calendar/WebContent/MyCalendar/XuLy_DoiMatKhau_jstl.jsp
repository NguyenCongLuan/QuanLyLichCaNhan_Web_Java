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
		
		<sql:query dataSource ="${snapshot}" var="result_0">
			SELECT * from NguoiDung where TenDangNhap = '${sessionScope['loginUser']}'
			  and MatKhau = ?;
			<sql:param value="${param.password}" />
		</sql:query>
		
		<c:if test="${result_0.rowCount != 1}">
            
            <c:redirect url="DoiMatKhau.jsp" >
                <c:param name="errMsg" value = "Nhập khẩu cũ không chính xác! Vui lòng thử lại!" />
            </c:redirect>
        </c:if> 
		
<sql:update dataSource="${snapshot}" var="result1">
        	
        	Update NguoiDung set MatKhau = ?
        	where TenDangNhap = '${sessionScope['loginUser']}';
        	
            
            <sql:param value="${param.password1}" />
            
            
        </sql:update>
        
        <c:if test="${result1>=1}">
             <% request.setCharacterEncoding("UTF-8"); %>
 
            <c:redirect url="DoiMatKhau.jsp" >
                <c:param name="susMsg" value="Đã đổi mật khẩu thành công!" />
            </c:redirect>
        </c:if> 
             
</body>
</html>