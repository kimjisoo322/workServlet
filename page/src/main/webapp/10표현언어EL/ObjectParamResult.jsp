<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 객체 매개변수 출력 </h2>
	<%
		/*
			표현언어를 이용하면 형변환이 필요없이 파라메터를 읽어올 수 있음
			별도의 null처리 없어도 오류발생x! 
			객체를 사용하기 위해 import만 해주면 됨
		*/
	%>
	<ul>
		<li>Member 객체 : <p>아이디 ${memberObj.id}, 이름 : ${memberObj.name} </p></li>
		<li>String 객체 : <p> ${requestScope.stringObj} </p></li>
		<li>String 객체2 : <p> ${stringObj} </p></li>
		<li>Integer 객체 : <p>  ${integerObj} </p> </li>
	</ul>
	
	
	<h2> 매개변수로 전달된 값 읽기</h2>
	<ul>
		<li>${param.firstNum }</li>
		<li>${param.secondNum }</li>
		<!--  중괄호 안에서 연산 가능! -->
		<li> 연산 = { 중괄호 안에서 } </li>
		<li>${param.firstNum + param.secondNum}</li>
		<li>${param.firstNum } + ${param.secondNum } = ${param.firstNum + param.secondNum}</li>
	
		<li>대괄호 출력</li>
		<li>${param['firstNum']}</li>
		<li>${param["secondNum"]}</li>
	</ul>
</body>
</html>