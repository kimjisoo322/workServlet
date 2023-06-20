<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라메터 값 가져오기</title>
</head>
<body>
<%
	// 한글깨짐처리 => 일괄적으로 web.xml의 설정파일에서 설정할 것! 
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	
	// 체크박스는 여러개가 선택될 수 있기 때문에 배열형태로 받아서 처리해야함 
	String[] favo = request.getParameterValues("favo");
	
	// 줄바꿈이 있는 경우 \r\n -> <br>
	String intro = request.getParameter("intro");
	String favoStr = "";
	out.print(Arrays.toString(favo));
	
	
%>
<ul>
	<li>아이디 : <%= id %></li>
	<li>성별 : <%=sex %></li>
	<li>관심사항 : <%=Arrays.toString(favo) %></li>
	
	
	<!-- 줄바꿈처리 -->
	<li>자기소개 : <%=intro.replace("/r/n", "<br>") %> </li>
	
</ul>

</body>
</html>