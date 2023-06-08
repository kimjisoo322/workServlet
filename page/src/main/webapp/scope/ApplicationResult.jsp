<%@page import="java.util.Set"%>
<%@page import="dto.Person"%>
<%@page import="java.util.Map"%>
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
	// 브라우저를 닫았다가 다시 열어도 값이 유지가 됨. 
	// 서버를 종료 후 다시 실행 시 제거되는 것을 확인할 수 있다. 
  	Map<String,Person> maps =(Map<String, Person>)application.getAttribute("maps");

	// keySet() : 키의 집합을 set 타입으로 반환.(중복x)
	// 맵에 담겨진 데이터의 키값을 조회 
	Set<String> keys = maps.keySet();
	
		
	// map = key value가 쌍으로 저장되는 컬렉션 타입
	// get(key) : 키값을 이용해 value값을 반환받음 
		for(String key: keys){
		Person p = maps.get(key);
		out.print(p.getName() + "/" + p.getAge() + "<br>");
	}
%>
</body>
</html>