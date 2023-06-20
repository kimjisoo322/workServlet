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
	<h1> forward 페이지</h1>
	<h3> RequestMain 파일의 리퀘스트 영역 속성 읽기 </h3>
	
<%-- 	<%
		Person p = (Person)request.getAttribute("pagePerson");
	%>
	
	attribute 정보 출력 
	<ul>
	<li><%= p.getName()%>, <%= p.getAge()%></li>
	</ul> --%>
	<h3> forward 된 페이지의 속성 값 읽어서 출력</h3>
	파라메터 정보 출력
	<!-- 파라메터는 한글깨짐 유의 --> 
	<%request.setCharacterEncoding("UTF-8");%>
	<ul>
		<li><%= request.getParameter("name")%>, <%= request.getParameter("age")%></li>
	</ul>
	
</body>
</html>