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
		
		
<c:if test="${not empty param.email}">
	
 <sql:query dataSource ="${snapshot}" var="result0">
select * from SuKien where TenDangNhap = '${sessionScope['loginUser']}' and MaSuKien = '${param.id}';

</sql:query>            
 <sql:query dataSource ="${snapshot}" var="result">
select TenDangNhap from NguoiDung 
where TenDangNhap='${param.email}' or HoTen='${param.email}' or Email='${param.email}'
	        or SoDienThoai='${param.email}';
</sql:query>

<c:if test="${result.rowCount <= 0}">
             <% request.setCharacterEncoding("UTF-8"); %>
            <c:redirect url="ThemSuKien.jsp" >
               <c:param name="errMsg_Khach" value="User bạn mời không tồn tại! Vui lòng thử lại" />
                <c:param name="susMsg_Username" value="${param.id}" />
            </c:redirect>
        </c:if> 


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
 			<c:forEach var = "row0" items = "${result0.rows}">
            <c:redirect url="ThemSuKien.jsp" >
               <c:param name="susMsg_1" value="Đã thêm 1 khách vào sự kiện thành công!" />
                <c:param name="susMsg_Username" value="${row0.MaSuKien}" />
            </c:redirect>
            </c:forEach>
        </c:if> 
</c:if>


        
             
</body>
</html>