<?xml version="1.0" encoding="ISO-8859-1" ?>
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
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/QuanLyLichCaNhan"
user="root" password="trongtri96"/>
<sql:query dataSource ="${snapshot}" var="result1">
select MaSuKien, TenSuKien, DiaDiem, NgayBatDau, GioBatDau, NgayKetThuc, GioKetThuc, MoTa from SuKien
where TenDangNhap = '${sessionScope['loginUser']}';
</sql:query>

<sql:query dataSource ="${snapshot}" var="result">
select s.MaSuKien, s.TenSuKien, sl.NgayLap from SuKien_Lap sl, SuKien s
where s.TenDangNhap = '${sessionScope['loginUser']}' and sl.MaSuKien = s.MaSuKien;
</sql:query>


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
		
		var ngay;
		var thang;
		var x;
		var k;
		var l;
		var z;
		var a = 't';
		var b = 18;
	    function Ten(a)
	    {
	    	return a;
	    }
	    function Ngay(b)
	    {
	    	
	    }
	    /* var mang = new Array();
	    var tam = new Array();
	    var i = 0;
	    <c:forEach var="row1" items="${result1.rows}">
	    	k = "${row1.NgayBatDau}";
	    	l = k.split('-')
	    	mang[i] = "${row1.NgayBatDau}";
	    	i = i + 1;
	    </c:forEach> 
	    for (var i = 0; i < name_array.length; i++){
	        tam
	    } */
	    
		//alert(a);
		/* var s = "${row1.NgayBatDau}"
			var comp = s.split('-')
		    var a = parseInt(comp[1], 10)
		    var b = parseInt(comp[2], 10) */
			//alert(b);
		
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
				/* var title = prompt('Event Title:');
				
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
				} */
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
			/* <c:forEach var="row1" items="${result1.rows}"> */
			//ssvar s = "${row1.NgayBatDau}"
				/* var comp = s.split('-')
			    var a = parseInt(comp[1], 10)
			    var b = parseInt(comp[2], 10)sss
			    alert(b); */
			  
			    
			events: [
			         
			        
/* <c:forEach var='event' items='${myData.events}'>
{ title: '${event.title}', start: new Date(${event.timestamp}) },
</c:forEach>
null */

 <c:forEach var="row1" items="${result1.rows}">
	
		{
			
			
title: "<c:out value="${row1.TenSuKien}"/>",
start: new Date("${row1.NgayBatDau}"),
url: 'XuLy_SuKien_jstl.jsp?id=<c:out value="${row1.MaSuKien}"/>'	
		},
				
		
</c:forEach>
<c:forEach var="row" items="${result.rows}">
{
	/* <a onclick = "XacNhan(); return false;" href="#">Thoát</a> */
			
	title: "<c:out value="${row.TenSuKien}"/>",

	start: new Date("${row.NgayLap}"),
	url: 'XuLy_SuKien_jstl.jsp?id=<c:out value="${row.MaSuKien}"/>'	
					},
	</c:forEach>
 

				{
					/* 
					title: function Ten(a)
					{
						
					},
					
					start: new Date(y, m, 10)  */
					
					title: "${result1.rowCount}",
					k: 10,
					start: new Date(y, m, 10)
				}
				
				/* ,
				{
					title: "${result1.rowCount}",
					start: new Date(y, m, 2)
				},
				{
					title: "${row1.TenSuKien}",
					start: new Date(y, m, 8)
				} */
				/* ,
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
				} */
			],		
			
			/* </c:forEach> */
		});
		
		
	});
		
        
		/* function XacNhanThoat()
			{
			
				var kq = confirm("Bạn có chắc muốn thoát?");
				if(kq == true)
				{
					location = "logout.jsp"
				}
				
				
				
			} */
			
		function XacNhan_Thoat()
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
	
	
	<sql:query dataSource ="${snapshot}" var="result2">
select MaSuKien, TenSuKien, DiaDiem, DATE_FORMAT(NgayBatDau,'%m/%d/%Y') AS NgayBatDau, GioBatDau,
DATE_FORMAT(NgayKetThuc,'%m/%d/%Y') AS NgayKetThuc, GioKetThuc, MoTa, TenDangNhap, BaoTruoc from SuKien;
</sql:query>



<%-- <c:forEach var = "row1" items = "${result1.rows}">
<c:out value="${row1.GioBatDau}"/>
</c:forEach> --%>

<% request.setCharacterEncoding("UTF-8"); %>
<%-- <c:forEach var = "row2" items = "${result2.rows}">
<c:if test="${row.HoTen == 'Tran Trong Tri'}">

<sql:query dataSource ="${snapshot}" var="result3">
select Email from NguoiDung where TenDangNhap = '${row2.TenDangNhap}';
</sql:query> 
<c:forEach var = "row3" items = "${result3.rows}">

 <c:import url="/Servelet_GuiMail?masukien=${row2.MaSuKien}&tensukien=${row2.TenSuKien}&giobatdau=${row2.GioBatDau}&gioketthuc=${row2.GioKetThuc}&ngaybatdau=${row2.NgayBatDau}&ngayketthuc=${row2.NgayKetThuc}&diadiem=${row2.DiaDiem}&mota=${row2.MoTa}&email=${row3.Email}&baotruoc=${row2.BaoTruoc}" />

</c:forEach>
</c:if>
</c:forEach> --%>
	
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
							
							<!-- <form action="XuLy_TimBanBe_jstl.jsp" method="post" class="navbar-form navbar-left" role="search">
								<div class="form-group">
									 <input type="text" name = "BanBe" id = "BanBe" class="form-control" placeholder="Tìm bạn bè">
								</div>
								<button type="submit"  class="btn btn-default">Search</button>
							</form> -->
							<%-- <%@include file="Header_jstl_1.jsp" %> --%>
							<form action="XuLy_TimBanBe_jstl.jsp" method="post" class="navbar-form navbar-left" role="search">
								<div class="form-group">
									 <input type="text" name = "BanBe" id = "BanBe" class="form-control" placeholder="Tìm bạn bè">
								</div>
								<button type="submit"  class="btn btn-default">Search</button>
</form>
							
							<%-- <li>Welcome <%=session.getAttribute("userid")%></li>
							<li><a onclick = "XacNhan(); return false;" href="#">Thoát</a></li>
							 --%>
							
							
							 <!-- <li><a onclick = "XacNhan(); return false;" href="#">Thoát</a></li> -->
							
							<li><a onclick = "XacNhan_Thoat(); return false;" href="#">Thoát</a></li>
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
						<a href="TrangChu.jsp" class="navbar-brand"> <span class="glyphicon glyphicon-home"></span></a>
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
							
              
            
           <%--  <%@include file="header.jsp" %> --%>
            
            <%-- <c:if test="${empty sessionScope['loginUser']}">
    			<c:redirect url="DangNhap.jsp" />
			</c:if>
            
			Welcome <a href = "TrangCaNhan.jsp"> <c:out value="${sessionScope['loginUser']}" /></a> --%>
			
			<%-- <%@include file="header_jstl.jsp" %> --%>
			
			<%-- <%@include file="header_jstl.jsp" %> --%>
			
			<div id = "content">
				<div id='wrap'>

					<div id='calendar'></div>

					<div style='clear:both'></div>
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