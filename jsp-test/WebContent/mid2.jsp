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
</head>
<body>
	<form>
		<div>
			<input
				type="radio" checked=<%=num == 1 ? true : false%> value="1" name="num">
				one
			</input>
			<input
				type="radio" checked=<%=num == 2 ? true : false%> value="2" name="num">
				two
			</input>
			<input
				type="radio" checked=<%=num == 3 ? true : false%> value="3" name="num">
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
		<button type="submit">Ok</button>
	</form>
</body>
</html>