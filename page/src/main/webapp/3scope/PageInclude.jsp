<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <!-- include 된 파일에서 page 영역 읽어오기 -->	
	<ul>
		<li>String : <%=pageContext.getAttribute("page") %></li>
		<li>int : <%=pageContext.getAttribute("page_int") %></li>
		<li>Person 이름 : <%=pageContext.getAttribute("pagePerson")%></li>
	</ul>
</body>
</html>