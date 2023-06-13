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
	<!-- 
	[사용방법]
	setAttribute(String name, Object value)
	 : 각 영역에 속성을 저장 / object타입을 받고 있어서 모든 타입이 저장 가능
	  
	getAttribute(name)
	 : 영역에 저장된 속성값을 얻어옴 / object 형태로 자동 형변환 되어 저장되므로 원래 타입으로 형변환 후 사용가능 
 -->

	<%
	pageContext.setAttribute("page", "페이지영역(스코프)");
	pageContext.setAttribute("page_int", 10000);
	pageContext.setAttribute("pagePerson", new Person("민지", 20));
	%>
	
	<h2>page영역의 속성 값 읽기</h2>
	
	<%
		// object 타입으로 반환되므로 형변환이 필요!
		String page_str = (String)pageContext.getAttribute("page");
		int page_int = (Integer)pageContext.getAttribute("page_int");
		Person page_person = (Person)pageContext.getAttribute("pagePerson");
	%>
	<ul>
		<li>String : <%=page_str %></li>
		<li>int : <%=page_int %></li>
		<li>Person 이름 : <%=page_person.getName()%> , Person 나이:<%=page_person.getAge()%></li>
	</ul>
	
	<!-- (현재 페이지에서 페이지가 생성된 이후 언제까지 값이 유지되는지 ===> include했을 경우만 값 유지) -->
	<h2> include 된 파일에서 page 영역 읽어오기</h2>	
	<p>  include 지시어로 감싼 JSP파일은 포함관계를 가지고 있어 같은 페이지로 인식하여 페이지 영역이 공유됨!</p>
	<%@ include file ="PageInclude.jsp" %>

	<h2> 페이지 이동 후 page 영역 읽어오기</h2>
	<p> 링크를 이용해서 페이지를 다시 요청하게 되면 페이지 영역이 초기화 됨</p>
	<a href = "PageLocation.jsp">PageLocation.jsp 바로가기</a>
	<!--  페이지를 벗어나면 값이 공유되지 않음. -->
</body>
</html>