<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<h2> 회원 목록 조회 </h2>
	<table  border='1'>
	
	<!--  JSP를 통해서 데이터베이스에 담긴 데이터 읽어오기  -->
	<%
		Connection conn = ConnectionUtil.getConnection();
	
		String sql = "SELECT ID, NAME, REGIDATE FROM MEMBER";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			String id = rs.getString("ID");
			String name = rs.getString("NAME");
			String regidate = rs.getString("REGIDATE");
		out.print(String.format("<tr> <td>%s</td> <td>%s</td> <td>%s</td> </tr>" , id, name, regidate));
		}		
		
		// 자원반납
		rs.close();
		pstmt.close();
		conn.close();	
	%>
		
	</table>
</body>
</html>