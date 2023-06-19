<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	// 리스트 생성 (타입은 Object) -> 어떤 타입이든지 저장 가능 
	List<Object> list = new ArrayList<Object>();
	
	// string, Member 객체 저장 
	list.add("링티");
	list.add(new Member("mustHave", "", "머스트해브", "2023-06-19"));

	// 페이지 영역에 리스트 객체 저장 
	pageContext.setAttribute("list",list);
	
%>
	<h2> list 컬렉션</h2>
	<ul>
		<li>0번째요소 : ${list[0]}</li>
		
		<li>1번째요소 : ${list[1] }</li>
		<li>1번째요소의 아이디 : ${list[1].id }</li>
		<li>1번째요소의 이름 : ${list[1].name }</li>
		
		<li>2번째요소 : ${list[2] }</li>
	</ul>

	<h2> Map 컬렉션</h2>
<%
	// map 생성 (key, value)
	Map<String, String> map = new HashMap<String,String>(); 
	map.put("한글", "훈민정음");
	map.put("Eng", "English");
	
	pageContext.setAttribute("map", map);
%>
	<ul>
	<!--  map 은 key 값으로 접근해 출력 가능/ 한글은 .으로 접근 불가능, 대괄호를 이용해 출력!  -->
		<li>한글 : ${map['한글']}</li>
		<li>한글(주석) : \${map.한글}</li> <!--  주석처리 : 오류는 발생하지 않지만 형태 그대로 출력-->
		<p><%=map.get("한글") %></p>
		
		
		<li>Eng : ${map.Eng}</li>
		<p><%=map.get("Eng") %></p>
	</ul>
</body>
</html>


