<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

String realFolder = "C:\\jsp-workspace\\coffeeMarket\\src\\main\\webapp\\resources\\images";
String encType = "utf-8";
int maxSize = 5 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

String coffeeId = multi.getParameter("Id");
String name = multi.getParameter("name");
String unitPrice = multi.getParameter("unitPrice");
String origin = multi.getParameter("origin");
String releaseDate = multi.getParameter("releaseDate");
String description = multi.getParameter("description");
String unitsInStock = multi.getParameter("Stock");

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

// 데이터 검증 및 기본값 처리
int price = 0;
long stock = 0;
try {
    price = (unitPrice == null || unitPrice.isEmpty()) ? 0 : Integer.parseInt(unitPrice);
    stock = (unitsInStock == null || unitsInStock.isEmpty()) ? 0 : Long.parseLong(unitsInStock);
} catch (Exception e) {
    out.println("숫자 파싱 오류: " + e.getMessage());
}

PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // 기존 데이터 확인
    String sql = "SELECT * FROM COFFEE WHERE id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, coffeeId);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        if (fileName != null) {
            sql = "UPDATE COFFEE SET name=?, unitPrice=?, description=?, origin=?, unitsInStock=?, releaseDate=?, fileName=? WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setInt(2, price);
            pstmt.setString(3, description);
            pstmt.setString(4, origin);
            pstmt.setLong(5, stock);
            pstmt.setString(6, releaseDate);
            pstmt.setString(7, fileName);
            pstmt.setString(8, coffeeId);
            pstmt.executeUpdate();
        } else {
            sql = "UPDATE COFFEE SET name=?, unitPrice=?, description=?, origin=?, unitsInStock=?, releaseDate=? WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setInt(2, price);
            pstmt.setString(3, description);
            pstmt.setString(4, origin);
            pstmt.setLong(5, stock);
            pstmt.setString(6, releaseDate);
            pstmt.setString(7, coffeeId);
            pstmt.executeUpdate();
        }
    }
    
    response.sendRedirect("editcoffee.jsp?edit=update");

} catch (Exception e) {
    out.println("오류 발생: " + e.getMessage());
    e.printStackTrace(new java.io.PrintWriter(out));
} finally {
    if (rs != null) try { rs.close(); } catch (Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
    if (conn != null) try { conn.close(); } catch (Exception e) {}
}
%>
