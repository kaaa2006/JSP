<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<c:set var="sessionId" value="${sessionScope.sessionId}" />

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://192.168.111.102:3306/coffee"
	driver="com.mysql.jdbc.Driver" user="coffeeMarket" password="2222" />

<c:if test="${not empty sessionId}">
  <sql:update dataSource="${dataSource}" var="resultSet">
    DELETE FROM member WHERE id = ?
    <sql:param value="${sessionId}" />
  </sql:update>

  <c:if test="${resultSet >= 1}">
    <c:redirect url="logoutMember.jsp" />
  </c:if>
</c:if>

<c:if test="${empty sessionId}">
  <c:redirect url="login.jsp" />
</c:if>
