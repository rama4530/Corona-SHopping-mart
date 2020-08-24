<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	HttpSession sessions = request.getSession(false);
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Cart Information</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
</head>
<body>
	<header> <nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: tomato">
	<div>
		<a href="index.jsp" class="navbar-brand"> Home Page </a>
	</div>
	<div>
		<a href="product-list.jsp" class="navbar-brand"> Continue shopping
		</a>
	</div>

	</nav> </header>
	<br>
		<div class="row">

			<div class="container">

				<form action="OrderController">
					<h3 class="text-center">Order summary</h3>
					<br>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Option</th>
									<th>ID</th>
									<th>Name</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Sub Total</th>
								</tr>
							</thead>
							<tbody>

								<c:set var="s" value="0"></c:set>
								<c:forEach var="it" items='<%=sessions.getAttribute("cart")%>'>
									<c:set var="s" value="${s+it.p.productPrice*it.quantity}"></c:set>
									<tr>
										<td><a
											href="ShoppingCartController?id=${it.p.id}&action=delete" />delete
											item</td>
										<td><c:out value="${it.p.id}" /></td>
										<td><c:out value="${it.p.productName }" /></td>
										<td><c:out value="${it.p.productPrice}" /></td>
										<td><c:out value="${it.quantity}" /></td>
										<td><c:out value="${it.p.productPrice*it.quantity}" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan=5 align="right">Sum</td>
									<td><c:out value="${s}" /></td>
								</tr>
								<!-- } -->
							</tbody>

						</table>
						<button type="submit" class="btn btn-success">Place Order</button>
				</form>
			</div>
		</div>
</body>
</html>