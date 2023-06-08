<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 오류가 발생하면 에러페이지를 보여줌 > Exception 예외발생 -->

<%
	// response 내장 객체로부터 에러코드를 확인 
	int status = response.getStatus();
	// 에러코드에 맞게 적절한 메세지를 출력
	if(status == 404){
		out.print("ERROR CODE : 404");
		out.print("<br>파일 경로를 확인해주세요.");
	}else if (status == 405){
		out.print("ERROR CODE : 405");
		out.print("<br>요청방식(method)를 확인해주세요.");
		// Error.java 파일인 servlet에서 get방식을 지웠을 때 에러발생 > method를 확인해주세요! 
	} else if (status == 500){
		out.print("ERROR CODE : 500");
		out.print("<br>관리자에게 문의해주세요.");
		// 500번 코드는 코드 오류로 인한 경우가 있다. 
	} else{
		
	}
%>

</body>
</html>