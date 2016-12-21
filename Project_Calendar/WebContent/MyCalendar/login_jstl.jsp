<?xml version="1.0" encoding="utf-8" ?>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Authentication page</title>
</head>
<body>
	
     
    <c:if test="${not empty param.username and not empty param.pass}">
      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/QuanLyLichCaNhan"
                       user="root" password="trongtri96"/>
 		
 		<c:if test="${param.phanquyen == 'User'}">
 			
 			
 			<sql:query dataSource="${ds}" var="selectQ">
	        select count(*) as kount from NguoiDung
	        where TenDangNhap='${param.username}'
	        and MatKhau='${param.pass}' and Khoa = false
	      </sql:query>
	 
	      <c:forEach items="${selectQ.rows}" var="r">
	        <c:choose>
	          <c:when test="${r.kount gt 0}">
	            <c:set scope="session"
	                   var="loginUser"
	                   value="${param.username}"/>
	            <%-- <c:redirect url="success_jstl.jsp"/> --%>
	            
	            <c:redirect url="success_jstl.jsp" >
	                <c:param name="user" value = "user" />
	            </c:redirect>
	            
	          </c:when>
	          <c:otherwise>
	            <c:redirect url="DangNhap.jsp" >
	              <c:param name="errMsg_log" value="Tên đăng nhập hoặc mật khẩu không hợp lệ! Vui lòng thử lại!" />
	            </c:redirect>
	          </c:otherwise>
	        </c:choose>
	 
	      </c:forEach>
 		</c:if>
 		
 		 <c:if test="${param.phanquyen == 'Admin'}">
 		 	
 		 	
 		 	<sql:query dataSource="${ds}" var="selectQ">
	        select count(*) as kount from Admin
	        where Ad_TenDangNhap='${param.username}'
	        and Ad_MatKhau='${param.pass}'
	      </sql:query>
	 
	      <c:forEach items="${selectQ.rows}" var="r">
	        <c:choose>
	          <c:when test="${r.kount gt 0}">
	            <c:set scope="session"
	                   var="loginUser"
	                   value="${param.username}"/>
	           <%--  <c:redirect url="success_jstl.jsp"/> --%>
	            <c:redirect url="success_jstl.jsp" >
	                <c:param name="admin" value = "admin" />
	            </c:redirect>
	          </c:when>
	          <c:otherwise>
	            <c:redirect url="DangNhap.jsp" >
	              <c:param name="errMsg_log" value="Tên đăng nhập hoặc mật khẩu không hợp lệ! Vui lòng thử lại!" />
	            </c:redirect>
	          </c:otherwise>
	        </c:choose>
	 
	      </c:forEach>
 		 </c:if>
	     
 
    </c:if>
 
</body>
</html>