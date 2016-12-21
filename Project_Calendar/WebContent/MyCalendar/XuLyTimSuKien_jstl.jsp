<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
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
	<title>Kết quả tìm kiếm</title>
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
            body{
                min-height: 1000px;
                padding-top: 50px;
            }
            .error 
            {
            	color: red;
            }
            .radioValue
			
			{
				margin-left: 10px;
			}
			.row
			
			{
				margin-top: 30px;
			}
			
			#btnHuy
			{
				margin-left: 50px;
			}
			
			.glyphicon
			{
            font-size: 10px;
            color: orange;
			}
			
			
			.col-sm-8
			{
			margin-top: 50px;
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
			
			/* #footer
			{
				text-align: center;
				font-weight: body;
				width: 50%;
				margin-left: 350px;
				margin-top: 1000px;
				
			} */
		/* 	.site-footer 
			{
				margin-top: none;
				
			}
 */	/* footer
			{
				
				margin-bottom: 0px;
				margin-top: 1000px;
				
			} */
			
	
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
		
		
        
		function XacNhan()
			{
			
				var kq = confirm("Bạn có chắc muốn thoát?");
				if(kq == true)
				{
					location = "logout_jstl.jsp"
				}
		
			}
		function TroLai()
		{
		
			
				location = "TimSuKien.jsp"
		}
		
			
		function Huy()
		{
			
			location = "TrangChu.jsp"
		}
		function Xoa(t)
		{
			var a = t;
			var kq = confirm("Bạn có chắc muốn xóa sự kiện này?");
			if(kq == true)
			{
				
				
				location = "XuLy_XoaSuKien_jstl.jsp?id="+t;
			
			}
		}
		
	</script>
		
	
</head>
<body>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
	<% request.setCharacterEncoding("UTF-8"); %>
	<div class="container ">
			<div class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="container">
					<div class="navbar-header">
					  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					  </button>
					  <a class="navbar-brand" href="TrangChu.jsp">Trang chủ</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							
							<!-- <form class="navbar-form navbar-left" role="search">
								<div class="form-group">
									 <input type="text" id = "timbanbe" class="form-control" placeholder="Tìm bạn bè">
								</div>
								<button type="submit" onclick = "TimBanBe(); return false;" class="btn btn-default">Search</button>
							</form> -->
							
							<%@include file="Header_jstl_1.jsp" %>
							
							<li><a onclick = "XacNhan(); return false;" href="">Thoát</a></li>
							 <%@include file="header_jstl.jsp" %>
						</ul>
					</div><!--/.nav-collapse -->
				</div>
			</div>

			<div id = "banner">
				
				<a href = "TrangChu.jsp"> <img id = "logo" src = "anh.jpg" title = "logo calendar" height= "100px" width= "300px"/> </a>
				
			</div>
            <div id="header">
                <nav class="navbar navbar-inverse">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
						<a   href="TrangChu.jsp" class="navbar-brand"> <span class="glyphicon glyphicon-home"></span></a>
                    </div>

                    <div class="navbar-collapse collapse" id="menu">
                        <ul class="nav navbar-nav">
							<li>
								
								<a   href = "TrangCaNhan.jsp" > <span class="glyphicon glyphicon-user"></span> Trang cá nhân </a> </li>
							</li>
                            
							<li> <a href = "SuKienCuaToi.jsp"> <span class="glyphicon glyphicon-book"></span>  Sự kiện của tôi </a> </li>
							<li> <a href = "ThemSuKien.jsp"> <span class="glyphicon glyphicon-pencil"></span> Thêm sự kiện</a> </li>
							<li class = "active"> <a href = "TimSuKien.jsp"> <span class="glyphicon glyphicon-search "></span> Tìm sự kiện</a> </li>
			
							<li class = "dropdown">
								<a class = "dropdown-toggle" data-toggle="dropdown" href = "#"> <span class="glyphicon glyphicon-cog "></span>  Cài đặt<span class = "caret"></span></a>
								<ul class = "dropdown-menu">
									<li><a href = "DoiMatKhau.jsp"> Đổi mật khẩu </a></li>
									<li><a href = "DoiEmail.jsp"> Đổi email</a></li>
									<li><a href = "LienHePhanHoi.jsp"> Liên hệ</a></li>
								</ul>
							</li>
			
							
					
					
                        </ul>
                    </div>
                </nav>
            </div>
         
        </div>
        
       
        <% request.setCharacterEncoding("UTF-8"); %>

		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/QuanLyLichCaNhan"
user="root" password="trongtri96"/>
 		
 		<c:if test="${not empty param.Msg_EnventName}">
 		
	            <% request.setCharacterEncoding("UTF-8"); %>
	           
	            

<sql:query dataSource ="${snapshot}" var="result">
select * from SuKien where TenDangNhap = '${sessionScope['loginUser']}' and TenSuKien = '${param.Msg_EnventName}';
</sql:query>

<div class="col-sm-8 col-sm-offset-2">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Kết quả tìm kiếm</h3>
					</div>
					<div class="panel-body">
						<form id="signupForm1" method="post" class="form-horizontal" action="">
							
							<table class="table table-hover">
								<thead>
									<tr>
										
										<th>Mã sự kiện</th>
										<th>Tên sự kiện</th>
										<th>Địa điểm</th>
										<th>Ngày bắt đầu</th>
										<th>Giờ bắt đầu</th>
										<th>Ngày kết thúc</th>
										<th>Giờ kết thúc</th>
										<th>Mô tả</th>
										
									</tr>
								</thead>
								<tbody>
<c:forEach var="row" items="${result.rows}">

<tr id = "dong">
	<td><c:out value="${row.MaSuKien}"/></td>
	<td><c:out value="${row.TenSuKien}"/></td>
	<td><c:out value="${row.DiaDiem}"/></td>
	<td><c:out value="${row.NgayBatDau}"/></td>
	<td><c:out value="${row.GioBatDau}"/></td>
	<td><c:out value="${row.NgayKetThuc}"/></td>
	<td><c:out value="${row.GioKetThuc}"/></td>
	<td><c:out value="${row.MoTa}"/></td>
	<td><a href = "XuLy_SuKien_jstl.jsp?id=<c:out value="${row.MaSuKien}"/>">Sửa</a></td>
	<td><a onclick = "Xoa(${row.MaSuKien}); return false;" href = "#" >Xóa</a></td>
</tr>
</c:forEach> 

								
								</tbody>
							</table>
							
							
							
							
						</form>
						
					</div>
									
		
				</div>
				<div class="form-group">
								
					<button  onclick = "TroLai(); return false;" class="btn btn-primary" name="trolai" value="Trở lại">Thoát</button>
				</div>
				
			   </div> 

	      
 		</c:if>
 		
 		
 		<c:if test="${not empty param.Msg_BeginDate and not empty param.Msg_EndDate}">
 		
 			
	            <% request.setCharacterEncoding("UTF-8"); %>
	            

<sql:query dataSource ="${snapshot}" var="result">
select * from SuKien where TenDangNhap = '${sessionScope['loginUser']}' and 
 NgayBatDau>='${param.Msg_BeginDate}' and NgayBatDau<='${param.Msg_EndDate}' 
 and NgayKetThuc>='${param.Msg_BeginDate}' and NgayKetThuc<='${param.Msg_EndDate}';
</sql:query>

<div class="col-sm-8 col-sm-offset-2">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Kết quả tìm kiếm</h3>
					</div>
					<div class="panel-body">
						<form id="signupForm1" method="post" class="form-horizontal" action="">
							
							<table class="table table-hover">
								<thead>
									<tr>
										<!-- <th>STT</th> -->
										<th>Mã sự kiện</th>
										<th>Tên sự kiện</th>
										<th>Địa điểm</th>
										<th>Ngày bắt đầu</th>
										<th>Giờ bắt đầu</th>
										<th>Ngày kết thúc</th>
										<th>Giờ kết thúc</th>
										<th>Mô tả</th>
										
									</tr>
								</thead>
								<tbody>
<c:forEach var="row" items="${result.rows}">

<tr id = "dong">
	<td><c:out value="${row.MaSuKien}"/></td>
	<td><c:out value="${row.TenSuKien}"/></td>
	<td><c:out value="${row.DiaDiem}"/></td>
	<td><c:out value="${row.NgayBatDau}"/></td>
	<td><c:out value="${row.GioBatDau}"/></td>
	<td><c:out value="${row.NgayKetThuc}"/></td>
	<td><c:out value="${row.GioKetThuc}"/></td>
	<td><c:out value="${row.MoTa}"/></td>
	<td><a href = "XuLy_SuKien_jstl.jsp?id=<c:out value="${row.MaSuKien}"/>">Sửa</a></td>
	<td><a onclick = "Xoa(${row.MaSuKien}); return false;" href = "#" >Xóa</a></td>
</tr>
</c:forEach> 

								
								</tbody>
							</table>
							
							
							
							
						</form>
						
					</div>
									
		
				</div>
				<div class="form-group">
								
					<button onclick = "TroLai(); return false;" class="btn btn-primary" name="trolai" value="Trở lại">Thoát</button>
				</div>
				
			   </div> 

	      
 		</c:if>
 		
 		
 		<footer class = "site-footer">
			<div class = "container">
				<div class = "row">
					<div class = "col-md-5">
						<address> 1, Vo Van Ngan St, Thu Duc, HCM city </address>
					</div>
				</div>
				<div class = "bottom-footer">
					<div class = "col-md-5"> @Copyright 2016 </div>
					<div class = "col-md-7"> 
						<ul class = "footer-nav">
							<li> <a href = "TrangChu.jsp"> Home </a></li>
							<li> <a href = "#"> Về đầu trang </a></li>
							
						</ul>
						
					</div>
					<div class="social">
						<ul class="social_icons text-center">
							<li class="facebook"><a href="https://www.facebook.com/reus.rolls.7" target="_blank">facebook</a></li>
							
							<li class="youtube"><a href="https://www.youtube.com/channel/UC5Lkz51yPAnHvIYGjtIvJ_g" target="_blank">youtube</a></li>
						
						</ul>
					</div>
				</div>
			</div>
		</footer>
        
		
	
	<script type="text/javascript" href="js1/jquery-3.1.1.min.js"> </script>
	<script type="text/javascript" href="js1/bootstrap.min.js"> </script>
</body>
</html>