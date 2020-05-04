<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int num = 1;
	String numParam = request.getParameter("num");
	if (numParam != null) {
		num = Integer.parseInt(numParam);
	}
%>
<html>
<head>
<meta charset="UTF-8">
<style>
input { margin: 5px 5px; }
input[text] { width: 100px; }
button { padding: 5px; width: 50px; }
</style>
</head>
<body>
	<form>
		<div>
			<input
				type="radio" <%if (num == 1){%>checked<%}%> value="1" name="num">
				one
			</input>
			<input
				type="radio" <%if (num == 2){%>checked<%}%> value="2" name="num">
				two
			</input>
			<input
				type="radio" <%if (num == 3){%>checked<%}%> value="3" name="num">
				three
			</input>
		</div>
		<%
		String text = "";
		switch (num) {
		case 1:
			text = "one";
			break;
		case 2:
			text = "two";
			break;
		case 3:
			text = "three";
			break;
		default:
		}
		%>
		<input type="text" value=<%= text %> />
		<br/>
		<button type="submit">Ok</button>
	</form>
</body>
</html>