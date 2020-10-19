<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href ="/css/freeBoard/freeBoard.css" />
</head>
<body>
<h1 class="detailH1">${dto.boardTitle}</h1>
<p class="detailP">${dto.boardRegDate}</p>
<button class="freeUpdate">수정</button>
<button class="freeDelete">삭제</button>
<br><br>
<hr class="freeDetailHr">
<br><br>

<div class="detailDiv">
	<p>${dto.boardContents}</p>
</div>

<script type="text/javascript">
$(".freeDelete").click(function(){

	let boardSeq = ${dto.boardSeq};
	
	$.ajax({
		url:"/freeBoard/freeBoardDelete",
		type:"post",
		data:{boardSeq},
		success : function(data){
			if(data === 'ok'){
			alert("구뜨");
			location.href="/freeBoard/freeBoardViews";
		}else{
			alert("글삭제 노노");
			}
		},
		error : function(){
		alert("쉽벌");
			}
	});

});

$(".freeUpdate").click(function(){
	
	let boardSeq = ${dto.boardSeq};
	location.href ="/freeBoard/freeBoardUpdateView?boardSeq=" + boardSeq;
	
});
</script>
</body>	
</html>