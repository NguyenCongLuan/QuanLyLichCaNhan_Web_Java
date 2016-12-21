<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
      
  <!doctype html PUBLIC "//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Sự kiện của tôi</title>
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
		
			
			.glyphicon
			{
            font-size: 10px;
            color: orange;
			}
			#btnHuy
			{
				margin-left: 15px;
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
		
        function TimBanBe()
			{
			
				var element = document.getElementsByTagName('input');
				if(element[0].value != '')
				{
					location = "TimBanBe.jsp"
				}
				
				
			}
		function XacNhan()
			{
			
				var kq = confirm("Bạn có chắc muốn thoát?");
				if(kq == true)
				{
					location = "DangNhap.jsp"
				}
				
				
				
			}
		function TroLai()
			{
			
				location = "TrangChu.jsp";
			
			}	
			
		function Xoa()
			{
			
				var kq = confirm("Bạn có chắc muốn xóa sự kiện này?");
				if(kq == true)
				{
					alert("Đã xóa thành công");
					location = "SuKienCuaToi.jsp"
				}
				
				
				
			}
		$.validator.setDefaults( {
			submitHandler: function () {
				$('.alert-success').html('Chỉnh sửa sự kiện thành công! <a href="#" data-dismiss="modal" class="alert-link">Quay lại</a>').removeClass('hide');
				
				
			}
			
		} );

		$( document ).ready( function () {
			
			$( "#edit_event" ).validate( {
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
					
					
					comment: "required",
					email: {
						
						email: true
					}
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
					email: "Please enter a valid email address"
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
							
							<form class="navbar-form navbar-left" role="search">
								<div class="form-group">
									 <input type="text" id = "timbanbe" class="form-control" placeholder="Tìm bạn bè">
								</div>
								<button type="submit" onclick = "TimBanBe(); return false;" class="btn btn-default">Search</button>
							</form>
							<li><a onclick = "XacNhan(); return false;" href="#">Thoát</a></li>
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
								
								<a href = "TrangCaNhan.jsp" > <span class="glyphicon glyphicon-user"></span> Trang cá nhân </a> </li>
							</li>
                            
							<li> <a href = "SuKienCuaToi.jsp"> <span class="glyphicon glyphicon-book"></span>  Sự kiện của tôi </a> </li>
							<li> <a href = "ThemSuKien.jsp"> <span class="glyphicon glyphicon-pencil"></span> Thêm sự kiện</a> </li>
							<li> <a href = "TimSuKien.jsp"> <span class="glyphicon glyphicon-search "></span> Tìm sự kiện</a>
			
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
			<div class="row">
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
										<th>STT</th>
										<th>Tên sự kiện</th>
										<th>Địa điểm</th>
										<th>Ngày bắt đầu</th>
										<th>Giờ bắt đầu</th>
										<th>Ngày kết thúc</th>
										<th>Giờ kết thúc</th>
										<th>Mô tả</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Nộp deadline</td>
										<td>Mọi nơi</td>
										<td>23/09/2016</td>
										<td>6:30AM</td>
										<td>28/09/2016</td>
										<td>23:00PM</td>
										<td>Quan trọng</td>
										<td>
											<a data-toggle="modal" data-target="#myModal" href = "#">Sửa </a>
											<a onclick = "Xoa(); return false;" href = "#">Xóa </a>
										</td>
									</tr>
									
									
							
								</tbody>
							</table>
							
							
							
							
						</form>
						
					</div>
									
		
				</div>
				<div class="form-group">
								
					<button type="submit" onclick = "TroLai(); return false;" class="btn btn-primary" name="trolai" value="Trở lại">Thoát</button>
				</div>
				
			   </div>
			   
			   <div id="myModal" class="modal fade" role="dialog">
				  <div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Chỉnh sửa sự kiện</h4>
					  </div>
					  <div class="modal-body">
						<form id="edit_event" method="post" class="form-horizontal" action="">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="tendangnhap">Tên sự kiện </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="tensukien" name="tensukien" placeholder="Tên sự kiện" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="password1">Địa điểm</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="diadiem" name="diadiem" placeholder="Địa điểm" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Ngày bắt đầu</label>
								<div class="col-sm-5">
									<input type="date" class="form-control" id="ngaybatdau" name="ngaybatdau" placeholder="Ngày bắt đầu" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Giờ bắt đầu</label>
								<div class="col-sm-5">
									<input type="time" class="form-control" id="giobatdau" name="giobatdau" placeholder="Giờ bắt đầu" />
								</div>
							</div>
							
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Ngày kết thúc</label>
								<div class="col-sm-5">
									<input type="date" class="form-control" id="ngayketthuc" name="ngayketthuc" placeholder="Ngày kết thúc" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="ngaysinh">Giờ kết thúc</label>
								<div class="col-sm-5">
									<input type="time" class="form-control" id="gioketthuc" name="gioketthuc" placeholder="Giờ kết thúc" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="confirm_password1">Báo qua</label>
								<div class="col-sm-5">
									<select class="form-control" id="sel1">
										<option>Email</option>
										<option>SĐT</option>
										<option>Cả hai</option>
									
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="hoten">Báo trước</label>
								<div class="col-sm-5">
									<select class="form-control" id="sel1">
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
									<select class="form-control" id="sel1">
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
									<select class="form-control" id="sel1">
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
									<select class="form-control" id="sel1">
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
									<textarea class="form-control" rows="5" name = "comment" id="comment"></textarea>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="congty">Email</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name = "email" id="email" placeholder="Nhập email khách">
								</div>
							</div>
							
							
							<div class="alert alert-success hide" role = "alert">
								
							</div>
							
							<div class="form-group">
								<div" class="col-sm-9 col-sm-offset-4">
									<button type="submit"  class="btn btn-primary" name="signup1" value="Thêm">Lưu</button>
									<button id = "btnHuy" type="submit" data-dismiss="modal" class="btn btn-danger" name="huy" value="Hủy">Hủy</button>
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