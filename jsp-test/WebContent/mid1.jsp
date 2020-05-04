<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
int dan = 0;
String danParam = request.getParameter("dan");
if (danParam != null) {
	dan = Integer.parseInt(danParam);
}
%>
<html>
<head>
<meta charset="UTF-8">
<style>
input { width: 100px; }
button { padding: 5px; width: 50px; }
table, td, tr {
	border-collapse: collapse;
	border: 1px solid;
	width: 100px;
	padding: 5px;
}
</style>
</head>
<body>
	<form>
		<input type="text" name="dan" value=<%= dan %> />
		<button type="submit">단</button>
	</form>
	<table>
		<% for (int i = 1; i < 10; i++ ) { %>
			<% String text = dan + " x " + i + " = " + (dan * i); %>
			<tr><td><%= text %></td></tr>
		<% } %>
	</table>
</body>
</html>