<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<script type="text/javascript">
    function validateForm(form) {  // 필수 항목 입력 확인
        if (form.name.value == "") {
            alert("작성자를 입력하세요.");
            form.name.focus();
            return false;
        }
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.content.value == "") {
            alert("내용을 입력하세요.");
            form.content.focus();
            return false;
        }
        if (form.pass.value == "") {
            alert("비밀번호를 입력하세요.");
            form.pass.focus();
            return false;
        }
    }
</script>
</head>
<h2>파일 첨부형 게시판 - 글쓰기(Write)</h2>
<form name="wirteFrm" method="post" enctype="multipart/form-data"
      action="../mvcboard/write.do" onsubmit="return validateForm(this);">
<table border="1" width="90%">
    <tr>
        <td>작성자</td>
        <td>
            <input type="text" name="name" style="width:150px;" value="${param.name}"/>
        </td>
    </tr>
    <tr>
        <td>제목</td>
        <td>
            <input type="text" name="title" style="width:90%;" value="${param.title}"/>
        </td>
    </tr>
    <tr>
        <td>내용</td>
        <td>
            <textarea name="content" style="width:90%;height:100px;" value="${param.content}"></textarea>
        </td>
    </tr>
    <tr>
        <td>첨부 파일</td>
        <td>
            <input type="file" name="ofile" value="${param.ofile}"/>
        </td>
    </tr>
    <tr>
        <td>비밀번호</td>
        <td>
            <input type="password" name="pass" style="width:100px;"  value="${param.pass}"/>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
        	<!-- 글쓰기 버튼 클릭 하면 글등록 -->
            <button type="submit">작성 완료</button>
            <button type="reset">RESET</button>
            <button type="button" onclick="location.href='../mvcboard/list.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>    
</form>
</body>
</html>