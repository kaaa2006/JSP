package mvc.database;
import java.sql.*;

public class DBConnection {
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        String url = "jdbc:mysql://192.168.111.102:3306/coffee"; // DB 주소, 포트, DB명 확인!
         String user = "coffeeMarket";
        String password = "2222"; // 실제 비밀번호
        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 최신 드라이버명
        return DriverManager.getConnection(url, user, password);
    }
    
}
