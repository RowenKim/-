<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>글 내용</title>
</head>
<script>
function chkSubmit(uid){
	
	if(confirm("정말 삭제하시겠습니까?") == true){
		
		location.href='/board/deleteOk?uid=' + uid;
		
	}else{
		
		return;
	}
	
}
</script>
<style>
body{
	width:40%;
	margin:auto;
}
h1{
	margin-top:30%;
	text-align:center;
	padding-bottom:50px;
}
td{
	background-color:white;
	color:black;
}
</style>
<body>
<h1>글 내용!</h1>
<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col" class="col-md-3">제목</th>
      <td class="col-md-9">${dto[0].title }</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">아이디</th>
      <td>${dto[0].userId }</td>
    </tr>
    <tr>
      <th scope="row">내용</th>
      <td>${dto[0].summary }</td>
    </tr>
  </tbody>
</table>
<div>
	<div style="margin:auto; display:flex; width:75%">
		<button onClick="location.href='/board/update?uid=${dto[0].uid }'" type="button" class="btn btn-secondary btn-lg btn-block" style=" margin-right:20px; margin-top:30px">수정하기</button>
		<button onClick="chkSubmit(${dto[0].uid})" type="submit" class="btn btn-secondary btn-lg btn-block" style="margin-top:30px">삭제하기</button>
		<button onClick="location.href='/board/list'" type="button" class="btn btn-secondary btn-lg btn-block" style="margin-left:20px; margin-top:30px">목록보기</button>
	</div>
</div>

</body>
</html>