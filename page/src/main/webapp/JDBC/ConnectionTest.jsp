<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="common.ConnectionUtil"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외부 설정파일로부터</title>
</head>
<body>
<%
 				// 내장객체 
	Connection conn = ConnectionUtil.getConnection(application);
	PreparedStatement pstmt = conn.prepareStatement("select sysdate from dual");
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String today = rs.getString(1);
//	out.print(rs.getString(1));
	out.print(today);
%>
</body>
</html>