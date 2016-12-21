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
	<title>Đổi email</title>
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
           #email_error
			{
				color: red;
				margin-top: 15px;
				margin-left: 410px;
				
			}
			.alert-success
			{
				margin-top: 5px;
			}
			.row
			
			{
				margin-top: 30px;
			}
			#email_error
			{
				color: red;
				margin-top: 15px;
				margin-left: 410px;
				
			}
			#btn
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
		
		
		/* $(document).ready(function()
				{
						$("#emailform").submit(function(){
							
						
						
				        // BƯỚC 1: Lấy dữ liệu từ form
				        var email_old_val   = $.trim($('#email_old').val());
				        var email_new_val   = $.trim($('#email_new').val());
				        var email_new_val_1 = $.trim($('#email_new_1').val());
				        
				 
				        // BƯỚC 2: Validate dữ liệu
				        // Biến cờ hiệu
				        var flag = true;
				 
				        // Email
				        if (email_new_val != email_new_val_1){
				            $("#email_error").text('Nhập lại email mới phải trùng khớp!').show();
				            return false;
							}
							
						
							$("#email_error").hide();
							$('.alert-success').html('Đổi email thành công! <a data-dismiss="modal" href="TrangChu.jsp" class="alert-link">Thoát</a>').removeClass('hide');
							return false;
						
				    });
				}); */
				$( document ).ready( function () {
					
					$( "#emailform" ).validate( {
						rules: {
							
							email: {
								required: true,
								email: true
							},
							email1: {
								required: true,
								email: true
							},
							confirm_email1: {
								required: true,
								email: true,
								equalTo: "#email1"
							}
							
						},
						messages: {
							
							email: {
								required: "Please provide a old email",
								email: "Please enter a valid email address"

							},
							email1: {
								required: "Please provide a new email",
								email: "Please enter a valid email address"

							},
							confirm_email1: {
								required: "Please confirm new email",
								email: "Please enter a valid email address",

								equalTo: "Please enter the same new email as above"
							},
							
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
           
            <font color="green">
								<c:if test="${not empty param.susMsg}">
					            	<c:out value="${param.susMsg}" />
					        	</c:if>
			
			<%-- <c:if test="${not empty param.msg_email1}">
					            	<c:out value="${param.msg_email1}" />
					        	</c:if> --%>
					      </font>
			<div class="row">
			  <div class="col-sm-8 col-sm-offset-2">
				
				<!-- <div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Đổi email</h3>
					</div>
					<div class="panel-body">
						
						<form class="form-inline" id = "emailform" method = "post" action = "" role="form">
						  <div class="form-group">
							<label class="sr-only" for="email_old">Email hiện tại</label>
							<input type="email" class="form-control" id="email_old" placeholder="Nhập email hiện tại" required>
							<p style="color:red;display:none;" class="error errorEmail"></p>
						  </div>
						  <div class="form-group">
							<label class="sr-only" for="email_new">Email mới</label>
							<input type="email" class="form-control" id="email_new" placeholder="Nhập email mới" required>
						  </div>
						  <div class="form-group">
							<label class="sr-only" for="email_new_1">Email mới</label>
							<input type="email" class="form-control" id="email_new_1" placeholder="Nhập lại email mới" required>
							
						  </div>
						  
						  <div id="email_error">
							
						  </div>
						  
						  <div class="alert alert-success hide" role="alert"></div>
						  <div id = "btn" class="form-group">
							<button id = "btnXacNhan" type="submit"  class="btn btn-primary" name="tim" value="Xác nhận">Xác nhận</button>			
							<button id = "btnHuy" type="submit" onclick = "Huy(); return false;" class="btn btn-danger">Hủy</button>
						  </div>
					    </form>
						
					</div>
									
		
				</div> -->
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Đổi Email</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" id="emailform" action="XuLy_DoiEmail_jstl.jsp" method="post">
						
							<div class="form-group">
								<label class="col-sm-4 control-label" for="email">Email cũ </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="email" name="email" placeholder="Email cũ" />
									<font color="red">
								<c:if test="${not empty param.errMsg}">
					            	<c:out value="${param.errMsg}" />
					        	</c:if>
					      </font>
								</div>
								
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="email1">Email mới </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="email1" name="email1" placeholder="Email mới" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label" for="confirm_password1">Xác nhận email mới </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="confirm_email1" name="confirm_email1" placeholder="Xác nhận email mới" />
								</div>
							</div>
							
							<div class="alert alert-success hide" role="alert"></div>
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									<button id = "btnXacNhan" type="submit"  class="btn btn-primary" name="xacnhan" value="Xác nhận">Xác nhận</button>
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