<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Area</title>
</head>
<body>
	<% 
		String UserName = null;
		String SessionId = null;
		if(request.getSession().getAttribute("UserName") == null){
			response.sendRedirect("Login.jsp");
		}
		else{
			UserName = request.getSession().getAttribute("UserName").toString();
			SessionId = request.getSession().getId();
		}
	%>
	Welcome Member!!<br>
	<%=UserName %><br>
	<%=SessionId %><br>
	<form action="<%=request.getContextPath()%>/PrivateController" method="get">
		<input type="hidden" name="action" value="Destroy">
		<input type="submit" value ="LogOut">
	</form>
</body>
</html>