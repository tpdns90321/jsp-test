<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.*, java.util.List" %>
<%
List<Book> books = BookDAO.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
  div.container { width: 600px; margin: 50px auto; }
  thead th { background-color: #eee; }
  table{ border-collapse: collapse; width: 100%; }
  td, th { padding: 4px; border: 1px solid lightgray; }
  td:nth-child(4) { text-align: center; }
</style>
</head>
<body>
<h3>책 목록</h3>
<table>
	<thead>
		<tr>
			<td>ID</td>
			<td>제목</td>
			<td>저자</td>
			<td>카테고리</td>
			<td>가격</td>
			<td>출판사</td>
		</tr>
	</thead>
	<tbody>
		<% for (Book book: books) { %>
		<tr>
			<td><%= book.getId() %></td>
			<td><%= book.getTitle() %></td>
			<td><%= book.getAuthor() %></td>
			<td><%= book.getCategoryName() %></td>
			<td><%= book.getPrice() %></td>
			<td><%= book.getPublisher() %></td>
		</tr>
		<% } %>
	</tbody>
</table>
</body>
</html>