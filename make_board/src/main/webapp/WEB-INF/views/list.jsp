<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %> <!-- LocalDateTime의 값을 포멧해주기 위해 pom.xml에 의존성 주입 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>LIST</title>
</head>
<style>
	body{width:80%; margin:auto;}
	.table{
		width:80%;
		margin:auto;
	}

</style>
<body>
<div style="text-align:center;padding:50px 0px;"><h1><b>글 목록</b></h1></div>
<table class="table">
  <thead>
    <tr>
      <th scope="col" class="col-md-2">uid</th>
      <th scope="col" class="col-md-3">ID</th>
      <th scope="col" class="col-md-6">제목</th>
      <th scope="col" class="col-md-3">날짜</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="dto" items="${list }">
	    <tr>
	      <th scope="row">${dto.uid }</th>
	      <td>${dto.userId }</td>
	      <td><a href="/board/info?uid=${dto.uid }">${dto.title }</a></td>
	      <td>
	      	<javatime:format value="${dto.b_date}" pattern="yyyy-MM-dd HH:mm:ss" />
	      </td>
	    </tr>
  	</c:forEach>
  </tbody>
</table>
<button onClick="location.href='/board/write'" type="button" class="btn btn-secondary btn-lg btn-block" style="width:10%; margin:auto; margin-top:30px">글 작성</button>
</body>
</html>