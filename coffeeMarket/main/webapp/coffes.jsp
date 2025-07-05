<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    <title>커피 원두 목록</title>
</head>
<body>
<div class="container py-4">

    <%@ include file="menu.jsp" %>

    <div class="p-5 mb-4 bg-light rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">커피 원두 목록</h1>
            <p class="col-md-8 fs-4 mx-auto">다양한 산지의 커피 원두를 확인해보세요.</p>
        </div>
    </div>

    <%@ include file="dbconn.jsp" %>

    <div class="row text-center">
        <%
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                String sql = "SELECT * FROM COFFEE";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    String filename = rs.getString("filename");
                    String name = rs.getString("name");
                    String origin = rs.getString("origin");
                    int unitPrice = rs.getInt("unitPrice");
                    String description = rs.getString("description");
                    String id = rs.getString("id");

                    // 예외 방지용 설명 자르기
                    String shortDesc = (description != null && description.length() > 60)
                                        ? description.substring(0, 60) + "..."
                                        : description;
        %>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
                <img src="<%= request.getContextPath() %>/resources/images/<%= filename %>" 
                     class="card-img-top" alt="<%= name %>" 
                     style="height: 350px; object-fit: cover;">
                <div class="card-body">
                    <h5 class="card-title fw-bold"><%= name %></h5>
                    <p class="card-text text-muted"><%= origin %> | <%= String.format("%,d", unitPrice) %>원</p>
                    <p class="card-text"><%= shortDesc %></p>
                    <a href="./coffee.jsp?id=<%= id %>" class="btn btn-outline-primary">상세 정보 &raquo;</a>
                </div>
            </div>
        </div>
        <%
                } // end while
            } catch (Exception e) {
                out.println("<p class='text-danger'>에러 발생: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
            }
        %>
    </div>

    <%@ include file="footer.jsp" %>

</div>
</body>
</html>
