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
<div class="freewrite">
	<h1 class="freeWriteH1">수정</h1>
	<br>
	
		<table class="writeTable">
			<tr>
				<th>제목</th>
			</tr>
			<tr>
				<th><input type="text" class="boardTitle" name="title" placeholder="제목을 입력해주세요." value="${dto.boardTitle}"></th>
			</tr>
			<tr>
				<th><button type="button" name="addImage">이미지추가</button></th>
			</tr>
			<tr>
				<th>내용</th>
			</tr>
			<tr>
				<th><textarea cols="68" rows="10" class="boardContents" name="content" placeholder="내용을 입력해주세요">${dto.boardContents}</textarea></th>
			</tr>
		</table>
	
	<button type="button" class="freeWriteRegi" name="freeUpdate">등록하기</button>
	<button type="button" class="backButton" name="backButton">목록으로</button>
</div>

<script type="text/javascript">
$(".freeUpdate").click(function(){

	let boardSeq = ${dto.boardSeq};
	
	$.ajax({
		url : "/freeBoard/freeBoardUpdate",
		type : "post",
		data : boardSeq,
		success : function(data){
			alert("뽀잉또잉?");
			},
		error : function(){
			alert("error");
			}
		});
});

</script>
</body>
</html>