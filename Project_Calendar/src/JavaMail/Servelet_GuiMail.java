package JavaMail;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Calendar;
import JavaMail.XuLyMail;



/**
 * Servlet implementation class Servelet_GuiMail
 */
@WebServlet("/Servelet_GuiMail")
public class Servelet_GuiMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//private final XuLyMail x = new XuLyMail();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servelet_GuiMail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Calendar cal = Calendar.getInstance();
		int hourOfDay  = cal.get(Calendar.HOUR_OF_DAY); // 24 hour clock
		int minute     = cal.get(Calendar.MINUTE); // minutes
		int day = cal.get(Calendar.DAY_OF_MONTH); // day of month
		int month = cal.get(Calendar.MONTH);
		int year = cal.get(Calendar.YEAR);
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
		//ngay hien tai
		String datenow = sdf.format(cal.getTime());
	
		String MaSuKien = request.getParameter("masukien");
		String TenSuKien = request.getParameter("tensukien");
		String GioBatDau = request.getParameter("giobatdau");
		String NgayBatDau = request.getParameter("ngaybatdau");
		String GioKetThuc = request.getParameter("gioketthuc");
		String NgayKetThuc = request.getParameter("ngayketthuc");
		String MoTa = request.getParameter("mota");
		String DiaDiem = request.getParameter("diadiem");
		String Email = request.getParameter("email");
		String BaoTruoc = request.getParameter("baotruoc");
		String GioBatDau_1 = request.getParameter("giobatdau");
		String s_GioBatDau = GioBatDau.substring(0, 2);
		String s_PhutBatDau = GioBatDau.substring(3, 5);
		String re_NgayBatDau=NgayBatDau.replace('/','-');
		
		
		String hournow = String.valueOf(hourOfDay);
		int dem = hournow.length();
		if(dem == 1)
		{
			hournow = "0" + hournow;
		}
		
		String minutenow = String.valueOf(minute);
		
		
		
		XuLyMail g = new XuLyMail();
		if(BaoTruoc.equals("Không"))
		{
			
			if(datenow.equals(re_NgayBatDau) && hournow.equals(s_GioBatDau) && minutenow.equals(s_PhutBatDau))
			{
				
				g.sendMail(Email, "Lịch cá nhân", TenSuKien, NgayBatDau, GioBatDau, NgayKetThuc,
						GioKetThuc, MoTa, DiaDiem);
				
			}
		}
		if(BaoTruoc.equals("5 phút"))
		{
			int PhutBatDauMoi = Integer.parseInt(s_PhutBatDau);
			PhutBatDauMoi = PhutBatDauMoi - 5;
			String PhutBatDauMoi_1 = String.valueOf(PhutBatDauMoi);
			
			if(datenow.equals(re_NgayBatDau) && hournow.equals(s_GioBatDau) && minutenow.equals(PhutBatDauMoi_1))
			{
				g.sendMail(Email, "Lịch cá nhân", TenSuKien, NgayBatDau, GioBatDau, NgayKetThuc,
						GioKetThuc, MoTa, DiaDiem);
			}
		}
		if(BaoTruoc.equals("10 phút"))
		{
			int PhutBatDauMoi = Integer.parseInt(s_PhutBatDau);
			PhutBatDauMoi = PhutBatDauMoi - 10;
			String PhutBatDauMoi_1 = String.valueOf(PhutBatDauMoi);
			if(datenow.equals(re_NgayBatDau) && hournow.equals(s_GioBatDau) && minutenow.equals(PhutBatDauMoi_1))
			{
				g.sendMail(Email, "Lịch cá nhân", TenSuKien, NgayBatDau, GioBatDau, NgayKetThuc,
						GioKetThuc, MoTa, DiaDiem);
			}
		}
		
		if(BaoTruoc.equals("30 phút"))
		{
			int PhutBatDauMoi = Integer.parseInt(s_PhutBatDau);
			PhutBatDauMoi = PhutBatDauMoi - 30;
			String PhutBatDauMoi_1 = String.valueOf(PhutBatDauMoi);
			
			if(datenow.equals(re_NgayBatDau) && hournow.equals(s_GioBatDau) && minutenow.equals(PhutBatDauMoi_1))
			{
				g.sendMail(Email, "Lịch cá nhân", TenSuKien, NgayBatDau, GioBatDau, NgayKetThuc,
						GioKetThuc, MoTa, DiaDiem);
			}
		}
		
		if(BaoTruoc.equals("1 giờ"))
		{
			int GioBatDauMoi = Integer.parseInt(s_GioBatDau);
			GioBatDauMoi = GioBatDauMoi - 1;
			String GioBatDauMoi_1 = String.valueOf(GioBatDauMoi);
			
			if(datenow.equals(re_NgayBatDau) && hournow.equals(GioBatDauMoi) && minutenow.equals(s_PhutBatDau))
			{
				g.sendMail(Email, "Lịch cá nhân", TenSuKien, NgayBatDau, GioBatDau, NgayKetThuc,
						GioKetThuc, MoTa, DiaDiem);
			}
		}
	}
		/*else
		{
			
			SendSMS action = new SendSMS();
			String message = "Tên sự kiện: " + TenSuKien + ". Ngày bắt đầu: " + NgayBatDau + ". GioBatDau: " + GioBatDau;
			
			action.setMessage(message);
			action.setPhone(SoDienThoai);
			
			if(BaoTruoc.equals("5 phút"))
			{
				int PhutBatDauMoi = Integer.parseInt(s_PhutBatDau);
				PhutBatDauMoi = PhutBatDauMoi - 5;
				String PhutBatDauMoi_1 = String.valueOf(PhutBatDauMoi);
				//response.getWriter().println(s_PhutBatDau);
				//response.getWriter().println(PhutBatDauMoi_1);
				
				if(datenow.equals(re_NgayBatDau) && hournow.equals(s_GioBatDau) && minutenow.equals(PhutBatDauMoi_1))
				{
					action.send();
				}
			}
			
			if(BaoTruoc.equals("10 phút"))
			{
				int PhutBatDauMoi = Integer.parseInt(s_PhutBatDau);
				PhutBatDauMoi = PhutBatDauMoi - 10;
				String PhutBatDauMoi_1 = String.valueOf(PhutBatDauMoi);
				//response.getWriter().println(s_PhutBatDau);
				//response.getWriter().println(PhutBatDauMoi_1);
				
				if(datenow.equals(re_NgayBatDau) && hournow.equals(s_GioBatDau) && minutenow.equals(PhutBatDauMoi_1))
				{
					action.send();
				}
			}
			
			if(BaoTruoc.equals("30 phút"))
			{
				int PhutBatDauMoi = Integer.parseInt(s_PhutBatDau);
				PhutBatDauMoi = PhutBatDauMoi - 30;
				String PhutBatDauMoi_1 = String.valueOf(PhutBatDauMoi);
				//response.getWriter().println(s_PhutBatDau);
				//response.getWriter().println(PhutBatDauMoi_1);
				
				if(datenow.equals(re_NgayBatDau) && hournow.equals(s_GioBatDau) && minutenow.equals(PhutBatDauMoi_1))
				{
					action.send();
				}
			}
			
			if(BaoTruoc.equals("1 giờ"))
			{
				int GioBatDauMoi = Integer.parseInt(s_GioBatDau);
				GioBatDauMoi = GioBatDauMoi - 1;
				String GioBatDauMoi_1 = String.valueOf(GioBatDauMoi);
				//response.getWriter().println(s_PhutBatDau);
				//response.getWriter().println(PhutBatDauMoi_1);
				
				if(datenow.equals(re_NgayBatDau) && hournow.equals(GioBatDauMoi) && minutenow.equals(s_PhutBatDau))
				{
					action.send();
				}
			}
			//response.getWriter().println("ok");
		}*/
		
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().println("<h3>Đây là nhóm 1</h3>");
		//XuLyMail t = new XuLyMail();
		//t.sendMail("14110353@student.hcmute.edu.vn", "Lịch cá nhân", "Xin chào");
		/*String mail = request.getParameter("password");
		String sub = request.getParameter("password1");
		String bod = request.getParameter("confirm_password1");
		XuLyMail.sendMail(mail, sub, bod);
		response.sendRedirect("Error.jsp");*/
	}

}
