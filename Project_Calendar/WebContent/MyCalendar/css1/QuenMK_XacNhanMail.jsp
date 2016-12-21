<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
      
  <!doctype html PUBLIC "//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Xác nhận email</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />	
	<link rel="stylesheet" type="text/css" href="css1/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css1/bootstrap-theme.min.css">
	<script type="text/javascript" src="lib/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="dist/jquery.validate.js"></script>

	<style type = "text/css">

	.container
	{
		margin-top: 80px;
	}
	#quenmatkhau
		{	
			margin-left: 38px;
			text-decoration: none;
		}
	#btnHuy
	{
		margin-left: 50px;
	}
	
	</style>
	
	<script type="text/javascript">
	
    function Huy()
		{
			alert("Hủy xác nhận email");
			location = "DangNhap.jsp"
		}
		
		
		
		
	
		
	$.validator.setDefaults( {
			submitHandler: function () {
				alert( "Xác nhận email thành công!" );
				location = "QuenMK_XacNhanMK.jsp"
			}
			
		} );

		$( document ).ready( function () {
			
			$( "#signupForm1" ).validate( {
				rules: {
					
					name: {
						required: true
						
					},

					email: {
						required: true,
						email: true
					}
					
					
				},
				messages: {
					
					name: {
						required: "Please enter a account name"

					},

					email: "Please enter a valid email address",
					
					
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
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Xác nhận email</h3>
					</div>
					<div class="panel-body">
						<form id="signupForm1" method="post" class="form-horizontal" action="">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="email">Tên đăng nhập </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="name" name="name" placeholder="Tên đăng nhập" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="email">Email</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="email" name="email" placeholder="Email" />
								</div>
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
	<script type="text/javascript" href="js1/jquery-3.1.1.min.js"> </script>
	<script type="text/javascript" href="js1/bootstrap.min.js"> </script>
</body>
</html>