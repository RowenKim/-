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

</body>
</html>