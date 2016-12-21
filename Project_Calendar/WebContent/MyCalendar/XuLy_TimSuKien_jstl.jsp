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
	<
<% request.setCharacterEncoding("UTF-8"); %>

<c:if test="${not empty param.EventName or (not empty param.BeginDate and not empty param.EndDate)}">
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/QuanLyLichCaNhan"
                       user="root" password="trongtri96"/>
<c:if test="${param.rdb == '1'}">
 			
 			
 			<sql:query dataSource="${ds}" var="selectQ">
	        select count(*) as kount from SuKien
	        where TenSuKien='${param.EventName}'
	        
	      </sql:query>
	 
	      <c:forEach items="${selectQ.rows}" var="r">
	        <c:choose>
	          <c:when test="${r.kount gt 0}">
	            
	            
	            <c:redirect url="XuLyTimSuKien_jstl.jsp" >
	            <% request.setCharacterEncoding("UTF-8"); %>
	               <c:param name="Msg_EnventName" value="${param.EventName}"/>
	               
	            </c:redirect>
	            
	          </c:when>
	          <c:otherwise>
	            <c:redirect url="TimSuKien.jsp" >
	              <c:param name="errMsg_log" value="Rất tiếc, chúng tôi không tìm thấy dữ liệu bạn yêu cầu! Vui lòng thử truy vấn theo cách khác." />
	            </c:redirect>
	          </c:otherwise>
	        </c:choose>
	 
	      </c:forEach>
 		</c:if>
 <c:if test="${param.rdb == '2'}">
 			<c:if test="${param.BeginDate > param.EndDate}">
 				 <c:redirect url="TimSuKien.jsp" >
	              <c:param name="errMsg_log_Date" value="Vui lòng nhập ngày sau không được nhỏ hơn ngày trước!" />
	            </c:redirect>
 			</c:if>
 			
 			<sql:query dataSource="${ds}" var="selectQ">
	        select count(*) as kount from SuKien
	        where NgayBatDau>='${param.BeginDate}' and NgayBatDau<='${param.EndDate}' 
 and NgayKetThuc>='${param.BeginDate}' and NgayKetThuc<='${param.EndDate}'
	        
	      </sql:query>
	 
	      <c:forEach items="${selectQ.rows}" var="r">
	        <c:choose>
	          <c:when test="${r.kount gt 0}">
	            
	            <c:redirect url="XuLyTimSuKien_jstl.jsp" >
	            <% request.setCharacterEncoding("UTF-8"); %>
	               <c:param name="Msg_BeginDate" value="${param.BeginDate}"/>
	               <c:param name="Msg_EndDate" value="${param.EndDate}"/>
	            </c:redirect>
	          </c:when>
	          <c:otherwise>
	            <c:redirect url="TimSuKien.jsp" >
	              <c:param name="errMsg_log" value="Rất tiếc, chúng tôi không tìm thấy dữ liệu bạn yêu cầu! Vui lòng thử truy vấn theo cách khác." />
	            </c:redirect>
	          </c:otherwise>
	        </c:choose>
	 
	      </c:forEach>
 		</c:if>
 		</c:if>
 <%-- <c:if test="${empty param.EventName or (empty param.BeginDate and empty param.EndDate)}">
 	<c:redirect url="TimSuKien.jsp" >
	              <c:param name="errMsg_validate" value="Vui lòng nhập dữ liệu!" />
	            </c:redirect>
 </c:if> --%>
 		
</body>
</html>