<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
  <!doctype html PUBLIC "//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Thêm sự kiện</title>
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
            .example{
                margin: 5px;
            }
           /*  #addevent1
            {
            	margin-top: 10px;
            } */
           /*  .t
            {
            	margin-top: 10px;
            } */
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
				margin-top: 50px;
				
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
		function Huy()
		{
			
			location = "TrangChu.jsp"
		}
		
		
		
		/* $.validator.setDefaults( {
			submitHandler: function () {
				$('.alert-success').html('Thêm sự kiện thành công! <a href="TrangChu.jsp" >Về trang chủ</a>').removeClass('hide');
				
			}
			
		} ); */

		$( document ).ready( function () {
			
			$( "#addevent" ).validate( {
				rules: {
					
					tensukien: {
						required: true
						
					},
					diadiem: {
						required: true
						
					},
					ngaybatdau: {
						required: true
					},
					giobatdau: {
						required: true
					},
					ngayketthuc: {
						required: true
					},
					gioketthuc: {
						required: true
					},
					
					
					comment: "required"
					
				},
				messages: {
					
					tensukien: {
						required: "Please enter a event name"
						
					},
					diadiem: {
						required: "Please enter a site"
						
					},
					ngaybatdau: {
						required: "Please enter a start day"
						
					},
					giobatdau: {
						required: "Please enter a start time"
						
					},
					ngayketthuc: {
						required: "Please enter a end day"
						
					},
					gioketthuc: {
						required: "Please enter a end time"
						
					},
					
					
					comment: "Please enter a description",
					/* email: "Please enter a valid email address" */
				},
				errorElement: "em",
				errorPlacement: function ( error, element ) {
					// Add the `help-block` class to the error element
					error.addClass( "help-block" );

					// Add `has-feedback` class to the parent div.form-group
					// in order to add icons to inputs
					element.parents( ".col-sm-5" ).addClass( "has-feedback" );

					if ( element.prop( "type" ) === "checkbox" ) {
						error.insertAfter( element.parent( "label" ) );
					} else {
						error.insertAfter( element );
					}

					// Add the span element, if doesn't exists, and apply the icon classes to it.
					if ( !element.next( "span" )[ 0 ] ) {
						$( "<span class='glyphicon glyphicon-remove form-control-feedback'></span>" ).insertAfter( element );
					}
				},
				success: function ( label, element ) {
					// Add the span element, if doesn't exists, and apply the icon classes to it.
					if ( !$( element ).next( "span" )[ 0 ] ) {
						$( "<span class='glyphicon glyphicon-ok form-control-feedback'></span>" ).insertAfter( $( element ) );
					}
				},
				highlight: function ( element, errorClass, validClass ) {
					$( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
					$( element ).next( "span" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
				},
				unhighlight: function ( element, errorClass, validClass ) {
					$( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
					$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
				}
			} );
		} );
	
		
	</script>
	
	
</head>
<body>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
	
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
							
							<li><a onclick = "XacNhan(); return false;" href="#">Thoát</a></li>
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
							<li class = "active"> <a href = "ThemSuKien.jsp"> <span class="glyphicon glyphicon-pencil"></span> Thêm sự kiện</a> </li>
							<li> <a href = "TimSuKien.jsp"> <span class="glyphicon glyphicon-search "></span> Tìm sự kiện</a>
			
							<li class = "dropdown">
								<a class = "dropdown-toggle" data-toggle="dropdown" href = "#"> <span class="glyphicon glyphicon-cog "></span>  Cài đặt<span class = "caret"></span></a>
								<ul class = "dropdown-menu">
									<li><a href = "DoiMatKhau.jsp"> Đổi mật khẩu </a></li>
									<li><a href = "DoiEmail.jsp"> Đổi email</a></li>
									
								</ul>
							</li>
			
							
					
					
                        </ul>
                    </div>
                </nav>
            </div>
           
              <% request.setCharacterEncoding("UTF-8"); %>
             
             
             
					        
					        
			<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/QuanLyLichCaNhan"
user="root" password="trongtri96"/>

<c:if test="${not empty param.errMsg_Khach}">
					          <c:out value="${param.errMsg_Khach}" />
					        	</c:if>

<c:if test="${not empty param.susMsg or not empty param.susMsg_Username}">
 <% request.setCharacterEncoding("UTF-8"); %>
 <c:out value="${param.susMsg}" />

<sql:query dataSource ="${snapshot}" var="result">
select *, DATE_FORMAT(NgayBatDau,'%m/%d/%Y') AS NgayBatDau, DATE_FORMAT(NgayKetThuc,'%m/%d/%Y') AS NgayKetThuc
 from SuKien where TenDangNhap = '${sessionScope['loginUser']}' order by MaSuKien desc limit 1 ;

</sql:query> 

<sql:query dataSource ="${snapshot}" var="result1">
select m.TenDangNhap_KhachMoi, n.Email from SuKien s, MoiKhach_SuKien m, NguoiDung n 
where s.MaSuKien = m.MaSuKien and s.MaSuKien = '${param.susMsg_Username}' and m.TenDangNhap_KhachMoi = n.TenDangNhap;
</sql:query>           
				
	       
<c:forEach var = "row" items = "${result.rows}">
	
			
			<div class="row">
			  <div class="col-sm-8 col-sm-offset-2">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Thêm sự kiện</h3>
					</div>
					<div class="panel-body">
						<form id="addevent" action = "XuLy_ThemSuKien_jstl.jsp" method="post" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="tendangnhap">Tên sự kiện </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="tensukien" value="${row.TenSuKien}" name="tensukien" placeholder="Tên sự kiện" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="password1">Địa điểm</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="diadiem" value="${row.DiaDiem}" name="diadiem" placeholder="Địa điểm" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Ngày bắt đầu</label>
								<div class="col-sm-5">
									<input type="date" class="form-control" id="ngaybatdau" value="${row.NgayBatDau}" name="ngaybatdau" placeholder="Ngày bắt đầu" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Giờ bắt đầu</label>
								<div class="col-sm-5">
									<input type="time" class="form-control" id="giobatdau" value="${row.GioBatDau}" name="giobatdau" placeholder="Giờ bắt đầu" />
								</div>
							</div>
							
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Ngày kết thúc</label>
								<div class="col-sm-5">
									<input type="date" class="form-control" id="ngayketthuc" value="${row.NgayKetThuc}" name="ngayketthuc" placeholder="Ngày kết thúc" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Giờ kết thúc</label>
								<div class="col-sm-5">
									<input type="time" class="form-control" id="gioketthuc" value="${row.GioKetThuc}" name="gioketthuc" placeholder="Giờ kết thúc" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="confirm_password1">Báo qua</label>
								<div class="col-sm-5">
									<select selected = <c:out value="${row.BaoQua}" /> class="form-control" value="${row.BaoQua}" id="sel1" name = "BaoQua">
										<option value = "Email" <c:if test="${row.BaoQua == 'Email'}">selected</c:if>  >Email</option>
										<option value = "SĐT" <c:if test="${row.BaoQua == 'SĐT'}">selected</c:if> >SĐT</option>
										<option value = "Cả hai" <c:if test="${row.BaoQua == 'Cả hai'}">selected</c:if>>Cả hai</option>
									
									
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="hoten">Báo trước</label>
								<div class="col-sm-5">
									<select selected = "${row.BaoTruoc}" class="form-control" value="${row.BaoTruoc}" id="sel1" name = "BaoTruoc">
										<option value = "Không" <c:if test="${row.BaoTruoc == 'Không'}">selected</c:if> >Không</option>
										<option value = "5 phút" <c:if test="${row.BaoTruoc == '5 phút'}">selected</c:if> >5 phút</option>
										<option value = "10 phút" <c:if test="${row.BaoTruoc == '10 phút'}">selected</c:if>>10 phút</option>
										<option value = "30 phút" <c:if test="${row.BaoTruoc == '30 phút'}">selected</c:if>>30 phút</option>
										<option value = "5 phút" <c:if test="${row.BaoTruoc == '5 phút'}">selected</c:if>>1 giờ</option>
									
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="email1">Số lần lập</label>
								<div class="col-sm-5">
									<select selected = "${row.SoLanLap}" class="form-control" value="${row.SoLanLap}" id="sel1" name = "SoLanLap">
										<option value = "Không lặp" <c:if test="${row.SoLanLap == 'Không lặp'}">selected</c:if>>Không lặp</option>
										<option value = "1" <c:if test="${row.SoLanLap == '1'}">selected</c:if>>1</option>
										<option value = "2" <c:if test="${row.SoLanLap == '2'}">selected</c:if>>2</option>
										<option value = "3" <c:if test="${row.SoLanLap == '3'}">selected</c:if>>3</option>
										<option value = "4" <c:if test="${row.SoLanLap == '4'}">selected</c:if>>4</option>
									
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="email1">Khoảng thời gian lặp</label>
								<div class="col-sm-5">
									<select selected = "${row.KhoangThoiGianLap}" class="form-control" id="sel1" value="${row.KhoangThoiGianLap}" name = "KhoangThoiGianLap">
										<option value = "Không" <c:if test="${row.KhoangThoiGianLap == 'Không'}">selected</c:if>>Không</option>
										<option value = "1 giờ" <c:if test="${row.KhoangThoiGianLap == '1 giờ'}">selected</c:if>>1 giờ</option>
										<option value = "2 giờ" <c:if test="${row.KhoangThoiGianLap == '2 giờ'}">selected</c:if>>2 giờ</option>
										<option value = "3 giờ" <c:if test="${row.KhoangThoiGianLap == '3 giờ'}">selected</c:if>>3 giờ</option>
										<option value = "4 giờ" <c:if test="${row.KhoangThoiGianLap == '4 giờ'}">selected</c:if>>4 giờ</option>
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="email1">Chu kỳ lặp</label>
								<div class="col-sm-5">
									<select selected = "${row.ChuKyLap}" class="form-control" id="sel1" name = "ChuKyLap">
										<option value = "Không lặp" <c:if test="${row.ChuKyLap == 'Không lặp'}">selected</c:if>>Không lặp</option>
										<option value = "1 ngày" <c:if test="${row.ChuKyLap == '1 ngày'}">selected</c:if>>1 ngày</option>
										<option value = "1 tuần" <c:if test="${row.ChuKyLap == '1 tuần'}">selected</c:if>>1 tuần</option>
										<option value = "1 tháng" <c:if test="${row.ChuKyLap == '1 tháng'}">selected</c:if>>1 tháng</option>
										
								  </select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Mô tả</label>
								<div class="col-sm-5">
									<textarea class="form-control" rows="5"  name = "comment" id="comment"> <c:out value="${row.MoTa}"/> </textarea>
								</div>
							</div>

							<!-- <div class="form-group">
								<label class="col-sm-4 control-label" for="congty">Email</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name = "email" id="email" placeholder="Nhập email khách">
								</div>
							</div> -->
							
								
							
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									<button type="submit"  class="btn btn-primary" name="signup1" value="Thêm">Thêm</button>
									<button id = "btnHuy" type="submit" onclick = "Huy(); return false;" class="btn btn-danger" name="huy" value="Hủy">Hủy</button>
								</div>
							</div>
						</form>
							
						<form id="addevent1" action = "XuLy_ThemSuKien_jstl_1.jsp" method="post" class="form-horizontal" action="">
							<div class="form-group">
								
								<label class="col-sm-4 control-label" for="tendangnhap">Thêm khách </label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name = "email" id="email" placeholder="Họ tên, Username, Email">
									<div></div>
									<input type="hidden" value="${row.MaSuKien}" class="form-control" name = "id" id="id" placeholder="test">
									
								</div>
								<div class="col-sm-1">
									<button  type="submit"  class="btn btn-primary" name="signup1" value="Thêm">Add</button>
								</div>
								
							</div>
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									
						<label>Đã thêm khách</label>
						<c:forEach var="row1" items="${result1.rows}">		
							<div><c:out value="${row1.Email}" /></div>
			   			</c:forEach>
			   
							</div>
							</div>
							
							
							
						</form>
						
						
						<%-- <form class = "t" id="addevent1" action = "XuLy_ThemSuKien_jstl_1.jsp" method="post" class="form-horizontal" action="">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="congty">Thêm khách</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name = "email" id="email" placeholder="Họ tên, Username, Email">
									<button type="submit"  class="btn btn-primary" name="signup1" value="Thêm">Add</button>
									<c:if test="${not empty param.susMsg_Username}">
									<label>Đã thêm khách ${param.susMsg_Username}</label>
									</c:if>
								</div>
								
							</div>
							
						</form> --%>
						</div>
					</div>
				</div>
				
				
			   </div>
			</div>
			
		</c:forEach>	
		</c:if>
		
		<%-- <c:if test="${empty param.susMsg}"> --%>
			
			<%-- <c:if test="${not empty param.Msg_MoiKhach}">
			<% request.setCharacterEncoding("UTF-8"); %>
 <c:out value="${param.Msg_MoiKhach}" />
					            	
					<sql:query dataSource ="${snapshot}" var="result">
select TenDangNhap from NguoiDung  
 where TenDangNhap='${param.Msg_MoiKhach}' or HoTen='${param.Msg_MoiKhach}' or Email='${param.Msg_MoiKhach}'
	        or SoDienThoai='${param.Msg_MoiKhach}';

</sql:query>            
				
	       
<c:forEach var = "row" items = "${result.rows}">
			<div class="row">
			  <div class="col-sm-8 col-sm-offset-2">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Thêm sự kiện</h3>
					</div>
					<div class="panel-body">
						<form id="addevent" action = "XuLy_ThemSuKien_jstl.jsp" method="post" class="form-horizontal" action="">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="tendangnhap">Tên sự kiện </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="tensukien"  name="tensukien" placeholder="Tên sự kiện" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="password1">Địa điểm</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="diadiem"  name="diadiem" placeholder="Địa điểm" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Ngày bắt đầu</label>
								<div class="col-sm-5">
									<input type="date" class="form-control" id="ngaybatdau"  name="ngaybatdau" placeholder="Ngày bắt đầu" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Giờ bắt đầu</label>
								<div class="col-sm-5">
									<input type="time" class="form-control" id="giobatdau"  name="giobatdau" placeholder="Giờ bắt đầu" />
								</div>
							</div>
							
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Ngày kết thúc</label>
								<div class="col-sm-5">
									<input type="date" class="form-control" id="ngayketthuc"  name="ngayketthuc" placeholder="Ngày kết thúc" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Giờ kết thúc</label>
								<div class="col-sm-5">
									<input type="time" class="form-control" id="gioketthuc"  name="gioketthuc" placeholder="Giờ kết thúc" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="confirm_password1">Báo qua</label>
								<div class="col-sm-5">
									<select class="form-control"  id="sel1" name = "BaoQua">
										<option >Email</option>
										<option >SĐT</option>
										<option >Cả hai</option>
									
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="hoten">Báo trước</label>
								<div class="col-sm-5">
									<select class="form-control"  id="sel1" name = "BaoTruoc">
										<option>5 phút</option>
										<option>10 phú</option>
										<option>30 phút</option>
										<option>1 giờ</option>
									
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="email1">Số lần lập</label>
								<div class="col-sm-5">
									<select class="form-control"  id="sel1" name = "SoLanLap">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
									
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="email1">Khoảng thời gian lặp</label>
								<div class="col-sm-5">
									<select class="form-control" id="sel1"  name = "KhoangThoiGianLap">
										<option>1 giờ</option>
										<option>2 giờ</option>
										<option>3 giờ</option>
										<option>4 giờ</option>
										
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="email1">Chu kỳ lặp</label>
								<div class="col-sm-5">
									<select class="form-control" id="sel1"  name = "ChuKyLap">
										<option>Cả ngày</option>
										<option>1 ngày</option>
										<option>1 tuần</option>
										<option>1 tháng</option>
								  </select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Mô tả</label>
								<div class="col-sm-5">
									<textarea class="form-control" rows="5"  name = "comment" id="comment"></textarea>
								</div>
							</div>
							
						
							<div class="alert alert-success hide" role = "alert">
								
							</div>
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									<button type="submit"  class="btn btn-primary" name="signup1" value="Thêm">Thêm</button>
									<button id = "btnHuy" type="submit" onclick = "Huy(); return false;" class="btn btn-danger" name="huy" value="Hủy">Hủy</button>
								</div>
							</div>

							
							
							
						</form>
						<form id="addevent" action = "XuLy_MoiKhach_jstl.jsp" method="post" class="form-horizontal" action="">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="congty">Email</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name = "email" id="email" placeholder="Nhập email khách">
									<button type="submit"  class="btn btn-primary" name="signup1" value="Thêm">Add</button>
									<label>Đã thêm khách ${param.Msg_MoiKhach}</label>
								</div>
								
							</div>
							
						</form>
					</div>
				</div>
				
				
			   </div>
			</div>
		</c:forEach>
		</c:if> --%>
		
		<font color="red">
								
					        </font>
		<c:if test="${empty param.susMsg and empty param.susMsg_Username}">
		
		<div class="row">
			  <div class="col-sm-8 col-sm-offset-2">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Thêm sự kiện</h3>
					</div>
					<div class="panel-body">
					
						<form id="addevent" action = "XuLy_ThemSuKien_jstl.jsp" method="post" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="tendangnhap">Tên sự kiện </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="tensukien"  name="tensukien" placeholder="Tên sự kiện" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="password1">Địa điểm</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="diadiem"  name="diadiem" placeholder="Địa điểm" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Ngày bắt đầu</label>
								<div class="col-sm-5">
									<input type="date" class="form-control" id="ngaybatdau"  name="ngaybatdau" placeholder="Ngày bắt đầu" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Giờ bắt đầu</label>
								<div class="col-sm-5">
									<input type="time" class="form-control" id="giobatdau"  name="giobatdau" placeholder="Giờ bắt đầu" />
								</div>
							</div>
							
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Ngày kết thúc</label>
								<div class="col-sm-5">
									<input type="date" class="form-control" id="ngayketthuc"  name="ngayketthuc" placeholder="Ngày kết thúc" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Giờ kết thúc</label>
								<div class="col-sm-5">
									<input type="time" class="form-control" id="gioketthuc"  name="gioketthuc" placeholder="Giờ kết thúc" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="confirm_password1">Báo qua</label>
								<div class="col-sm-5">
									<select class="form-control"  id="sel1" name = "BaoQua">
										<option >Email</option>
										<option >SĐT</option>
										<option >Cả hai</option>
									
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="hoten">Báo trước</label>
								<div class="col-sm-5">
									<select class="form-control"  id="sel1" name = "BaoTruoc">
										<option>Không</option>
										<option>5 phút</option>
										<option>10 phút</option>
										<option>30 phút</option>
										<option>1 giờ</option>
									
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="email1">Số lần lập</label>
								<div class="col-sm-5">
									<select class="form-control"  id="sel1" name = "SoLanLap">
										<option>Không lặp</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
									
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="email1">Khoảng thời gian lặp</label>
								<div class="col-sm-5">
									<select class="form-control" id="sel1"  name = "KhoangThoiGianLap">
									`	<option>Không</option>
										<option>1 giờ</option>
										<option>2 giờ</option>
										<option>3 giờ</option>
										<option>4 giờ</option>
										
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="email1">Chu kỳ lặp</label>
								<div class="col-sm-5">
									<select class="form-control" id="sel1"  name = "ChuKyLap">
										<option>Không lặp</option>
										
										<option>1 ngày</option>
										<option>1 tuần</option>
										<option>1 tháng</option>
								  </select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Mô tả</label>
								<div class="col-sm-5">
									<textarea class="form-control" rows="5"  name = "comment" id="comment"></textarea>
								</div>
							</div>
							
							<!-- <div class="form-group">
								<label class="col-sm-4 control-label" for="congty">Thêm khách</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name = "email" id="email" placeholder="Họ tên, email, username">
									
									
								</div>
								
							</div> -->
						
							
								
							
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									<button type="submit"  class="btn btn-primary" name="signup1" value="Thêm">Thêm</button>
									<button id = "btnHuy" type="submit" onclick = "Huy(); return false;" class="btn btn-danger" name="huy" value="Hủy">Hủy</button>
								</div>
							</div>

						</form>
						</div>
					</div>
				</div>
				
				
			   </div>
			</div>
			</c:if>
		
        </div>
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