<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.*, java.util.List" %>
<%
List<Book> books = null;
String author = request.getParameter("author");
if (author != null) {
	books = BookDAO.findByAuthor(author);
} else {
	author = "";
	books = BookDAO.findAll();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
  div.container { width: 600px; margin: 50px auto; }
  thead tr { background-color: #eee; text-align: center; }
  table{ border-collapse: collapse; width: 100%; }
  td, th { padding: 4px; border: 1px solid lightgray; margin: 10px; }
  td:nth-child(4) { text-align: center; }
  input { margin: 5px; }
  button { padding: 5px; width: 70px; }
</style>
</head>
<body>
<h1>책 목록</h1>
<form>
	<div>
		저자: 
		<input type="text" placeholder="검색조건" value="<%= author %>" name="author" />
		<button type="submit">조회</button>
	</div>
</form>
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