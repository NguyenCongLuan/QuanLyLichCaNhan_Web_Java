<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding ="UTF-8"%>
      <%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import ="java.sql.*" %>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title></title>
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
	
	
	<script type="text/javascript">
/* 
	$(document).ready(function() {
		
		
     var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear(); 
	
	
	}); */
	
	function AutoRefresh( t ) {
        //setTimeout("location.reload(true);", t);
	}
	</script>

</head>
<body onload="JavaScript:AutoRefresh(5000);">
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/QuanLyLichCaNhan"
user="root" password="trongtri96"/>


<sql:query dataSource ="${snapshot}" var="result1">
select MaSuKien, TenSuKien, DiaDiem, DATE_FORMAT(NgayBatDau,'%m/%d/%Y') AS NgayBatDau, GioBatDau,
DATE_FORMAT(NgayKetThuc,'%m/%d/%Y') AS NgayKetThuc, GioKetThuc, MoTa, TenDangNhap, BaoTruoc, SendMail from SuKien;
</sql:query>

<%-- <c:forEach var="data" items="${requestScope.title}" >
            <c:out value="${data}">  </c:out> 
            <h1>${name}</h1>
</c:forEach> --%>



<%-- <c:forEach var = "row1" items = "${result1.rows}">
<c:out value="${row1.GioBatDau}"/>
</c:forEach> --%>

<% request.setCharacterEncoding("UTF-8"); %>
<c:forEach var = "row1" items = "${result1.rows}">
<c:if test="${row1.SendMail == 0}">


<sql:query dataSource ="${snapshot}" var="result">
select Email, SoDienThoai from NguoiDung where TenDangNhap = '${row1.TenDangNhap}';
</sql:query> 
<c:forEach var = "row" items = "${result.rows}">

 <c:import url="/Servelet_GuiMail?masukien=${row1.MaSuKien}&tensukien=${row1.TenSuKien}&giobatdau=${row1.GioBatDau}&gioketthuc=${row1.GioKetThuc}&ngaybatdau=${row1.NgayBatDau}&ngayketthuc=${row1.NgayKetThuc}&diadiem=${row1.DiaDiem}&mota=${row1.MoTa}&email=${row.Email}&sdt=${row.SoDienThoai}&baotruoc=${row1.BaoTruoc}" />
<%-- <%= request.getAttribute("title") %> --%>
</c:forEach>
</c:if>
</c:forEach>


<!-- <form class="form-horizontal" id="passform" action="Servelet_GuiMail" method="post">
						
							<div class="form-group">
								<label class="col-sm-4 control-label" for="password">Mật khẩu cũ </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="password" name="password" placeholder="Mật khẩu cũ" />
									<font color="red">
								
					      </font>
								</div>
								
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label" for="password1">Mật khẩu mới </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="password1" name="password1" placeholder="Mật khẩu mới" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label" for="confirm_password1">Xác nhận mật khẩu mới </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="confirm_password1" name="confirm_password1" placeholder="Xác nhận mật khẩu mới" />
								</div>
							</div>
							
							<div class="alert alert-success hide" role="alert"></div>
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-4">
									<button id = "btnXacNhan" type="submit"  class="btn btn-primary" name="xacnhan" value="Xác nhận">Xác nhận</button>
									<button id = "btnHuy" type="submit" onclick = "Huy(); return false;" class="btn btn-danger" name="huy" value="Hủy">Hủy</button>
									
								</div>
								
							</div>
							
							
						</form> -->
</body>
</html>