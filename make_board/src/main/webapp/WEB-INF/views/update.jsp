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
function historyback(){
	history.back();
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
<h1>수정페이지 입니다!</h1>
<form name="frm" action="/board/updateOk" method="POST">
	<div class="input-group mb-3" id="title">
	  <div class="input-group-prepend">
	    <span class="input-group-text" id="basic-addon1" style="width:44px">I D</span>
	  </div>
	  <p style="margin-left:30px; padding-top:10px; font-size:1.0em;"><b>${dto[0].userId }</b></p>
	</div>
	<div class="input-group mb-3" id="title">
	  <div class="input-group-prepend">
	    <span class="input-group-text" id="basic-addon1">제목</span>
	  </div>
	  <p style="margin-left:30px; padding-top:10px; font-size:1.0em;"><b>${dto[0].title }</b></p>
	</div>
	<div class="input-group mb-3">
	   <div class="input-group-prepend">
	    <span class="input-group-text" id="basic-addon1">내용</span>
	  </div>
	   <textarea name="summary" class="form-control" aria-label="With textarea" placeholder="내용입력">${dto[0].summary }</textarea>
	</div>
	<input type="hidden" value="${dto[0].uid }" name="uid"/>
	<div style="text-align:center;">
		<button type="submit" style="width:10%; margin-top:30px">수정완료</button>
		<button onclick="historyback()"type="button" style="width:10%; margin-top:30px">뒤로가기</button>
	</div>
</form>

</body>
</html>