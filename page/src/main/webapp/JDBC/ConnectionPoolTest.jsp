<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="common.DBConnectionPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  커넥션 풀 
	커넥션 풀(connection pool)은 Connection 객체를 미리 생성해 풀(pool)에 넣어놓고, 
	요청이 있을 때 이미 생성된 Connection 객체를 가져다 사용하는 기법

	대부분의 WAS는 커넥션 풀을 비롯한 여러 자원을 JNDI 서비스로 제공
	JNDI(Java Naming and Directory Interface): 자바 소프트웨어에서 객체나 데이터를 전체 경로를 몰라도 
 												‘이름’만으로 찾아 쓸 수 있는 디렉터리 서비스

 -->
 <%
 	Connection conn = DBConnectionPool.getConnection();
 	PreparedStatement pstmt =  conn.prepareStatement("select sysdate from dual");
 	ResultSet rs =  pstmt.executeQuery();
	
 	if(rs.next()){
 		out.print(rs.getString(1));
 	}
 	rs.close();
 	pstmt.close();
 	conn.close();
%>
 		 
</body>
</html>