<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage = "true"
    trimDirectiveWhitespaces="true"%>    
    <!-- isErrorPage : true 지정 -> errorPage 라고 인지(exception 객체가 생성됬을 때 오류)
         trimDirectiveWhitespaces : true 지정 -> page 지시어로 생성된 불필요한 공백을 제거  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>서비스 중 일시적인 오류가 발생하였습니다.</h1>
<p>
	오류 코드 		: E404<br>
	오류 명		: <%=exception.getClass().getName() %><br>
	오류 메세지		: <%=exception.getMessage() %>
</p>
</body>
</html>