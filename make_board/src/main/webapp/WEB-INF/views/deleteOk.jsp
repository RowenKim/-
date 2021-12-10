<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("삭제실패");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("게시글이 삭제되었습니다");
			location.href="/board/list";
		</script>
	</c:otherwise>

</c:choose>