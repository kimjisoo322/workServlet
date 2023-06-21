
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formatting 태그</title>
</head>
<body>

<!-- 
	formatNumber
		var     : 변수명
		value   : 출력할 숫자
		pattern : 숫자패턴
		scope   : 영역
		
		type : 출력 양식을 설정 
			* percent : 퍼센트 / currency : 통화 / number : 기본값, 일반숫자 / *
		
		groupingUsed : 구분기호 사용여부
 -->

<h4> 숫자 포맷 </h4>
	<c:set var="num" value="12345"/>
	
	콤마출력 : <fmt:formatNumber value = "${num}"/> <br>
	콤마출력 안함 : <fmt:formatNumber value = "${num}" groupingUsed="false"/> <br>
	
	변수 저장 x 통화기호 o : <fmt:formatNumber value = "${num}" type="currency"/> <br>

	변수에 저장 : <fmt:formatNumber value = "${num}" var ="saveVar" type="currency" /> <br>
	변수에 저장된 값 출력 : ${saveVar} <br>
 	
 	통화기호 : <fmt:formatNumber  value = "777" type= "currency"/> <br>
	퍼센트 : <fmt:formatNumber value ="0.03" type="percent" /> <br>


<h4> 패턴을 지정해 숫자를 활용</h4>
	<p> 0 표현, #표현  = 자릿수를 의미 </p>
	
	<c:set var ="num" value ="12345.0111"/>
	0표현 : 자리에 수가 없으면 0으로 표시 - 자릿수를 맞춰서 출력하고 싶을 때 (ex..10자리 모두 나오게하고싶거나)<br>
	#표현 : 자리에 수사 없으면 공란으로 표시 <br><br>
	************* 원본 ${num}<br>
	1) <fmt:formatNumber value="${num}" /> <br>
	2) <fmt:formatNumber value="${num}" pattern="0,00.0"/> <br>
	3) <fmt:formatNumber value="${num}" pattern="0,000,00.0"/> <br>
	4) <fmt:formatNumber value="${num}" pattern="#,###.##"/> <br>
	5) <fmt:formatNumber value="${num}" pattern="###,###.0000000"/> <br>
	
	<fmt:parseNumber value = "${num }" integerOnly="true"  var = "saveVar1"/> <br>
	integerOnly : 정수부분만 출력 : ${saveVar1 } <br>
	
	
	
<h4> 날짜 포맷 </h4>
	<c:set var ="today" value="<%=new java.util.Date()%>"/>
	오늘 날짜 : ${today } <br>
		
	<fmt:formatDate value="${today }"/> <br>
	<fmt:formatDate value="${today }" type="date"/> <br>
	<fmt:formatDate value="${today }" type ="time"/> <br>
	<fmt:formatDate value="${today }" type ="both"/> <br>
	
	<br><br> <h4> Date</h4>
	full : <fmt:formatDate value="${today }" type="date" dateStyle="full"/> <br>
	short: <fmt:formatDate value="${today }" type="date" dateStyle="short"/> <br>
	long : <fmt:formatDate value="${today }" type="date" dateStyle="long"/> <br>
	default : <fmt:formatDate value="${today }" type="date" dateStyle="default"/> <br>
	medium : <fmt:formatDate value="${today }" type="date" dateStyle="medium"/> <br>
	
	<br><br> <h4> Time</h4>
	full : <fmt:formatDate value="${today }" type="time" timeStyle="full"/> <br>
	short: <fmt:formatDate value="${today }" type="time" timeStyle="short"/> <br>
	long : <fmt:formatDate value="${today }" type="time" timeStyle="long"/> <br>
	default : <fmt:formatDate value="${today }" type="time" timeStyle="default"/> <br>
	medium : <fmt:formatDate value="${today }" type="time" timeStyle="medium"/> <br>
	
	<br><br> <h4> 날짜/시간 표시 both</h4>
	full : <fmt:formatDate value="${today }" type="both" timeStyle="full" dateStyle="full"/> <br>
	short: <fmt:formatDate value="${today }" type="both" timeStyle="short" dateStyle="short"/> <br>
	long : <fmt:formatDate value="${today }" type="both" timeStyle="long"  dateStyle="long"/> <br>
	default : <fmt:formatDate value="${today }" type="both" timeStyle="default" dateStyle="default"/> <br>
	medium : <fmt:formatDate value="${today }" type="both" timeStyle="medium" dateStyle="medium"/>< <br>
	
	
	<h4> pattern 지정 후 출력 </h4>
	<fmt:formatDate value="${today }" type="both" pattern="yyyy-mm-dd hh:mm:ss"/>
	
	<h4> 타임존 설정 </h4>
	<p> value에 특정 지역명을 작성</p>
	<!-- GMT : 대한민국보다 9시간 빠름  -->
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
		<br />
	</fmt:timeZone>
	
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
		<br />
	</fmt:timeZone>
	
	<h4> 로케일 설정</h4>
	<c:set var = "today" value="<%= new Date() %>"/>
	
	한글로 설정 : <fmt:setLocale value="ko_kr"/>
	<fmt:formatNumber value="10000" type="currency"/> /
	<fmt:formatDate value="${today }"/> <br />
	
	일어로 설정 : <fmt:setLocale value="ja_JP"/>
	<fmt:formatNumber value="10000" type="currency"/> /
	<fmt:formatDate value="${today }"/> <br />
	
	영어로 설정 : <fmt:setLocale value="en_US"/>
	<fmt:formatNumber value="10000" type="currency"/> /
	<fmt:formatDate value="${today }"/> <br />
		
	
</body>
</html>








