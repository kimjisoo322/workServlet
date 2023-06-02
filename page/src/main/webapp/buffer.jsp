<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage = "errorPage.jsp"%>
    
<%@ page buffer="10kb" autoFlush ="false" %>
<!-- 버퍼의 크기를 충분히 크게 지정, autoFlush를 true로 설정 하면 해결  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 

	버퍼 
	 ( 기본값 8kb )
	  : 응답 결과를 웹 브라우저로 즉시 전송하지 않고, 
	    출력할 내용을 버퍼에 저장해두었다가 일정량이 차면 클라이언트로 전송
	    (cpu나 메모리에 비해 IO(입출력) 속도가 느리므로 응답결과를 버퍼에 저장해두었다가 전송)
	    
	    buffer = "none"으로 지정 시 포워드, 에러페이지 등의 기능을 사용x
	    크기를 줄일 경우 jsp의 기능을 온전히 사용하지 못하므로 값을 변경하는 경우 거의 없음
	    
	버퍼를 사용하는 이유 
		- 성능 향상
		*- JSP 실행 도중 버퍼를 비우고 새로운 내용을 전송 가능 (forward, redirect)
		 - 버퍼가 다 차기 전에, 응답 헤더를 변경 가능 
		 => 사용자가 servlet 요청 (로그인) -> controller (id, pw 체크_ db에 있는지 확인) 
		 => : 체크 결과 성공이면 사용자에게 jsp로 응답_loginOK.jsp파일 열기(html로 응답이 되기 때문, jsp 파일을 여는 것)
   		 => 성공 또는 실패 두 페이지 중에서 응답해야하기 때문에 이때 쓰는것이 포워드
   		 
 autoFlush 
 	true  : 버퍼가 차면, 자동전송
 	false : 버퍼가 차면, 예외 Exception 발생 -> 실행 중지  
 -->
 
 <%
 	for(int i =0; i<100; i++){
 		out.println("abcde12345");
 	}
 		out.println("out.getBufferSize()"+ out.getBufferSize());
 		out.println("out.isAutoFlush()" + out.isAutoFlush());
 %>
</body>
</html>