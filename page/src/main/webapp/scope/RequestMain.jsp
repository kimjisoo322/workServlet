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
<%
	request.setAttribute("request_str", "request영역에 문자열을 저장");
	request.setAttribute("request_person", new Person("하니", 22));
%>

	<h2>request 영역의 속성값 읽어오기</h2>

	<%
		String r_str = (String)request.getAttribute("request_str");
		Person r_person = (Person)request.getAttribute("request_person");
		String r_int = (String)request.getAttribute("request_int");		
	%>
	
	<ul>
		<li> <%= r_str %></li>
		<li> <%= r_person.getName() %>, <%= r_person.getAge() %></li>
		<li> 없는 값: <%= r_int %></li>
	</ul>
	<!--  저장된 값은 값이 출력/ 없는 값은 null이 나옴 -->
	
	
	<h2> request 영역의 속성값 삭제하기</h2>
  
	<%
		request.removeAttribute("request_str");
		request.removeAttribute("request_int");
	%>
	
		str 삭제 <%=request.removeAttribute("request_str") %>


	
	<h2>forward된 페이지에서 request 영역 속성 값 읽기</h2>
	<%
		//request.getRequestDispatcher("RequestForward.jsp").forward(request, response);
		request.getRequestDispatcher("RequestForward.jsp?name=하니&age=22").forward(request, response);
	
	%>
</body>
</html>