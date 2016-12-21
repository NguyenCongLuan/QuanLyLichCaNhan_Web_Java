<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
      <%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
tttttttt
<% request.setCharacterEncoding("UTF-8"); %>
<font color="green"><c:if test="${not empty param.susMsg}">
					            <c:out value="${param.susMsg}" />
					            
					        </c:if></font>
<font color="red"><c:if test="${not empty param.errMsg}">
					            <c:out value="${param.errMsg}" />
					            
					        </c:if></font>
</body>
</html>