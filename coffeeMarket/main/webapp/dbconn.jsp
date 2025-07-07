<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
    Connection conn = null;
    try {
        String url = "jdbc:mysql://192.168.111.102:3306/coffee";
        String user = "coffeeMarket";
        String password = "2222";
        Class.forName("com.mysql.cj.jdbc.Driver"); // 최신 드라이버명!
        conn = DriverManager.getConnection(url, user, password);
    } catch (SQLException ex) {
        out.println("데이터베이스 연결이 실패되었습니다.<br>");
        out.println("SQLException: " + ex.getMessage());
    } catch (Exception ex) {
        out.println("Class.forName 오류: " + ex.getMessage());
    }
%>
