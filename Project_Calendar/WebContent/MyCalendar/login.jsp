<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
  <%@ page import="java.io.*,java.util.*,java.sql.*"%>
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
	<%
	request.setCharacterEncoding("UTF-8");
	int kt = 0;
    String userid = request.getParameter("username");    
    String pwd = request.getParameter("pass");
    String quyen = request.getParameter("phanquyen");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/QuanLyLichCaNhan",
            "root", "trongtri96");
    Statement st = con.createStatement();
    ResultSet rs;
    ResultSet rs1;
    if ("User".equals(quyen)) 
    
    {	
    	kt = 0;
    	rs = st.executeQuery("select * from NguoiDung where TenDangNhap='" + userid + "' and MatKhau='" + pwd + "'");
    }
    else
    {
    	kt = 1;
    	rs = st.executeQuery("select * from Admin where Ad_TenDangNhap='" + userid + "' and Ad_MatKhau='" + pwd + "'");
    }
    /* rs = st.executeQuery("select * from NguoiDung where TenDangNhap='" + userid + "' and MatKhau='" + pwd + "'"); */
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        if(kt == 1)
        {
        	response.sendRedirect("Admin_QuanLyNguoiDung.jsp");
        }
        else
        {
        	response.sendRedirect("TrangChu.jsp");
        }
        
    } 
    else {
        out.println("Invalid user or password <a href='DangNhap.jsp'>try again</a>");
    }
%>
</body>
</html>