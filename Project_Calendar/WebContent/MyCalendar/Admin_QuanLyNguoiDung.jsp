<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
   <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import ="java.sql.*" %>
      
      
  <!doctype html PUBLIC "//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Quản lý người dùng</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css1/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css1/bootstrap-theme.min.css">
	<script type="text/javascript" src="lib/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="dist/jquery.validate.js"></script>
	<link rel="stylesheet" type="text/css" href="footer.css">

	 <style type="text/css">
            
			
			.row
			{
				padding-top: 70px;
			}
            .example{
                margin: 5px;
            }
			.row
			
			{
				margin-top: 30px;
			}
		
			
			.glyphicon
			{
            font-size: 10px;
            color: orange;
			}
			
			
			.col-md-6
			{
				background-color: #FFEFD5;
				border: 1px solid gray;
				margin-top: 30px;
			}
			.col-md-6  img
			{
				width: 150px;
				heigth: 150px;
				
			}
			.col-md-6  h2
			{
				text-align: center;
				
			}
			
			#footer
			{
				text-align: center;
				font-weight: body;
				width: 50%;
				margin-left: 350px;
				margin-top: 50px;
				
			}
			
			
			#header li {
		  
		  display: inline-block;
		  
		  
		}
			
			.dropdown-menu {
		  display: none;
		  position: absolute;
		  
		}
		#header li {
		  position: relative;
		}
		#header li:hover .dropdown-menu {
		  display: block;
		}
		
		.dropdown-menu li {
		  margin-left: 0 !important;
		  
		}
		
		.dropdown-menu > ul {
		  display: none !mportant;
		}	
		
			.glyphicon glyphicon-user
			{
				font-size: 50px;
			}
		
    </style>
		
			<script type="text/javascript">
		
			
	
	function Khoa()
			{
			
				var kq = confirm("Bạn có chắc muốn khóa người dùng này?");
				if(kq == true)
				{
					alert("Đã khóa thành công!");
					
				}
			}	
	/* function XacNhanThoat()
	{
	
		var kq = confirm("Bạn có chắc muốn thoát?");
		if(kq == true)
		{
			location = "logout.jsp"
		}
		
		
		
	} */
	
function XacNhanThoat_1()
{

	var kq = confirm("Bạn có chắc muốn thoát?");
	if(kq == true)
	{
		location = "logout_jstl.jsp"
	}
	
	
	
}

		
</script>
</head>
<body>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
	
	<div class="container ">
			

			
            <div id="header">
                <nav class="navbar navbar-inverse ">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
						
                    </div>

                    <div class="navbar-collapse collapse" id="menu">
                        <ul class="nav navbar-nav">
							<li class = "active">
								
								<a  href = "Admin_QuanLyNguoiDung.jsp" > <span class="glyphicon glyphicon-user"></span> Quản lý tài khoản </a> </li>
							</li>
                            
							<!-- <li > <a href = "Admin_QuanLyTinNhan.jsp"> <span class="glyphicon glyphicon-book"></span>  Quản lý tin nhắn </a> </li>
				"WebContent/MyCalendar/Admin_QuanLyNguoiDung.jsp"			<li> <a href = "Admin_DoiMatKhau.jsp"> <span class="glyphicon glyphicon-cog "></span> Đổi mật khẩu</a> </li> -->
							
							<!-- <form class="navbar-form navbar-left" role="search">
								<div class="form-group">
									 <input type="text" id = "timtaikhoan" class="form-control" placeholder="Tìm tài khoản">
								</div>
								<button type="submit" onclick = "Tim(); return false;" class="btn btn-default">Search</button>
							</form> -->
							<%@include file="Header_Admin_jstl.jsp" %>
							<!-- <li><a onclick = "XacNhanThoat(); return false;" href="#">Thoát</a></li> -->
							<li><a onclick = "XacNhanThoat_1(); return false;" href="#">Thoát</a></li>
			
							<%@include file="header_jstl.jsp" %>
					
					
                        </ul>
                    </div>
                </nav>
            </div>
            
            <%-- <%
			    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
				%>
				<% response.sendRedirect("DangNhap.jsp"); %> 
				<%} else {
				%>
				<li>Welcome <%=session.getAttribute("userid")%></li>
				<%
				    }
				%> --%>
				
			 <%--  <c:if test="${empty sessionScope['loginUser']}">
    			<c:redirect url="DangNhap.jsp" />
			</c:if>
            
			Welcome <a href = ""> <c:out value="${sessionScope['loginUser']}" /></a> --%>
			
			<font color="green"><c:if test="${not empty param.susMsg_1}">
					            <c:out value="${param.susMsg_1}" />
					            
					        </c:if></font>
			 <% request.setCharacterEncoding("UTF-8"); %>
			<%-- <%@include file="header_jstl.jsp" %> --%>
            
            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/QuanLyLichCaNhan"
user="root" password="trongtri96"/>
<sql:query dataSource ="${snapshot}" var="result">
select TenDangNhap, HoTen, Email, SoDienThoai, Khoa from NguoiDung;
</sql:query>
            
			<div class="row">
			  <div class="col-sm-8 col-sm-offset-2">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Danh sách người dùng</h3>
					</div>
					<div class="panel-body">
						<form id="signupForm1" method="post" class="form-horizontal" action="">
							
							<table class="table table-hover">
							<thead>
								<tr>
									
									<th>Tên đăng nhập</th>
									
									<th>Họ tên</th>
									<th>Email</th>
									<th>Số điện thoại</th>
									<th>Tình trạng</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${result.rows}">

<tr id = "dong">
	
	<td><c:out value="${row.TenDangNhap}"/></td>
	<td><c:out value="${row.HoTen}"/></td>
	<td><c:out value="${row.Email}"/></td>
	<td><c:out value="${row.SoDienThoai}"/></td>
	
	<c:if test="${row.Khoa == false}">
	 	<td>Hoạt động</td>
	 	
	 	<td><a onclick="comfirm_decision('${row.TenDangNhap}', '${row.Khoa}'); return false;" href = "" >Khóa</a></td>
	 </c:if>
	 <c:if test="${row.Khoa == true}">
	 
	 	<td>Đã khóa</td>
	 	<td><a onclick="comfirm_decision('${row.TenDangNhap}', '${row.Khoa}'); return false;" href = "" >Khôi phục</a></td>
	 </c:if>
	 
	 <%-- <td><a href = "XuLy_SuKien_jstl.jsp?id=<c:out value="${row.TenDangNhap}"/>">Mở</a></td> --%>
	
	
	<%-- <td><a onclick = "Xoa(${row.TenDangNhap}); return false;" href = "" >Xóa</a></td> --%>
	
<script type = "text/javascript">
/* function Xoa(t)
{
	var a = t;
	var kq = confirm("Bạn có chắc muốn xóa sự kiện này?");
	if(kq == true)
	{
		
		
		location = "XuLy_KhoaTaiKhoan_jstl.jsp?id="+t;
	
	}
} */

function comfirm_decision(t, k)
{
	var check = k;
	 if(check == 'false')
		 {
		 
	 var kq = confirm("Bạn có chắc muốn khóa tài khoản này?");
		if(kq == true)
		{
			
			
			
		      location="XuLy_KhoaTaiKhoan_jstl.jsp?id="+t +"&val="+k;
		     /*  location="XuLy_KhoaTaiKhoan_jstl.jsp?id="+t; */
		     
		      /* '?Page='+data+'&'+PostData; */
		
		}
		}
	 else
		 {
		 var kq1 = confirm("Bạn có chắc muốn khôi phục lại tài khoản này?");
			if(kq1 == true)
			{
				
				
				
			      location="XuLy_KhoaTaiKhoan_jstl.jsp?id="+t +"&val="+k;
			     /*  location="XuLy_KhoaTaiKhoan_jstl.jsp?id="+t; */
			     
			      /* '?Page='+data+'&'+PostData; */
			
			}
		 }
	 
	/* if(confirm("you want to delete the user?")) // this will pop up confirmation box and if yes is clicked it call servlet else return to page
    {
		
    }
	else{
    	
      return false;
   } */
  /* return true; */
}

</script>
</tr>
</c:forEach> 
                        
							</tbody>
							
						</table>
						</form>
						
					</div>
									
		
				</div>
				<div class="form-group">
								
					
				</div>
				
			   </div>
			</div>
			
			
        </div>
		
	<script type="text/javascript" href="js1/jquery-3.1.1.min.js"> </script>
	<script type="text/javascript" href="js1/bootstrap.min.js"> </script>
</body>
</html>