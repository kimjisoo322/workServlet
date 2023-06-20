<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키값 출력하기</title>
</head>
<body>
<!--  쿠키는 헤더에 넘어오고 헤더에 저장되는 값  -->
<h2> [쿠키값 확인하기]</h2>

<p>처음 접속시 저장된 쿠키가 없는 경우 빈페이지가 출력될 수 있다.</p>
<%
	// 객체의 경우 반드시 null 체크 (배열, 리스트, object 등) > 왜냐면 처음에는 값이 없을 수 있기때문에! 
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie cookie :cookies){
			 String name = cookie.getName();
			 String value = cookie.getValue();
			
			out.print("쿠키명 : " + name + "<br>" + "쿠키값 :" + value + "<br><br>");
		}
	}
%>
</body>
</html>