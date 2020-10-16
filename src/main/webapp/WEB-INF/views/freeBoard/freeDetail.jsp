<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href ="/css/freeBoard/freeBoard.css" />
</head>
<body>
<c:forEach var="l" items="${getFreeBoardList}">
	<h1 class="freeH1">${l.boardTitle}</h1>
	<br>
	<dd><fmt:formatDate value="${detail.reg_date}" pattern="yyyy.MM.dd"/></dd>
	<hr>
	<br><br>
${l.boardContents}
</c:forEach>
</body>
</html>