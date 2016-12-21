<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
<%@ page import="java.io.*, java.util.*, java.sql.*"  %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
  <!doctype html PUBLIC "//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Đăng nhập</title>
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
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
	 <style type="text/css">
    	.container
	{
		margin-top: 80px;
	}
	#quenmatkhau
		{	
			margin-left: 38px;
			text-decoration: none;
		}
		
	#modal_pass
	{
		margin-left: 2px;
	}
	#btnHuy
	{
		margin-left: 15px;
	}
	.error
	
	{
		color: red;
	}	
    </style>
		
	<script type="text/javascript">

	
	$(function() {
		$('#form-login').validate({
			rules : {
				username : {
					required : true,
					minlength : 8
				},
				pass : {
					required : true,
					minlength : 8
				}
			},
			messages : {
				username : {
					required : "Tên đăng nhập không được để trống",
					minlength : "Tên đăng nhập phải ít nhất 6 ký tự",
				},
				pass : {
					required : "Mật khẩu không được để trống",
					minlength : "Mật khẩu phải có ít nhất 8 ký tự"
				}
			},
			submitHandler : function (form) {
				
				if($('#user').is(":checked"))
				{
					location = "TrangChu.jsp"
						
					
				}
				else
				{
					location = "Admin_QuanLyNguoiDung.jsp"
				}
			}

		});
	})
	//<!-- Validation Login-->
	
	
	
	

		$( document ).ready( function () {
			
			$( "#signupForm1" ).validate( {
				rules: {
					
					tendangnhap: {
						required: true,
						minlength: 6
					},
					password1: {
						required: true,
						minlength: 8
					},
					confirm_password1: {
						required: true,
						minlength: 8,
						equalTo: "#password1"
					},
					hoten: {
						required: true,
						minlength: 6
					},
					email1: {
						required: true,
						email: true
					},
					
					ngaysinh: "required",
					congty: {
						required: true,
						minlength: 2
					},
					diachi: {
						required: true,
						minlength: 2
					},
					sdt: {
						required: true,
						minlength: 6,
						digits: true
					},
					agree1: "required"
				},
				messages: {
					
					tendangnhap: {
						required: "Please enter a account name",
						minlength: "Your account name must consist of at least 6 characters"
					},
					password1: {
						required: "Please provide a password",
						minlength: "Your password must be at least 8 characters long"
					},
					confirm_password1: {
						required: "Please provide a password",
						minlength: "Your password must be at least 8 characters long",
						equalTo: "Please enter the same password as above"
					},
					hoten: {
						required: "Please enter a your name",
						minlength: "Your name must consist of at least 6 characters"
					},
					email1: {
						required: "Please enter a email address",
						email: "Please enter a valid email address"

					},
					
					ngaysinh: "Please enter a birthday",
					congty: {
						required: "Please enter a company",
						minlength: "Your company name must consist of at least 2 characters"
					},
					diachi: {
						required: "Please enter a address",
						minlength: "Your address name must consist of at least 2 characters"
					},
					sdt: {
						required: "Please enter a phone nummber",
						minlength: "Your phone nummber must consist of at least 6 characters",
						digits: "Please enter a valid phone nummber"
					},
					agree1: "Please accept our policy"
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
		
	
	
	

	//<!-- Validation Confirm email-->
	$(function() {
		$('#form-email').validate({
			rules : {
				username : {
					required : true,
					minlength : 6
				},
				email : {
					required : true,
					email: true
				}
			},
			messages : {
				username : {
					required : "Tên đăng nhập không được để trống",
					minlength : "Tên đăng nhập phải ít nhất 6 ký tự",
				},
				email : {
					required : "Email không được để trống",
					email : "Email không đúng định dạng",
				}
			},
			

		});
	});
	//<!-- Validation Confirm email-->
	
	
	//<!-- Validation change pass-->
	
	
	
	$(function() {
		$('#form-changePass').validate({
			rules : {
				password: {
						required: true,
						minlength: 8
					},
				re_password: {
						required: true,
						minlength: 8,
						equalTo: "#password"
					}
					
			},
			messages : {
				password: {
						required: "Mật khẩu không được để trống",
						minlength: "Mật khẩu phải chứa ít nhất 8 ký tự"
					},
				re_password: {
						required: "Mật khẩu nhập lại không được để trống",
						minlength: "Mật khẩu nhập lại phải chứa ít nhất 8 ký tự",
						equalTo: "Mật khẩu nhập lại không trùng khớp"
						
					},
			},
			submitHandler : function (form) {
				
				
					$('.alert-info').html('Cập nhật mật khẩu mới thành công! <a data-dismiss="modal" href="#" class="alert-link">Thoát</a>').removeClass('hide');
				
					
			}

		});
	});
	
	//<!-- Validation change pass-->
			
	</script>
	
</head>
<body>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/test"
	user="root" password="trongtri96"/>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Đăng nhập</h3>
					</div>
					<div class="panel-body">
						<form id="form-login" action="XuLyDN.jsp" method="post"  class="form-horizontal" >
						
							<font color="red">
								<c:if test="${not empty param.errMsg}">
					            	<c:out value="${param.errMsg}" />
					        	</c:if>
					        </font>
							
							<font color="green"><c:if test="${not empty param.susMsg}">
					            <c:out value="${param.susMsg}" />
					            
					        </c:if></font>
					        
					        <font color="green"><c:if test="${not empty param.susMsg_1}">
					            <c:out value="${param.susMsg_1}" />
					            <a data-toggle="modal" data-target="#myModal_password" id = "modal_pass" href = "#">Tiếp tục</a>
					        </c:if></font>
					        
							<div class="form-group">
								<label class="col-sm-4 control-label" for="username">Tên đăng nhập </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="username" name="username" placeholder="Tên đăng nhập" />
									<p style="color:red;display:none;" class="error errorUsername"></p>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="password1">Mật khẩu</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="pass" name="pass" placeholder="Mật khẩu" />
									<p style="color:red;display:none;" class="error errorPassword"></p>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-5 col-sm-offset-4">
									<div class="checkbox">
										<label>
											<input type="checkbox" id="remember" name="remember" value="remember" />Ghi nhớ mật khẩu
											<b><a data-toggle="modal" data-target="#myModal_email" id = "quenmatkhau" href = "#">Quên mật khẩu</a></b>
										</label>
									</div>
									
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-5 col-sm-offset-4">
									<label class="radio-inline">
										
										<input type="radio" checked = "checked" name="inlineRadioOptions" id="user" value="option1"> User
										
									</label>
									<label class="radio-inline">
										
										<input type="radio" name="inlineRadioOptions" id="admin" value="option2"> Admin
										
									</label>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									<button type="submit"  class="btn btn-primary" name="signup1" value="Đăng nhập">Đăng nhập</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
								  Bạn chưa có tài khoản, click vào <b><a data-toggle="modal" data-target="#myModal" href = "#">Đăng ký</a></b>
								</div>
							</div>
							
						</form>
					</div>
				</div>
			</div>
			
			<!-- Modal content sign up-->
			<div id="myModal" class="modal fade" role="dialog">
				  <div class="modal-dialog">

					
					<div class="modal-content">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Đăng ký tài khoản</h4>
					  </div>
					  <div class="modal-body">
						
						<form id="signupForm1" action="XuLy_DangKy.jsp" method="post" class="form-horizontal" >
							<div class="form-group">
								<label class="col-sm-4 control-label" for="tendangnhap">Tên đăng nhập </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="tendangnhap" name="tendangnhap" placeholder="Tên đăng nhập" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="password1">Mật khẩu</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="password1" name="password1" placeholder="Mật khẩu" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="confirm_password1">Xác nhận mật khẩu</label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="confirm_password1" name="confirm_password1" placeholder="Xác nhận mật khẩu" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="hoten">Họ tên</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="hoten" name="hoten" placeholder="Họ tên" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="email1">Email</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="email1" name="email1" placeholder="Email" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="gioitinh">Giới tính</label>
								<label class="radio-inline">
									<div class="col-sm-10">
										<input type="radio" checked = "checked" name="gioitinh" id="nam" value="Nam"> Nam
									</div>
								</label>
								<label class="radio-inline">
									<div class="col-sm-10">
										<input type="radio" name="gioitinh" id="nu" value="Nữ"> Nữ
									</div>
								</label>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Ngày sinh</label>
								<div class="col-sm-5">
									<input type="date" class="form-control" id="ngaysinh" name="ngaysinh" placeholder="Ngày sinh" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="congty">Công ty</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="congty" name="congty" placeholder="Công ty" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="diachi">Địa chỉ</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="diachi" name="diachi" placeholder="Địa chỉ" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label" for="sdt">Số điện thoại</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="sdt" name="sdt" placeholder="Số diện thoại" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-5 col-sm-offset-4">
									<div class="checkbox">
										<label>
											<input type="checkbox" id="agree1" name="agree1" value="agree" />Tôi đã đồng ý với các điều khoản trên
										</label>
									</div>
								</div>
							</div>
							
							<div id = "sigup" class="alert alert-info hide" role="alert"></div>

							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									
									<button type="submit"  class="btn btn-primary" name="signup1" value="Đăng ký">Đăng ký</button>
									<button id = "btnHuy" type="submit" data-dismiss="modal"  class="btn btn-danger" name="huy" value="Hủy">Hủy</button>
								</div>
							</div>
							<div>
								
							</div>
							
							
						</form>
						
						
					  </div>
					  <div class="modal-footer">
						
					  </div>
					</div>

				  </div>
			
			</div>
			
			<!-- Modal content confirm email-->
			<div id="myModal_email" class="modal fade" role="dialog">
				  <div class="modal-dialog">

					
					<div class="modal-content">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Xác nhận email</h4>
					  </div>
					  <div class="modal-body">
						
						<form class="form-horizontal" id="form-email" action="XuLy_XacNhanEmail.jsp" method="post">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="username">Tên đăng nhập </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="username" name="username" placeholder="Tên đăng nhập" />
									<p style="color:red;display:none;" class="error errorUsername"></p>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="email">Email</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="email" name="email" placeholder="Email" />
									<p style="color:red;display:none;" class="error errorEmail"></p>
								</div>
							</div>
							<div class="alert alert-success hide" role = "alert">
								
							</div>
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									<button type="submit"  class="btn btn-primary" name="xacnhan" value="Xác nhận">Xác nhận</button>
									<button id = "btnHuy" type="submit" data-dismiss="modal"  class="btn btn-danger" name="huy" value="Hủy">Hủy</button>
									
								</div>
								
							</div>
							
							
						</form>
						
						
					  </div>
					  <div class="modal-footer">
						
					  </div>
					</div>

				  </div>
			
			</div>
			
			
			<!-- Modal content change password-->
			<div id="myModal_password" class="modal fade" role="dialog">
				  <div class="modal-dialog">

					
					<div class="modal-content">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Cập nhật mật khẩu mới</h4>
					  </div>
					  <div class="modal-body">
						
						<form id="form-changePass" method="post" class="form-horizontal" action="">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="password">Mật khẩu mới </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="password" name="password" placeholder="Mật khẩu mới" />
									 <p style="color:red;display:none;" class="error errorPassword"></p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label" for="re_password">Xác nhận mật khẩu mới </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="re_password" name="re_password" placeholder="Xác nhận mật khẩu mới" />
									 <p style="color:red;display:none;" class="error errorPassword1"></p>
								</div>
							</div>
							<div class="alert alert-info hide" role="alert"></div>
							
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									<button type="submit"  class="btn btn-primary" name="xacnhan" value="Xác nhận">Xác nhận</button>
									<button id = "btnHuy" type="submit" data-dismiss="modal"  class="btn btn-danger" name="huy" value="Hủy">Hủy</button>
									
								</div>
								
							</div>
							
							
						</form>
						
					  </div>
					  <div class="modal-footer">
						
					  </div>
					</div>

				  </div>
			
			</div>
			
			
		</div>
	</div>
	
	<script type="text/javascript" href="js1/jquery-3.1.1.min.js"> </script>
	<script type="text/javascript" href="js1/bootstrap.min.js"> </script>
		
</body>
</html>