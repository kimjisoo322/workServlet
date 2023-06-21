<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload - 파일 등록 페이지</title>
<script>
	// 유효성검사, validation체크 
	function validateForm(form){	
		
		
		/*
		유효성 검사에 실패하면 false를 반환하여 폼 전송을 막음 
		그렇기 때문에 if문에서 실패시 return false;를 반환
		-> form에서 onsubmit="return validateForm(this);" 이 부분이 false로 전달되어 폼 전송x 
		*/
		if(form.name.value == ""){
			alert("작성자를 입력해주세요.");
			form.name.focus();
			return false;
		}
		if(form.title.value == ""){
			alert("제목을 입력해주세요.");
			form.title.focus();
			return false;
		}
		if(form.attachedFile.value == ""){
			alert("첨부파일을 선택해주세요.");
			return false;
		}
		// category에 cheked되어있는게 하나도 없다면 카테고리 선택하라고 알람! 
		if(document.querySelectorAll("[name==category]:checked").length == 0){
			alert("카테고리를 선택해주세요.");
			return false;
		} 
	}
</script>
</head>
<body>
		<h2> 파일 업로드</h2>
	<!-- 
		파일 업로드 하기   
	 	 - 라이브러리(cos.jar) 추가 후 form 태그의 속성 변경 
		
		<< form 태그의 속성 설정 >> 
		! method : post
		! enctype="multipart/form-data" 
	-->
	
	<!--  유효성검사, validation체크 
			-> 1. form에 넘어가는 값이 정확하게 입력될 때만 요청되도록 막아줌!
			   onsubmit= "return validateForm(this);
			    -> 이벤트가 실행되기전에 validateForm을 먼저 실행! 
	 -->
	 ${errorMessage }
	<form action="UploadProcess.jsp" method ="post" enctype="multipart/form-data"
	onsubmit="return validateForm(this);" >
		<p>
			작성자 : <input type ="text" name = "name" value ="지민"></input>
		</p>
		<p>
			제목 : <input type ="text" name = "title" value ="제목"></input>
		</p>
		<p>
			카테고리 : 
			<input type ="checkbox" name = "category" value ="사진" checked></input>사진 
			<input type ="checkbox" name = "category" value ="과제"></input>과제
			<input type ="checkbox" name = "category" value ="워드"></input>워드
			<input type ="checkbox" name = "category" value ="음원"></input>음원
		</p>
		<!--  multiple =mutiple 여러개 파일 첨부할 수 있는 속성 -->
		<p>
			첨부파일 : <input type= "file" name = "attachedFile"></input>
		</p>

		<input type="submit" value = "파일전송"></input>
	</form>

<!-- 
	enctype : form값을 서버로 전송할 때의 인코딩 방식을 지정 
		- application/x-www-form-urlencoded (기본값) : 모든 문자를 서버로 전송하기 전에 인코딩
		- multipart/form-data : <form> 태그를 통해 파일을 서버로 전송할 때 사용, 모든 문자를 인코딩 x 
	
 -->
 
 <h3> 다운로드 </h3>
 	<a href ="${pageContext.request.contextPath}/Upload/변수선언.txt"
 		download ="파일명">다운로드</a>
 		
</body>
</html>







