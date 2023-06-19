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
	int num1 = 3;
	pageContext.setAttribute("num2", 4);
	pageContext.setAttribute("num3", "5");
	pageContext.setAttribute("num4", "8");
%>

<h3> 변수 선언 및 할당 </h3>
<p>스크립틀릿에서 선언한 변수 : ${num1}</p>	 <!--  영역에 저장된 것이 아니기 때문에 출력x  -->
<p>페이지영역에 저장된 변수 : ${num2}</p>
<p>페이지영역에 저장된 변수 : ${num3}</p>
<p>페이지영역에 저장된 변수 : ${num4}</p>
<!-- 값을 대입후 바로 출력 -->
<p>변수 할당 및 즉시출력 : ${num1 =7 }</p>
<!--  값을 대입만 하고 출력시키지 않는 방법 ;'' -->
<p>변수 할당 및 별도출력 : ${num2 = 13;'' } => ${num2 }</p>

num1 = ${num1 }, num2 = ${num2 }, num3= ${num3 }, num4 = ${num4 }

<h3>산술연산자</h3>
 <!--  표현언어(el)을 이용하면 산술연산시 자동으로 숫자로 변환 -->
num1 + num2 = ${num1 + num2}<br>
num1 - num2 = ${num1 - num2 }<br>
num1 * num2 = ${num1 * num2 }<br>
num1 / num2 = ${num1 / num2 }<br>
 
 <!-- div : 나누기 (문자 형태의 연산자)  -->
 num3 / num4 = ${num3 div num4}<br>
 <!-- mod : 나머지 (문자 형태의 연산자)  -->
 num3 mod num4 = ${num3 mod num4 }<br>
 
 <h3> + 연산자는 덧셈만 가능 </h3>
  num1 = ${num1 } <br>
  num1 + "34" : ${num1 + "34" } <br>
  num1 + "이십" : \${num2 + "이십" }
  
  
  <h3> 비교 연산자</h3>
  <!--  문자 형태의 연산자  -->
  num4 > num3 : ${num4 gt num3} <br />
  num1 < num3 : ${num1 lt num3} <br />
  num2 >= num4 : ${num2 ge num4 }<br />
  
  <!--  문자 형태의 연산자를 사용해 코드를 좀더 직관적으로 작성 가능 -->
  num1 == num4 : ${num1 eq num4 }
  
  <h3> 논리 연산자</h3>
  
  num3 <= num4 && num3 == num4 : ${num3 le num4 and num3 eq num4 } <br />
  num3 >= num4 || num3 != num4 : ${num3 ge num4 or num3 ne num4 } 
  

</body>
</html>














