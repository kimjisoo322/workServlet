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
 	/*   JSP : 화면 구성, 페이지 반환 / 서블릿 : 요청받음(컨트롤러) / JAVA : 요청을 받아 로직 처리 (DB)
 		  xml 에서 작성한 url가 읽어지면 경로에 따라 서블릿 실행 -> sendredirect로 helloServlet.jsp로 요청받아져 이 페이지 실행
	 	
 	*/
 %> 
 
 표현식 : <%=request.getAttribute("message") %> <br>
  EL  : ${requestScope.message }<br>
  
  <!--  ./  : 현재 경로  -->
  <!--  13서블릿/HelloServlet.do -->
  <a href="./HelloServlet.do"> HelloServlet.do바로가기 </a> <br>
  <a href="${pageContext.request.contextPath}/13서블릿/AnnotationMapping.do"> AnnotationMapping.do 바로가기</a>
</body>
</html>