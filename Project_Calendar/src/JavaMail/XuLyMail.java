package JavaMail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class XuLyMail {
	public static boolean sendMail(String to, String subject, String tensukien, String ngaybatdau,
			String giobatdau, String ngayketthuc, String gioketthuc, String diadiem, String mota) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("trantrongtri08@gmail.com", "trongtri181296");
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress("killhunterrrr1996@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            //message.setText(text);
            String htmlText = ("<div style=\"color:red;\">text</div>");
            //messageBodyPart.setContent(htmlText, "text/html");

            /*String message = "<i>Greetings!</i><br>";
            message += "<b>Wish you a nice day!</b><br>";
            message += "<font color=red>Duke</font>";*/
            
            //message.setContent(text, "text/html; charset=UTF-8");
            message.setContent("<b>Tên Sự kiện: </b> " + tensukien + "<br><b>Ngày bắt đầu: </b> " + ngaybatdau + "<br><b>Giờ bắt đầu: </b> " + giobatdau +  "<br><b>Ngày kết thúc: </b> " + ngayketthuc + "<br><b>Giờ kết thúc: </b> " + gioketthuc + "<br><b>Địa điểm: </b> " + diadiem + "<br><b>Mô tả: </b> " + mota, "text/html; charset=UTF-8");
            Transport.send(message);
        } catch (MessagingException e) {
            return false;
        }
        return true;
}
	public static void main(String[] args)
	{
		//System.out.println(sendMail("14110353@student.hcmute.edu.vn", "Lịch cá nhân", "Xin chào"));
	}

}
