<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>글 작성</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	
	var frm_userId = frm["userId"].value.trim()
	var frm_title = frm["title"].value.trim()
	
	if(frm_userId == ""){
		alert("아이디를 입력해주세요");
		frm["userId"].focus();
		return false;
	}
	if(frm_title == ""){
		alert("제목을 입력해주세요")
		frm["title"].focus();
		return false;
	}
	return true;
}
</script>
<style>
body{
	width:60%;
	margin:auto;
}
h1{
	margin-top:30%;
	text-align:center;
	padding-bottom:50px;
}
</style>
<body>
<h1>작성페이지 입니다!</h1>
<form name="frm" action="/board/writeOk" method="POST" onsubmit="return chkSubmit();">
	<div class="input-group mb-3" id="title">
	  <div class="input-group-prepend">
	    <span class="input-group-text" id="basic-addon1" style="width:44px">I D</span>
	  </div>
	  <input name="userId" type="text" class="form-control" placeholder="UserID" aria-label="Username" aria-describedby="basic-addon1">
	</div>
	<div class="input-group mb-3" id="title">
	  <div class="input-group-prepend">
	    <span class="input-group-text" id="basic-addon1">제목</span>
	  </div>
	  <input name="title" type="text" class="form-control" placeholder="Username" aria-label="title" aria-describedby="basic-addon1">
	</div>
	<div class="input-group mb-3">
	   <div class="input-group-prepend">
	    <span class="input-group-text" id="basic-addon1">내용</span>
	  </div>
	   <textarea name="summary" class="form-control" aria-label="With textarea" placeholder="내용입력"></textarea>
	</div>
	<div style="text-align:center;">
		<button type="submit" style="width:10%; margin-top:30px">작성완료</button>
		<button onclick="location.href='/board/list'"type="button" style="width:10%; margin-top:30px">목록보기</button>
	</div>
</form>

</body>
</html>