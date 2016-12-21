<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import ="java.sql.*" %>

<%!
	int kiemtra = 0;
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("tendangnhap");    
    String pwd = request.getParameter("password1");
    
    String hoten = request.getParameter("hoten");
    String email = request.getParameter("email1");
    String gioitinh = request.getParameter("gioitinh");
    String ngaysinh = request.getParameter("ngaysinh");
    String congty = request.getParameter("congty");
    String diachi = request.getParameter("diachi");
    String sdt = request.getParameter("sdt");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/QuanLyLichCaNhan",
            "root", "trongtri96");
    Statement st = con.createStatement();
    //ResultSet rs;
    
    //
    
    //kiem tra username da duoc dang ky
    String sql1 = "SELECT TenDangNhap from NguoiDung where TenDangNhap=?"; // Tạo câu truy vấn SQL
			PreparedStatement ps1 = con.prepareStatement(sql1); // Tạo đối tượng làm việc với câu SQL
			ps1.setString(1, username); // Set Email vào dấu ? trên câu SQL
			ResultSet rs1 = ps1.executeQuery(); // Thực hiện câu SQL -> dữ liệu thu được lưu vào rs2
			while (rs1.next()) {
				// Nếu rs2 có dữ liệu -> Email đã tồn tại trong bảng users
				kiemtra = 1;
				
			}
    
			 //kiem tra email da duoc dang ky
	 String sql2 = "SELECT Email from NguoiDung where Email=?"; // Tạo câu truy vấn SQL
					PreparedStatement ps2 = con.prepareStatement(sql2); // Tạo đối tượng làm việc với câu SQL
					ps2.setString(1, email); // Set Email vào dấu ? trên câu SQL
					ResultSet rs2 = ps2.executeQuery(); // Thực hiện câu SQL -> dữ liệu thu được lưu vào rs2
					while (rs2.next()) {
						// Nếu rs2 có dữ liệu -> Email đã tồn tại trong bảng users
						kiemtra = 1;
						
					}
	
	
					 //kiem tra email da duoc dang ky
	 String sql3 = "SELECT SoDienThoai from NguoiDung where SoDienThoai=?"; // Tạo câu truy vấn SQL
	PreparedStatement ps3= con.prepareStatement(sql3); // Tạo đối tượng làm việc với câu SQL
	ps3.setString(1, sdt); // Set Email vào dấu ? trên câu SQL
	ResultSet rs3 = ps3.executeQuery(); // Thực hiện câu SQL -> dữ liệu thu được lưu vào rs2
	while (rs3.next()) {
						// Nếu rs2 có dữ liệu -> Email đã tồn tại trong bảng users
						kiemtra = 1;
										
						}				
    if(kiemtra == 0)
    {
    	
    	int i = st.executeUpdate("insert into NguoiDung(TenDangNhap, MatKhau, HoTen, Email, GioiTinh, NgaySinh, CongTy, DiaChi, SoDienThoai) values ('" + username + "','" + pwd + "','" + hoten + "','" + email + "','" + gioitinh + "', '" + ngaysinh +"', '" + congty +"', '" + diachi +"', '" + sdt +"')");
        if (i > 0) {
            //session.setAttribute("userid", user);
            response.sendRedirect("welcome.jsp");
           // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        } else {
            response.sendRedirect("DangNhap.jsp");
        }
     }
   
    else
    {
    	kiemtra = 0;
    	response.sendRedirect("notify.jsp");
    	
    
    }
    
%>
</body>
</html>