<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼값전송하기</title>
</head>
<body>
<%
	/*
	request.getParameter("name 속성명")
	${param.name속성명}
	
	request.getParameterValues("name 속성명")
	${paramValues.name속성명[배열번호]}
	 => 체크박스는 선택된 checked 내용만 넘어옴!
	  => null에 대한 오류 처리없이 사용가능!
	*/
	
%>
	<h2> EL 폼값 받기</h2>


	<ul>
		<li>이름 : ${param.name } </li>
		<li>성별 : ${param.gender }</li>
		<li>학력 : ${param.grade }</li>
		<li>관심사항 : ${paramValues.inter[0] } 
				 ${paramValues.inter[1] }
				  ${paramValues.inter[2] }
		  		 ${paramValues.inter[3] }</li>
	</ul>

	
</body>
</html>