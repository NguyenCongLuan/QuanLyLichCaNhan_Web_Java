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
	<title>Trang chủ</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />	
	<link rel="stylesheet" type="text/css" href="css1/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css1/bootstrap-theme.min.css">
	<script type="text/javascript" src="lib/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="dist/jquery.validate.js"></script>
	<link rel="stylesheet" type="text/css" href="footer.css">
		
	<link href='fullcalendar/fullcalendar.css' rel='stylesheet' />
	<link href='fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />

	<script src='jquery/jquery-1.10.2.js'></script>
	<script src='jquery/jquery-ui.custom.min.js'></script>

	<script src='fullcalendar/fullcalendar.js'></script>
	
	 <style type="text/css">
            body{
                min-height: 1000px;
                padding-top: 50px;
            }
            .example{
                margin: 5px;
            }
			
			
			
			.glyphicon
			{
            font-size: 10px;
            color: orange;
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
				
				
			#content {
				margin-top: 20px;
				text-align: center;
				font-size: 14px;
				font-family: "Helvetica Nueue",Arial,Verdana,sans-serif;
				
				
				
				}
				
			#wrap {
				width: 700px;
				
				margin: 0 auto;
				}
				
			#external-events {
				float: left;
				width: 150px;
				padding: 0 10px;
				text-align: left;
				}
				
			#external-events h4 {
				font-size: 16px;
				margin-top: 0;
				padding-top: 1em;
				}
				
			.external-event { /* try to mimick the look of a real event */
				margin: 10px 0;
				padding: 2px 4px;
				background: #3366CC;
				color: #fff;
				font-size: .85em;
				cursor: pointer;
				}
				
			#external-events p {
				margin: 1.5em 0;
				font-size: 11px;
				color: #666;
				}
				
			#external-events p input {
				margin: 0;
				vertical-align: middle;
				}
		
			#calendar {
		/* 		float: right; */
		        margin: 0 auto;
				width: 500px;
				background-color: #FFFFFF;
				  border-radius: 6px;
		        box-shadow: 0 1px 2px #C3C3C3;
				}
	
    </style>
	
	<script type="text/javascript">
		
		
		$(document).ready(function() {
	    var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		/*  className colors
		
		className: default(transparent), important(red), chill(pink), success(green), info(blue)
		
		*/		
		
		  
		/* initialize the external events
		-----------------------------------------------------------------*/
	
		$('#external-events div.external-event').each(function() {
		
			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};
			
			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);
			
			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});
			
		});
	
	
		/* initialize the calendar
		-----------------------------------------------------------------*/
		
		var calendar =  $('#calendar').fullCalendar({
			header: {
				left: 'title',
				center: 'agendaDay,agendaWeek,month',
				right: 'prev,next today'
			},
			editable: true,
			firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
			selectable: true,
			defaultView: 'month',
			
			axisFormat: 'h:mm',
			columnFormat: {
                month: 'ddd',    // Mon
                week: 'ddd d', // Mon 7
                day: 'dddd M/d',  // Monday 9/7
                agendaDay: 'dddd d'
            },
            titleFormat: {
                month: 'MMMM yyyy', // September 2009
                week: "MMMM yyyy", // September 2009
                day: 'MMMM yyyy'                  // Tuesday, Sep 8, 2009
            },
			allDaySlot: false,
			selectHelper: true,
			select: function(start, end, allDay) {
				var title = prompt('Event Title:');
				
				if (title) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
			},
			droppable: true, // this allows things to be dropped onto the calendar !!!
			drop: function(date, allDay) { // this function is called when something is dropped
			
				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');
				
				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);
				
				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;
				
				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
				
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
				
			},
			
			events: [
				{
					title: 'All Day Event',
					start: new Date(y, m, 1)
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false,
					className: 'info'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false,
					className: 'info'
				},
				{
					title: 'Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false,
					className: 'important'
				},
				{
					title: 'Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false,
					className: 'important'
				},
				{
					title: 'Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false,
				},
				{
					title: 'Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/',
					className: 'success'
				}
			],			
		});
		
		
	});
		
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
					location = "logout.jsp"
				}
				
				
				
			}
			
		function XacNhan_1()
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
							
							
							
							<%-- <li>Welcome <%=session.getAttribute("userid")%></li>
							<li><a onclick = "XacNhan(); return false;" href="#">Thoát</a></li>
							 --%>
							
							
							 <li><a onclick = "XacNhan(); return false;" href="#">Thoát</a></li>
							
							<li><a onclick = "XacNhan_1(); return false;" href="#">Log out</a></li>
							
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
						<a href="TrangChu.jsp" class="navbar-brand"> <span class="glyphicon glyphicon-home"></span></a>
                    </div>

                    <div class="navbar-collapse collapse" id="menu">
                        <ul class="nav navbar-nav">
							<li>
								
								<a   href = "TrangCaNhan.jsp" > <span class="glyphicon glyphicon-user"></span> Trang cá nhân </a> </li>
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
            <%-- 
            	<%
			    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
				%>
				<% response.sendRedirect("DangNhap.jsp"); %> 
				<%} else {
				%>
				<li>Welcome <%=session.getAttribute("userid")%></li>
				<%
				    }
				%>
            
				<li><a onclick = "XacNhan(); return false;" href="#">Thoát</a></li> --%>
							
            
            <%@include file="header.jsp" %>
            
            <%-- <c:if test="${empty sessionScope['loginUser']}">
    			<c:redirect url="DangNhap.jsp" />
			</c:if>
            
			Welcome <a href = "TrangCaNhan.jsp"> <c:out value="${sessionScope['loginUser']}" /></a> --%>
			
			<%-- <%@include file="header_jstl.jsp" %> --%>
			
			<div id = "content">
				<div id='wrap'>

					<div id='calendar'></div>

					<div style='clear:both'></div>
				</div>
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