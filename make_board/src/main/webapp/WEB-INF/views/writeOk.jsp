<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("작성실패");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("작성성공!");
			location.href="/board/list";
		</script>
	</c:otherwise>

</c:choose>