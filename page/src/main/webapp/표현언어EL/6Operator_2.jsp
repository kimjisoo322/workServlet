<%@page import="java.util.ArrayList"%>
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
	pageContext.setAttribute("num1", 9);
	pageContext.setAttribute("num2", "10");
	
	// empty 연산자 
	// null, 빈문자열, 길이가 0인 배열, 사이즈가 0인 컬렉션인 경우 true를 반환
	pageContext.setAttribute("nullStr", null);
	pageContext.setAttribute("emptyStr", "");
	
	pageContext.setAttribute("lengthZero", new Integer[0]);
	pageContext.setAttribute("sizeZero", new ArrayList());
	
%>
<!--  주로, 리스트 출력시 리스트가 비었는지 확인하는 용도로 사용  -->
<h2> Empty 연산자 </h2>
<ul>
	<li>empty nullStr ${empty nullStr }</li>
	<li>empty emptyStr ${empty emptyStr }</li>
	<li>empty lengthZero ${empty lengthZero }</li>
	<li>empty sizeZero ${empty sizeZero }</li>
	
	<!--  자바에서는 null을 조작하려 하거나 연산에 사용하면 NullPointerException이 발생
		 EL에서는 0으로 인식되어 예외가 발생하지 않음
	 -->
	 
	 <!--  값이 있는 num1, num2의 경우 false를 반환 -->
	<li>empty num1 ${empty num1 }</li>
	<li>empty num2 ${empty num2 }</li>

</ul>

<h2> 삼항연산자 </h2>
	<!--  조건 ? "true": "false" 
	     a=b ? true : false -->
num1 = ${num1 }, num2 = ${num2 }<br>
${num1 gt num2 ? "num1이 크다" : "num2가 크다."} 

<h2>null 연산</h2>
<!--  null이 연산에 사용될 경우 0으로 인식함 = -->
null + 10 : ${null + 10} <br>
nullStr + 10 : ${nullStr +10 } <br>
param.noVar > 10 : ${param.noVar > 10 }<br>

</body>

</html>
