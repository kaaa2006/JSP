<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");


	String filename = "";

	String realFolder = application.getRealPath("/resources/images");
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	String encType = "utf-8"; //인코딩 타입
	

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());


	String bookId = multi.getParameter("Id");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String origin = multi.getParameter("origin");
	String releaseDate = multi.getParameter("releaseDate");	
	String description = multi.getParameter("description");	
	
	String unitsInStock = multi.getParameter("unitsInStock");

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	
	int price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);	
	
	
	PreparedStatement pstmt = null;	
	
	String sql = "insert into COFFEE values(?,?,?,?,?,?,?,?)";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5, origin);
	pstmt.setLong(6, stock);
	pstmt.setString(7, releaseDate);	
	pstmt.setString(8, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();

	response.sendRedirect("coffees.jsp");

%>