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
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie: cookies){
				if(cookie.getName().equals("UserName")){
					UserName = cookie.getValue();
				}
				if(cookie.getName().equals("JSESSIONID")){
					SessionId = cookie.getValue();
				}
			}
		}
		
		//MUST READ - doing && operation here is not right, since we can have a new session id even when username is null. rather use || to be safe, even 
		//if new session id gets created, username will be numm so will get redirected.
		if(UserName == null || SessionId == null){
			String Path = request.getContextPath();
			response.sendRedirect("Login.jsp");
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