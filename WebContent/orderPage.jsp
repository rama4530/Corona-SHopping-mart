<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Order page</title>
</head>
<body>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<form action="orderPlaced.jsp">
					<fieldset class="form-group">
						<div>
							<table>
								<tr>

									<td><label>Provide Address :</label></td>
									<td><textarea name="address" rows="4" cols="50">
							</textarea></td>
									<td>
										<button type="submit" class="btn btn-success">Submit</button>
									</td>
								</tr>

							</table>
						</div>
					</fieldset>
				</form>
			</div>

		</div>
	</div>

</body>
</html>