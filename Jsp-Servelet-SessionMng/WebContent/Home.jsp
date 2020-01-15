<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<% String Path = request.getContextPath(); %>
	Welcome Home !!!1 <br>
	<a href = "<%=Path %>/PublicController?action=Login">Login</a>  <br>
	<a href = "<%=Path %>/PublicController?action=About">About</a>  <br>
</body>
</html>