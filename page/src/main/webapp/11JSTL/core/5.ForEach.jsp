<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/*
		forEach
			: 반복문을 처리할 때 사용. 일반 for문과 향상된 for문 두 가지 형태로 사용
	*/
%>
<!-- forEach 태그를 활용한 반복문
		beign : 시작값
		end   : 종료값
		step  : 증가값
		var   : 변수
 -->
	
<h4> 일반 for문 형태의 forEach문 </h4>
 	<%
 			 // for(int i = 1; i<=3' i++){}
  	%>	
	<c:forEach begin="1" end="10" step="2" var="i" >
		<p>반복 ${i}입니다.</p>
	</c:forEach>
	
<h4> varStatus 속성 살펴보기 </h4>
<!-- 
 forEach 태그가 갖고있는 속성 varStatus의 값 (current, index, count, first, last)을 알 수 있음 
	varStatus 루프의 현재 상태를 알려주는 변수 이름 
		current : var에 지정한 현재 루프의 변수값
		index   : var에 지정한 현재 루프의 인덱스값 
		count   : 실제 반복횟수(1부터 시작)
		first   : 루프의 처음일 때 true
		last    : 루프의 마지막일 때 true
 -->
 	<table border = "1">
	<c:forEach begin="1" end="5" var="i" varStatus="loop">
		<tr>
			<td>current : ${loop.current }</td>		
			<td>index  : ${loop.index }</td>
			<td>count : ${loop.count }</td>
			<td>first : ${loop.first }</td>
			<td>last : ${loop.last }</td>
		</tr>
	</c:forEach>
	</table>
<h4>1~100까지 정수의 합 </h4>

 <!-- 합을 저장할 변수 sum을 초기화 -->
	<c:set var="sum" value="0"></c:set>

	<c:forEach begin="1" end="100" var="num">
	<!-- 현재 숫자 출력 -->
  	<!-- ${num} -->	
 	<c:if test="${num mod 2 ne 0}">
  	<!-- sum에 현재 숫자를 더하여 업데이트 --> 
 	 <c:set var="sum" value="${sum + num}"></c:set> 
	</c:if>
	</c:forEach>
	
	<!-- 합 출력 -->
	결과 : ${sum} 
	
<h4>향상된 for문 형태의 forEach태그 </h4>
	<%
		String[] rgba = {"Red", "Orange", "Yellow", "Green", "SkyBlue", "Pink" };
	%>
	
	<!--  items 속성에 배열을 지정하고 변수 이름은 "c"로 입력
			배열을 처음부터 끝까지 돌면서 반복문을 수행  -->
	<table border ="1">
	<c:forEach items="<%=rgba %>" var ="c" varStatus="loop">
	<tr>
		<td><span style = "color: ${c}"> ${c}</span></td>
		
			<td>current : ${loop.current }</td>		
			<td>index  : ${loop.index }</td>
			<td>count : ${loop.count }</td>
			<td>first : ${loop.first }</td>
			<td>last : ${loop.last }</td>
	</tr>
	</c:forEach>
	</table>
<!-- *************************************************************************************** -->
<h4> List 컬렉션 사용하기 </h4>
	<%
		List<Member> list = new ArrayList<Member>();
		list.add(new Member("JIMIN","","지민",""));
		list.add(new Member("JK","","정국",""));
		list.add(new Member("suzisu","","지수",""));
		list.add(new Member("admin","","관리자",""));
	%>
	<c:set var = "list" value="<%=list %>"/>

	<!--  list에서 member를 하나씩 꺼내서 변수 member에 담아줌 -->
	<c:forEach items ="${list}" var = "member" varStatus="loop">
		<ul>
			<li> 아이디 : ${member.id} , 이름 : ${member.name }</li>
		</ul>
	</c:forEach>

<h4> Map 컬렉션 사용하기</h4>
	<%
		Map<String, Member> map = new HashMap<String, Member>();
	
		map.put("1st",new Member("JIMIN","","지민",""));
		map.put("2st",new Member("JK","","정국",""));
		map.put("3st",new Member("suzisu","","지수",""));
		map.put("4st",new Member("admin","","관리자",""));
	%>
	<c:set var = "map" value = "<%=map %>"/>
	<c:forEach items ="${map}" var = "map">
		<ul>
			<li>
				key: ${map.key } <br>
				value: ${map.value } <br>
				아이디 : ${map.value.id } <br>
				이름 : ${map.value.name }
				
			</li>
		</ul>
	</c:forEach>
		
<h4> forTokens 태그 사용</h4>
	<!-- 
		Token  : 문법적으로 의미있는 최소단위 
				 구분자를 기준으로 문자열을 나눠 토큰의 갯수만큼 반복
		items  : 문자열(문자열만 사용가능)
		delims : 구분자 
		var    : 변수명
	 -->
<%
	String rbg = "Red, Green, Blue, Blak";
%>
<!--  string문자열을 , 구분해서 하나씩 color에 넣어줌 -->
	<c:forTokens items="<%=rbg %>" delims="," var = "color" >
		<span style = "color : ${color}">${color}</span>
	</c:forTokens>	







</body>
</html>



























