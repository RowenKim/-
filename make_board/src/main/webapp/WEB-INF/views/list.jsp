<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %> <!-- LocalDateTime의 값을 포멧해주기 위해 pom.xml에 의존성 주입 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<b style="float:right; margin-right:10%;">현재 페이지 : ${page }</b>
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


<c:set var="doneLoop" value="false"/> <%-- forEach문 break와 같은 기능을 하기위한 변수선언 --%>

<%--선택한 페이지가 0번대일경우 10번대일경우 20번대일경우 나눠주기. 
	경우에 따라 1~10, 11~20, 21~30. . . 
 	ex) 1~10일 경우 -1을 해주고 10을 나눠줄 경우 몫이 0으로 나오게 해주는데 실수로 나와서 Int형 타입으로 변환 후 변수선언 --%>
<fmt:parseNumber var= "pages" integerOnly= "true" value= "${(page - 1) / 10 }" />

<%-- 마지막 페이지의 갯수가 게시글 나타내는 수를 못 채울 경우 소수점으로 나오기 때문에 소수점을 날리고 Int형으로 변수 선언 --%> 
<fmt:parseNumber var= "pageCntTest" integerOnly= "true" value= "${allCnt / pageCnt}" />

<%-- 페이징 마지막 페이지 나타낼 게시글 수에 미치지 못할 경우 처리. --%>
<c:choose>
	<c:when test="${allCnt / pageCnt > pageCntTest }">  <%-- allCnt / pageCnt 전체게시글 나누기 한 페이지에 나타낼 게시글 수(소수점포함)
															pageCntTest 	  전체게시글 나누기 한 페이지에 나타낼 게시글 수(소수점날린 변수) 두 수를 비교해서 소수점이 있는경우 마지막페이지 +1 추가--%>
		<fmt:parseNumber var= "paging" integerOnly= "true" value= "${pageCntTest + 1}" />
	</c:when>
	<c:otherwise>
		<fmt:parseNumber var= "paging" integerOnly= "true" value= "${pageCntTest }" /> <%-- 그렇지 않은 경우는 한 페이지에 나타나는 게시글 수에 맞게 페이징 처리가 되기 때문에 마지막페이지 +1 해주지 않아도 됩니다 --%>
	</c:otherwise>
</c:choose>

<nav aria-label="Page navigation example" style="padding-bottom:50px; padding-top:20px;">
  <ul class="pagination" id="test">
  	<c:if test="${pages > 0 }"> <%--선택한 페이지가 10을 초과하게 되면 if 조건문이 충족되어 if문이 실행 --%>
  		<li class="page-item"><a class="page-link" href="list?page=1&pageCnt=${pageCnt }">맨앞으로</a></li>
  	</c:if>
    <li class="page-item"><a class="page-link" href="list?page=${page - 1 }&pageCnt=${pageCnt }">Previous</a></li>
  	<c:forEach var="i" begin="${pages * 10 + 1}" end="${paging }"> <%--선택한 페이지에 따라 출력가능한 페이지까지 반복문 실행--%>
  		<c:if test="${doneLoop ne true }"> <%--doneLoop가 true가 아닐 경우에 if문 실행 --%>
	  		<c:choose>
	  			<c:when test="${i % 10 != 0 }"> <%-- 1 ~ 10일 경우 반복문이 10번이 되기 전 까지 실행--%>
				    <li class="page-item"><a class="page-link" href="list?page=${i }&pageCnt=${pageCnt }">${i }</a></li>
	  			</c:when>
	  			<c:otherwise>
	  				<li class="page-item"><a class="page-link" href="list?page=${i }&pageCnt=${pageCnt }">${i }</a></li> <%--위 <c:when> 조건문을 충족하지 못한 10을 출력해주기 --%>
	  				<c:set var="doneLoop" value="true"/> <%-- 10번 반복문이 실행이 될 경우 doneLoop true로 바꿔주기 --%>
	  			</c:otherwise>
	  		</c:choose>
  		</c:if>
	</c:forEach>
    <li class="page-item"><a class="page-link" href="list?page=${page + 1 }&pageCnt=${pageCnt }">Next</a></li>
  </ul>
</nav>
<button onClick="location.href='/board/write'" type="button" class="btn btn-secondary btn-lg btn-block" style="width:10%; margin:auto; margin-top:30px; margin-bottom:200px;">글 작성</button>
</body>
</html>