<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - include</title>
</head>
<body>
<%
	/*
		액션태그 : JSP의 표준 태그로, 페이지 사이에서 이동을 제어하거나 자바빈을 생성할 때 주로 사용
		
		용도에 따른 액션 태그 종류
		<jsp:include> : 외부 파일을 현재 파일에 포함시킴
		<jsp:forward> : 다른 페이지로 요청을 넘김
		<jsp:useBean>, <jsp:setProperty>, <jsp:getProperty> : 자바빈즈를 생성하고 값을 설정/추출
		<jsp:param> : 다른 페이지로 매개변수를 전달. <jsp:include>, <jsp:forward> 액션 태그와 함께 사용
	*/
	
	pageContext.setAttribute("pAttr", "동명왕");
	request.setAttribute("rAttr", "온조왕");
%>
	<h2> 지시어의 액션태그 동작 방식 비교 </h2>
	<!--  지시어 방식 -->
	<h3>지시어 방식</h3>
	 <!--  include하면 페이지를 가져와서 그 페이지 안에 있는 변수들 사용이 가능 -->
	<%@include file = "inc/OuterPage1.jsp" %>
	<p>외부 파일에 선언한 변수 : <%=newVar1%></p>
	
	<h3>액션태그 방식</h3>
	<!--  액션태그 방식		 : 페이지 영역이 공유되지 않고 외부파일에서 생성된 변수를 사용할 수 없음. --> 
	<jsp:include page ="inc/OuterPage2.jsp"/>
	<p>외부 파일에 선언한 변수 : <%--=newVar2 --%></p>
	
</body>
</html>