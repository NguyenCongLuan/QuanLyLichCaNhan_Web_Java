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
	<title>Liên hệ</title>
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
				$('.alert-success').html('Đã gửi tin thành công! <a href="TrangChu.jsp" >Thoát</a>').removeClass('hide');
			}
			
		} ); */

		$( document ).ready( function () {
			
			$( "#contactform" ).validate( {
				rules: {
					
					hoten: {
						required: true
						
					},

					email_1: {
						required: true,
						email: true
					},
					chude: {
						required: true
						
					},
					noidung: "required",
					
				},
				messages: {
					
					hoten: {
						required: "Please enter a your name"

					},
					email_1: {
						required: "Please enter a email address",
						email: "Please enter a valid email address"

					},
					chude: {
						required: "Please enter a topic"
						
					},
					noidung: "Please enter a content"
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
							<li> <a href = "ThemSuKien.jsp"> <span class="glyphicon glyphicon-pencil"></span> Thêm sự kiện</a> </li>
							<li> <a href = "TimSuKien.jsp"> <span class="glyphicon glyphicon-search "></span> Tìm sự kiện</a>
			
							<li class = "active" class = "dropdown">
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
			<div class="row">
			  <div class="col-sm-8 col-sm-offset-2">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Liên hệ phản hồi</h3>
					</div>
					<div class="panel-body">
						
						<form id="contactform" method="post" class="form-horizontal" action="">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="hoten">Họ tên </label>
								<div class="col-sm-5">
									<input type="text" class="form-control input-lg" id="hoten" name="hoten" placeholder="Nhập họ tên" />
									<span class="help-block"> <i>(**Bắt buộc**)</i>.</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label" for="email_1">Email </label>
								<div class="col-sm-5">
									<input type="email" class="form-control " id="email_1" name="email_1" placeholder="Nhập email" />
									<span class="help-block"> <i>(**Bắt buộc**)</i>.</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label" for="chude">Chủ đề </label>
								<div class="col-sm-5">
									<input type="text" class="form-control input-sm" id="chude" name="chude" placeholder="Nhập chủ đề" />
									<span class="help-block"> <i>(**Bắt buộc**)</i>.</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label" for="noidung">Nội dung </label>
								<div class="col-sm-5">
									<textarea class="form-control" rows="5" id="noidung" name="noidung"></textarea>
									<span class="help-block"> <i>(**Bắt buộc**)</i>.</span>
								</div>
							</div>
							<div class="alert alert-success hide" role = "alert">
								
							</div>
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									<button type="submit"  class="btn btn-primary" name="xacnhan" value="Xác nhận">Xác nhận</button>
									<button id = "btnHuy" type="submit" onclick = "Huy(); return false;" class="btn btn-danger" name="huy" value="Hủy">Hủy</button>
								</div>
								
							</div>
							
							
						</form>
						
					</div>
									
		
				</div>
				
				
			   </div>
			</div>
			
			
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