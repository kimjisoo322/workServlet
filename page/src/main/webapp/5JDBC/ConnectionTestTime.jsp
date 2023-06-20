<%@page import="common.DBConnectionPool"%>
<%@page import="common.ConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> ConnectionUtil 이용한 커넥션 생성 </h1>
<%
	long sTime, eTime;
	sTime = System.currentTimeMillis();
	
	// 반복하면서 커넥션 생성
	for(int i=0; i<100; i++){
		Connection con1= ConnectionUtil.getConnection(application);
		System.out.println("con1 : " + con1);
		con1.close();
	}
	eTime = System.currentTimeMillis();
	out.print("100개 생성시 걸리는 시간 (ConnectionUtil)= " + ( eTime - sTime ) + "ms");
%>

<h1> ConnectionPool 이용한 커넥션 생성 </h1>
<%
	sTime = System.currentTimeMillis();
	
	// 반복하면서 커넥션 생성
	for(int i=0; i<100; i++){
		Connection con2= DBConnectionPool.getConnection();
		System.out.println("con2 : " + con2);
		con2.close();
	}
	eTime = System.currentTimeMillis();
	out.print("100개 생성시 걸리는 시간 (DBConnectionPool)= " + ( eTime - sTime ) + "ms");
%>
</body>
</html>