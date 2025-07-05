<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="dto.Coffee"%>
<%@ page import="dao.CoffeeRepository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("coffees.jsp");
		return;
	}

	CoffeeRepository dao = CoffeeRepository.getInstance();
	Coffee coffee = dao.getCoffeeById(id); 
	if (coffee == null) {
		response.sendRedirect("exceptionNoCoffeeId.jsp");
		return;
	}


	ArrayList<Coffee> cartList = (ArrayList<Coffee>) session.getAttribute("cartlist");
	if (cartList == null) {
		response.sendRedirect("cart.jsp");
		return;
	}

	Iterator<Coffee> it = cartList.iterator();
	while (it.hasNext()) {
		Coffee item = it.next();
		if (item.getId().equals(id)) {
			it.remove();
			break;  // 하나만 삭제한다면 break
		}
	}

	response.sendRedirect("cart.jsp");
%>
