<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%
	request.setAttribute("page", "값");
	request.setAttribute("pagePerson", new Person("민지", 20));
%>

	<h2>request 영역의 속성값 읽어오기</h2>

	<%
		String r_str = (String)request.getAttribute("page");
		Person r_person = (Person)request.getAttribute("pagePerson");	
	%>
	
	<ul>
		<li> <%= r_str %></li>
		<li> <%= r_person.getName() %>, <%= r_person.getAge() %></li>
	</ul>
	<!--  저장된 값은 값이 출력/ 없는 값은 null이 나옴 -->
	
	<h2> request 영역의 속성값 삭제하기</h2>
	 --%>


	<h2>forward된 페이지에서 request 영역 속성 값 읽기</h2>
	<%
		request.getRequestDispatcher("RequestForward.jsp?name=민지&age=20").forward(request, response);
	%>
</body>
</html>