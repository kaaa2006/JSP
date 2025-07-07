<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>


<html>
<head>
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>원두 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 커피를 삭제합니다!!") == true)
			location.href = "./deleteCoffee.jsp?id=" + id;
		else
			return;
	}
</script>

</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">원두 편집</h1>
        <p class="col-md-8 fs-4">CoffeeEditing</p>      
      </div>
    </div>
    <%@ include file="dbconn.jsp" %>
     <div class="row align-items-md-stretch   text-center">
	<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from COFFEE";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
      
	
	
     	<div class="col-md-4">
       		<div class="h-100 p-2 round-3">		
       		    <img src="./resources/images/<%=rs.getString("filename")%>" style="width: 250; height:350" />	
				<p><h5><b><%=rs.getString("name")%></b></h5>
				<br> <%=rs.getString("origin")%> | <%=rs.getString("unitPrice")%>원
				<p> <%=rs.getString("description").substring(0,60)%>....
				<p><%=rs.getString("unitPrice")%>원
				<p><%
						if (edit.equals("update")) {
					%>
					<a href="./updateCoffee.jsp?id=<%=rs.getString("id")%>" class="btn btn-success" role="button"> 수정 &raquo;></a>
					
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("id")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
					<%
						}
					%>	
			</div>	
		</div>			
		<%
			}
			 
              if (rs != null)
                  rs.close();
              if (pstmt != null)
                  pstmt.close();
              if (conn != null)
                  conn.close();
		%>
	
		</div>	
		<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>