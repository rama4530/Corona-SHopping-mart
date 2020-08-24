<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
table {
	border: 1px solid black;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">Please provide below details</h1>
	<form method="post" action="product-list.jsp">

		<table align="center">

			<tbody>
				<tr>
					<td>Name</td>
					<td><input type="text" name="pname" /></td>
				</tr>
				<tr>
					<td>Email Id</td>
					<td><input type="text" name="pemail" /></td>
				</tr>
				<tr>
					<td>Adress</td>
					<td><input type="text" name="paddress" /></td>
				</tr>

				<tr>
					<td></td>
					<td align="center"><input type="submit" value="submit" /></td>
				</tr>
			</tbody>
		</table>

	</form>

</body>
</html>