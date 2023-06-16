<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	 #tables{
		
		box-shadow: 1px 3px 5px gray;
		
		background-color: pink;
	} 
	
	/* *{
		border: none;
		
	} */
	a:hover{
		background-color: skyblue;
		border-radius: 30px;
		color: white;
	}
	
</style>
</head>
<body>
<table border="1" width="90%" id = "tables"> 
    <tr>
        <td align="center">
        
        <%
        	if(session.getAttribute("member") == null){
        %>
            <a href="../Session/LoginForm.jsp">로그인</a>
        <%	} else { %>
        	<a href="../Session/Logout.jsp">로그아웃</a>
        <%	} %>
            <!-- 8장과 9장의 회원제 게시판 프로젝트에서 사용할 링크 -->
            &nbsp;&nbsp;&nbsp; 
            <a href="../8게시판/List.jsp">게시판(페이징X_new게시판)</a>
            &nbsp;&nbsp;&nbsp; 
            <a href="../09PagingBoard/List.jsp">게시판(페이징O)</a>
        </td>
    </tr>
</table>
</body>
</html>