<%@page import="util.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="loginAction.jsp" method="post">
    <% 
    	// 쿠키에 저장된 아이디가 있다면 id필드의 value 속성에 아이디 값을 넣어준다. 
    	// 쿠키에 저장된 아이디 보여주기
    	String userid = CookieManager.readCookie(request, "userid");
    	
    /*
    	Cookie[] cookies = request.getCookies();
    	
    	String id = "";
    	if(cookies != null){
    	
    	for(Cookie cookie :cookies){
    		if("userid".equals(cookie.getName())){
    			// 원래는 빈값인데 만약 있다면 쿠키의 값을 저장함  (-> vluae는 userid에 저장됨.)
    			id = cookie.getValue();
    			out.print("userid : " + id);
    			// 저장하고 나면 반복문 탈출
    			break; 
    		}
    	}
    }
    */
    	String name = request.getParameter("name");
    	if(name != null && !name.equals("")){
    		out.print("<h1>" + name + "님 환영 합니다.</h1>");
 %>			
 		<div id='button'>
 <!--    <input type="submit" value="로그아웃"> -->    
	    <button onclick="location.href='logout.jsp'">로그아웃</button>
 	
 <%    	} else {
    		
    %>
    <div class='loginbox'>
        <div id='login'>
            <input type="text" name="userid" id="userpw" placeholder='ID를 입력해주세요.' required="required"  value = "<%=userid %>"><br>
            <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.'><br>
            <input type ="checkbox" name = "save_check" value="Y">아이디저장하기
        </div>
        <div id='button'>
        <input type="submit" value="로그인">
        </div>
    </div>
    <div id='info'>
        <a href="">회원가입</a>
        <a href="">ID찾기</a>
        <a href="">PW찾기</a>
    </div>
    
    <%
    } 
    %>
</form>
                
</body>
</html>