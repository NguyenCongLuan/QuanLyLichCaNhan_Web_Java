package JavaMail;


import java.sql.Connection;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.Timer;

import javax.lang.model.element.ExecutableElement;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.mysql.jdbc.PreparedStatement;

import java.util.Date;
import java.util.TimerTask;

/*import Action.Connection;
import Action.Exception;
import Action.PreparedStatement;
import Action.ResultSet;
import Action.String;*/

public class GuiMail extends TimerTask {
	
	private static String TenSK;
	private static String DiaDiem;
	public static void SendEmail() throws AddressException, MessagingException
	{
		Properties pro = System.getProperties();
		pro.put("mail.smtp.host", "smtp.gmail.com");
		pro.put("mail.smtp.auth", "true");
		pro.put("mail.smtp.port", "465");
		pro.put("mail.smtp.socketFactory.class", javax.net.ssl.SSLSocketFactory.class.getName());
		
		Session session = Session.getDefaultInstance(pro, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication("trantrongtri08@gmail.com", "trongtri181296");
				
			}
			
		});
		Message message = new MimeMessage(session);
		message.addRecipient(Message.RecipientType.TO, new InternetAddress("killhunterrrr1996@gmail.com"));
		message.addRecipient(Message.RecipientType.CC, new InternetAddress("14110353@student.hcmute.edu.vn"));
		
		message.setSubject("Test Email - " + new Date());
		
		String content = "Lịch cá nhân";
		message.setContent(content, "text/html; charset=UTF-8");
		
		Transport.send(message);
		
		
	}
	
	public static  void XuLy() {
		
		Connection conn = null;
		try {
			conn = KetNoi.getConnection(); // Tạo connection
			String sql = "SELECT TenSuKien, DiaDiem FROM SuKien";
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql); // Tạo đối tượng làm việc với câu SQL
			
			ResultSet rs = ps.executeQuery(); // Thực hiện câu SQL và dữ liệu đưa vào bộ rs
			while(rs.next()) { // Nếu bộ rs có dữ liệu
				// Gán các giá trị từ bộ rs vào biến đã tạo ở trên
				
				TenSK = rs.getString(1);
				DiaDiem = rs.getString(2);
				
				System.out.println(TenSK);
				System.out.println(DiaDiem);
				

			}
			
		} catch (Exception e) { // Bắt lỗi
			System.out.println(e);

		} finally {
			if (conn != null) { // Đóng connection
				try {
					conn.close();
				} catch (Exception e) {
				}
			}
		}
		
	}
	
	public static void main(String[] args) throws ParseException, InterruptedException
	{
		/*//Dinh dang thoi gian kieu MM-dd-yyyy
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
		//Lay ngay hien tai cua he thong
		Calendar cal = Calendar.getInstance();
		String datenow = sdf.format(cal.getTime());
		
        Date date1 = sdf.parse("12-20-2016");
               
        Date date = new Date(); // lấy thời gian hệ thống
        String stringDate = dateFormat.format(date);//Định dạng thời gian theo trên
        System.out.println("Date: " + stringDate);
        //System.out.println("Date 1: " + sdf.format(date1));
        //System.out.println("Date 2: " + sdf.format(date2));
        if (datenow.equals(sdf.format(date1)))
        {
            System.out.println("Date1 is equal to Date2.");
            try {
				SendEmail();
				System.out.println("Thanh cong");
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				System.out.println("Loi rui");
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
		if(datenow == "12-20-2016")
		{
			System.out.println("tt");
			try {
				SendEmail();
				System.out.println("Thanh cong");
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				System.out.println("Loi rui");
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}*/
		
		
		/*//Lap
		Timer time = new Timer(); // Instantiate Timer Object
		GuiMail st = new GuiMail(); // Instantiate SheduledTask class
		time.schedule(st, 0, 1000); // Create Repetitively task for every 1 secs
		 //timer.schedule(new MyTimeTask(), date);
		//for demo only.
		for (int i = 0; i <= 5; i++) {
			System.out.println("Execution in Main Thread...." + i);
			try {
				SendEmail();
				System.out.println("Thanh cong");
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				System.out.println("Loi rui");
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Thread.sleep(2000);
			if (i == 5) {
				System.out.println("Application Terminates");
				System.exit(0);
			}
		}*/
		
		
		//XuLy();
		
		/*long now = System.currentTimeMillis();
		System.out.println(now);*/
		/*try {
			SendEmail();
			System.out.println("Thanh cong");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			System.out.println("Loi rui");
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		
	}

}
