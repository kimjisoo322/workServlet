<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4> url 태그를 이용해서 링크 걸기 </h4>
	<!-- 
		c:url
			 - 지정한 경로와 매개변수를 이용해서 컨텍스트 루트를 포함한 url을 생성
			   a 태그의 href 속성이나 form태그의 action 속성에 이용할 수 있음
	 
	 	value : 경로 
	 	  var : 변수명
	 -->
	 
	<a href="${pageContext.request.contextPath}/11JSTL/inc/OtherPage.jsp">페이지바로가기</a><br>
	
	<c:url value = "/11JSTL/inc/OtherPage.jsp" var="url"></c:url>
	<a href="${url }">url 태그를 이용한 바로가기 </a>
	
	<form action="${url}">
		<button>전송</button>
	</form>
	
	<h4> 예외처리 </h4>
	<!-- c : catch 태그 
	 			예외가 발생하면 지정한 변수에 에러메세지가 저장되어 전달 -->
	<%
		int num1 = 100;
	%>
	<c:catch var = "eMessage">
	<%
		int res = num1/0;
	%>
	</c:catch>
	예외내용 : ${eMessage }	
	
</body>
</html>