<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 -request</title>
</head>
<body>
	
	<h2> 3. 요청 헤더정보 출력하기 </h2>
	<%
		// Enumeration : 객체들을 집합체 형태로 관리하게 해주는 인터페이스 
		// -> 컬렉션에서 사용됨  (list, set, map)
		// Iterator의 활용도가 가장 높다.

		Enumeration headers = request.getHeaderNames();
		
		// next()와 같음 : 다음 요소가 있으면 가져오고 없으면 종료 
		while(headers.hasMoreElements()){   
							// nextElement()의 타입은 object이기 때문에 string으로 변환 
			String headerName = (String)headers.nextElement();
			String headerValue = request.getHeader(headerName);
			
			out.print("헤더명 : " + headerName + 
					  "헤더값 : " + headerValue + "<br>");
		}
	%>
</body>
</html>