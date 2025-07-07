<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Coffee"%>
<%@ page import="dao.CoffeeRepository"%>

<%@ page import="java.sql.*"%>

<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>커피 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("이 원두를 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>

</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp"%>

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">원두 정보</h1>
				<p class="col-md-8 fs-4">Coffee Info</p>
			</div>
		</div>
		<%@ include file="dbconn.jsp"%>
		<%
		String Id = request.getParameter("id");
		/* BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById(id); */

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from COFFEE where ID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, Id);
		rs = pstmt.executeQuery();
		if (rs.next()) {
		%>
		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("FILENAME")%>"
					style="width: 70%">
			</div>
			<div class="col-md-6">
				<h3>
					<b><%=rs.getString("NAME")%></b>
				</h3>
				<p><%=rs.getString("DESCRIPTION")%>%>
				<p>
					<b>도서코드 : </b><span class="badge text-bg-danger"> <%=rs.getString("ID")%></span>
					<b>원산지</b> :
					<%=rs.getString("ORIGIN")%>
				<p>
					<b>출판일</b> :
					<%=rs.getString("RELEASEDATE")%>
				<p>
				
				<h4><%=rs.getString("UNITPRICE")%>원
				</h4>
				<p>
				<form name="addForm"
					action="./addCart.jsp?id=<%=rs.getString("ID")%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 원두
						주문&raquo;</a> <a href="./cart.jsp" class="btn btn-warning">
						장바구니&raquo;</a> <a href="./coffes.jsp" class="btn btn-secondary">
						커피 목록&raquo;</a>
				</form>
			</div>
		</div>
		<%
		} // IF문 종료
		%>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>