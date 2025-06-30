<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="./resources/css/bootstrap.min.css" rel="stylesheet"/>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
	crossorigin="anonymous"></script>

<title>도서 아이디 오류</title>
</head>
<body>

	<div class="container py-4">

		<%@ include file="menu.jsp" %> 
		<!-- 메뉴바를 외부파일로 연결 -->
		

		<div class="jumbotron">
			<div class="container">
				<h1 class="display-5 fw-bold">요청하신 페이지를 찾을수 없습니다.</h1>
			
			</div>
		</div> <!-- 중간타이틀 : 상단 box -->
		<div class="container">
		
		<p> <%=request.getRequestURL() %></p>
		<p> <a href="Books.jsp"class="btn btn-secondary"> 도서목록 &raquo;</a>
		</div>
		</div>
		
	   
	   	
		<%@ include file="footer.jsp" %>

	</div>

</body>
</html>