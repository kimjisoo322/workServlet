<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(session.getAttribute("person") != null){
		Person p = (Person)session.getAttribute("person");
		out.print(p.getName() + ",");
		out.print(p.getAge());
		
	} else{
		out.print("session에 저장된 person 없음");
	}
%>
<br>
<%
	if(session.getAttribute("list")!= null){
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("list");
		// 향상된 for문 
		for(String str :list){
			out.print(str + "<br>");
		}
	//	out.print(list.get(0) + ",");
	//	out.print(list.get(1) + ",");
	//	out.print(list.get(2));
	}else{
		out.print("session에 저장된 list 없음");
	}
%>
</body>
</html>