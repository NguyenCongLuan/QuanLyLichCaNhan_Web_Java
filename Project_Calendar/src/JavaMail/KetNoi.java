package JavaMail;

/*import DBAccess.ClassNotFoundException;
import DBAccess.Connection;
import DBAccess.SQLException;
import DBAccess.String;*/
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class KetNoi {
	public static Connection getConnection() throws SQLException {
	    Connection conn;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String URL = "jdbc:mysql://localhost:3306/QuanLyLichCaNhan";
			conn= DriverManager.getConnection(URL,"root","trongtri96");
		} catch (ClassNotFoundException e) {
			System.out.println(e);
			return null;
		}
		
		return conn;
		
}

}
