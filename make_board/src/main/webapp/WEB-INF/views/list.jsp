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
<style>

#test {
    float: right;
    position: relative;
    left: -50%;
}

#test li {
    float: left;
    position: relative;
    left: 50%;
}
</style>
<body>
<div style="text-align:center;padding:50px 0px;"><h1><b>글 목록</b></h1>
<form action="list" method="POST">
	<input type="hidden" name="page" value="${page }">
	<select name="pageCnt" id="pageCnt" style="float:right; margin-right:10%; border:1px solid black">
	  <c:choose>
	  	<c:when test="${pageCnt == 10}">
	  		<option value="10" selected>10개씩보기</option>
	  	</c:when>
	  	<c:otherwise>
	  		<option value="10">10개씩보기</option>
	  	</c:otherwise>
	  </c:choose>
	  <c:choose>
	  	<c:when test="${pageCnt == 15}">
	  		<option value="15" selected>15개씩보기</option>
	  	</c:when>
	  	<c:otherwise>
	  		<option value="15">15개씩보기</option>
	  	</c:otherwise>
	  </c:choose>
	  <c:choose>
	  	<c:when test="${pageCnt == 20}">
	  		<option value="20" selected>20개씩보기</option>
	  	</c:when>
	  	<c:otherwise>
	  		<option value="20">20개씩보기</option>
	  	</c:otherwise>
	  </c:choose>
	</select>
	<br>
	<br>
	<button type="submit" style="float:right; margin-right:10%;">적용하기</button>
</form>
</div>
<b style="float:right; margin-right:10%;">전체 게시글 수 : ${allCnt }</b>
<br>
<br>
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
<b>총 페이지 갯수 ${allCnt / 10 }</b>
<ul>
	<c:forEach var="i" begin="1" end="${allCnt / 5 / 5}">
			<li>총 페이지 갯수 : ${i }</li>
			<li>페이지 마지막 갯수 : ${allCnt % 5 }</li>
	</c:forEach>
</ul>
<nav aria-label="Page navigation example" style="padding-bottom:50px; padding-top:20px;">
  <ul class="pagination" id="test">
    <li class="page-item"><a class="page-link" href="list?page=1&pageCnt=${pageCnt }">Previous</a></li>
    <li class="page-item"><a class="page-link" href="list?page=1&pageCnt=${pageCnt }">1</a></li>
    <li class="page-item"><a class="page-link" href="list?page=2&pageCnt=${pageCnt }">2</a></li>
    <li class="page-item"><a class="page-link" href="list?page=3&pageCnt=${pageCnt }">3</a></li>
    <li class="page-item"><a class="page-link" href="list?page=4&pageCnt=${pageCnt }">4</a></li>
    <li class="page-item"><a class="page-link" href="list?page=5&pageCnt=${pageCnt }">5</a></li>
    <li class="page-item"><a class="page-link" href="list?page=${page + 1 }&pageCnt=${pageCnt }">Next</a></li>
  </ul>
</nav>
<button onClick="location.href='/board/write'" type="button" class="btn btn-secondary btn-lg btn-block" style="width:10%; margin:auto; margin-top:30px; margin-bottom:200px;">글 작성</button>
</body>
</html>