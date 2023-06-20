<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c: if 태그</title>
</head>
<body>
<%
	/*
			if (반환타입 boolean)
			  : 단일 조건문을 주로 처리. else문이 없다는 단점
			   => c:if 태그를 이용시, 표현언어와 함께 사용하기! ! 
	 */
%>
	<!-- 
		test : if문에서 사용할 조건 지정(표현언어 사용가능)
		var  : 조건의 결과를 저장할 변수명
		scope : 변수가 저장될 영역 
	 -->

<h4> JSTL의 IF 태그로 짝수/ 홀수 판단하기</h4>
	<c:set var = "number" value ="101"></c:set>
	
	<c:if test="${number mod 2 eq 0}" var = "result" >
		<!--  조건이 참인 경우 실행됨 (false면 출력x) -->
		${number } 은 짝수입니다.<br>
	</c:if>	
	결과 : ${result}


<h4>문자열 비교와 else구문 흉내내기 (if문이 else가 없기 때문에)</h4>

	<c:if test="${not result}" var= "result2">
		 ${number }은 홀수입니다.
	</c:if>
	
	결과2 : ${result2 }

<h4> 문자열 비교와 else 구문 흉내내기</h4>
	<!--  문자열 변수 선언 -->
	<c:set var = "str" value ="JAVA"></c:set>
	
	<c:if test="${str eq 'JAVA'}" var = "result3">
		${str }은 JAVA입니다. <br>
	</c:if>
	
	<c:if test="${not result3 }" var = "result4">
		${str }은 JAVA가 아닙니다.
	</c:if>

<h4> 조건식 주의사항</h4>	
	<!-- 표현언어(EL)을 사용하지 않은 경우 -->
	<c:if test="100" var = "result4">
		일반값을 입력 : false 반환됨
	</c:if>
	
	일반값 입력 : ${result4 } <br>

	<c:if test="tRue" var = "result5">
		대소문자 구분없이 "tRue" 인 경우 true <br>
	</c:if>
	대소문자 구분없 : ${result5 } <br>
	
	<c:if test=" ${true}" var = "result6">
		공백이 삽입된 경우 : false <br>
	</c:if>
	공백이 삽입된 경우 (쌍따옴표안) : ${result6 }
	
</body>
</html>








