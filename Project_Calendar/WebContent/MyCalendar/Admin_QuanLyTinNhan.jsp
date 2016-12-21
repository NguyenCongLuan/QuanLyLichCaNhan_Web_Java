<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
      
  <!doctype html PUBLIC "//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Quản lý tin nhắn</title>
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
		function Thoat()
			{
			
				
				location = "Admin_QuanLyNguoiDung.jsp"
				
				
			}
			
	function Tim()
			{
			
				var element = document.getElementsByTagName('input');
				if(element[0].value != '')
				{
					location = "Admin_TimTaiKhoan.jsp"
				}
				
				
			}
			
	function XoaTinNhan()
			{
			
				var kq = confirm("Bạn có chắc muốn xóa tin nhắn này?");
				if(kq == true)
				{
					alert("Đã xóa thành công!");
					location = "Admin_QuanLyTinNhan.jsp";
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
							<li >
								
								<a   href = "Admin_QuanLyNguoiDung.jsp" > <span class="glyphicon glyphicon-user"></span> Quản lý tài khoản </a> </li>
							</li>
                            
							<li class = "active"> <a href = "Admin_QuanLyTinNhan.jsp"> <span class="glyphicon glyphicon-book"></span>  Quản lý tin nhắn </a> </li>
							<li> <a href = "Admin_DoiMatKhau.jsp"> <span class="glyphicon glyphicon-cog "></span> Đổi mật khẩu</a> </li>
							
							<form class="navbar-form navbar-left" role="search">
								<div class="form-group">
									 <input type="text" id = "timbanbe" class="form-control" placeholder="Tìm tài khoản">
								</div>
								<button type="submit" onclick = "Tim(); return false;" class="btn btn-default">Search</button>
							</form>
							<li><a onclick = "XacNhan(); return false;" href="#">Thoát</a></li>
			
							
					
					
                        </ul>
                    </div>
                </nav>
            </div>
			<div class="row">
			  <div class="col-sm-8 col-sm-offset-2">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Danh sách tin nhắn</h3>
					</div>
					<div class="panel-body">
						<form id="signupForm1" method="post" class="form-horizontal" action="">
							
							<table class="table table-hover">
							<thead>
								<tr>
									<th>STT</th>
									<th>Tên người dùng</th>
									
									<th>Email</th>
									<th>Chủ đề</th>
									<th>Nội dung</th>
									
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Công Luận</td>
									
									<td>congluan@gmail.com</td>
									<td>Trợ giúp</td>
									<td>Không đổi mật khẩu được</td>
									
									<td>
										<a href = "Admin_Replay.jsp">Trả lời</a>
										<a onclick = "XoaTinNhan(); return false;" href = "#">Xóa</a>
									</td>
								</tr>
                        
							</tbody>
							<tbody>
								<tr>
									<td>2</td>
									<td>Văn A</td>
									
									<td>vana@gmail.com</td>
									<td>Sự kiện</td>
									<td>Không thêm sự kiện được</td>
									
									<td>
										<a href = "Admin_Replay.jsp">Trả lời</a>
										<a onclick = "XoaTinNhan(); return false;" href = "#">Xóa</a>
									</td>
								</tr>
                        
							</tbody>
						</table>
						</form>
						
					</div>
									
		
				</div>
				<div class="form-group">
								
					<button type="submit" onclick = "Thoat(); return false;" class="btn btn-primary" name="trolai" value="Trở lại">Thoát</button>
				</div>
				
			   </div>
			</div>
			
			
        </div>
		
	<script type="text/javascript" href="js1/jquery-3.1.1.min.js"> </script>
	<script type="text/javascript" href="js1/bootstrap.min.js"> </script>
</body>
</html>