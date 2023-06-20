<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c: choose태그</title>
</head>
<body>
<%
	/*
		choose
		: 다중 조건을 처리할 때 사용. 하위에 when~otherwise 태그가 있음
	*/
%>
<h4> choose 다중 조건문 </h4>

<h4> 홀짝판단하기 </h4>
	<c:set var = "number" value = "101"/>

	<c:choose>
		<c:when test="${number mod 2 eq 0 }">
			${number}는 짝수입니다.
		</c:when>
		<c:otherwise>
			${number}는 홀수입니다.
		</c:otherwise>
	</c:choose>
	
<h4> 국, 영, 수 점수를 입력해 평균을 내어 학점을 출력</h4>
 <p> 90보다 ge a학점 
 	 80보다 크거나 같으면 b학점
 	 70보다 크거나 같으면 c학점
 	 60보다 크거나 같으면 d학점
 </p>
 
 <form method = "post" >
 	국어 : <input type= "text" name ="kor"/> <br>
 	영어 : <input type= "text" name ="eng"/><br>
 	수학 : <input type= "text" name ="math"/>
 	<input type="submit" value = "학점발표"/>
 </form>

 	
 	<!--  모든 과목의 점수가 입력되었는지 확인 (비어있지 않으면 실행) -->
 	<c:if test="${not (empty param.kor or empty param.eng or empty param.math) }">
 	<!--  점수 출력 -->
 		 	국어점수 : ${param.kor } 
 			영어점수 : ${param.eng }
 			수학점수 : ${param.math}
 	
 	<!--  평균 점수 계산 -->
 	<c:set var = "evg" value ="${(param.kor+ param.eng+ param.math) / 3 }"/> <br>
 	 국, 영, 수 평균 : ${evg} <br>
 	</c:if>
 	
	<c:choose>
		<c:when test="${evg ge 90 }">A학점</c:when>
		<c:when test="${evg ge 80 }">B학점</c:when>
		<c:when test="${evg ge 70 }">C학점</c:when>
		<c:when test="${evg ge 60 }">D학점</c:when>
		<c:otherwise>F학점</c:otherwise>
	</c:choose>
	
	
</body>
</html>






