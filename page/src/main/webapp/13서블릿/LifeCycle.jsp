<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

function requestAction(form, type){
	if(type == 1){
	form.method ='get';
	form.submit();
		
	}else{
		form.method ='post';
	}
		form.submit();
}

</script>
</head>
<body>

	<h2> 서블릿 수명주기 (Life Cycle)</h2>

	<form action="${pageContext.request.contextPath}/13서블릿/LifeCycle" >
	
	<!--  1이면 get 방식 2면 post 방식 -->
	<input type="button" value ="Get방식요청" onclick="requestAction(this.form,1)"></input>
	<input type="button" value ="Post방식요청" onclick="requestAction(this.form,2)"></input>
	</form>

</body>
</html>