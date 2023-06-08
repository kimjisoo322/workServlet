<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link rel="stylesheet" href="css/style.css">
</head>
<body> 
		
    <div class="wrap">
        <!-- header.jsp -->
        
        <%@include file="header.jsp" %>
        <main>
            <aside id='leftside'>

            </aside>
            <div id='maincontent'>
                <ul>
                    <li><img src="images/main_img1.jpg" alt="">나무를 심는 사람들</li>
                    <li><img src="images/main_img2.jpg" alt="">아이들에게 녹색 미래를..</li>
                    <li><img src="images/main_img3.jpg" alt="">설악산을 사리는 길</li>
                    <li><img src="images/main_img4.jpg" alt="">사라지는 북극곰들</li>
                </ul>
            </div>
            <aside id='rightside'>
                <div class='side1'>
                
                        <!-- 로그인 실패 : 메세지 처리 
                             로그인 성공 : 박스를 보여주지 않고 alert 로그인에 성공하였습니다. abc님 환영합니다.
                             --> 
   				
                            <%                     
   							String loginErr = request.getParameter("loginErr");
   							if("Y".equals(loginErr)){
   								out.print("<script>alert('로그인에 실패하였습니다.')</script>");
   							}
   							%>
   							<!-- 로그인에 성공했을 시 -->
   							   							
   						<%
   						String name = "";
   						if(session.getAttribute("id") != null){
   							name = (String)session.getAttribute("id");
   						}
   					  	//String name = request.getParameter("name");
   					  	if(name != null && !name.equals("")){
   							// 로그인 되었다고 판단	
   					   	%>				   		
   					<%
   					} else {
   					%>
                
                    <div class='loginbox'>
                        <div id='login'>
                        
   						<form action="gogreenLogin.jsp" method="post">
                            <input type="text" name="userid" id="userpw" placeholder='ID를 입력해주세요.'>
                            <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.'>
                
                        </div>
                        <div id='button'>
                        <input type="submit" value="로그인">
                        </div>
                      </form>                     
             	   </div>
             	   
             	   <!--  jsp에서 자바코드는 자바코드라고 인식시켜야하기 때문에 <%%>안에 넣어줘야함.
             	                html코드는 <%%> 밖에서   -->
                      <%
   					   	}
                      %>
                    </div>
                    <div id='info'>
                    
                        <a href="">회원가입</a>
                        <a href="">ID찾기</a>
                        <a href="">PW찾기</a>
                    </div>
                 

                <div class='side2'>
                    <img src="images/right_img.jpg" alt="">
                </div>

                <div class='side3'>
                    <img src="images/me_chat.jpg" alt="">
                </div>
            </aside>
        </main>        
           
        
        <!-- footer.jsp -->
        <%@include file="footer.jsp" %>
    </div>
</body>
</html>