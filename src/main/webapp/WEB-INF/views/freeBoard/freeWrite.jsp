<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1 class="freeWriteH1">글쓰기</h1>
	<br>
	
		<table class="writeTable">
			<tr>
				<th>제목</th>
			</tr>
			<tr>
				<th><input type="text" class="boardTitle" name="title" placeholder="제목을 입력해주세요."></th>
			</tr>
			<tr>
				<th><button type="button" name="addImage">이미지추가</button></th>
			</tr>
			<tr>
				<th>내용</th>
			</tr>
			<tr>
				<th><textarea cols="68" rows="10" class="boardContents" name="content" placeholder="내용을 입력해주세요"></textarea></th>
			</tr>
		</table>
	
	<button type="button" class="freeWriteRegi" name="freeWriteRegi">등록하기</button>
	<button type="button" class="backButton" name="backButton">목록으로</button>
</div>

<script>

$('.backButton').click(function(){
	location.href = "http://localhost:8090/freeBoard/freeBoardViews";
});

$('.freeWriteRegi').click(function(){
		let sendData = {
				boardTitle : $(".boardTitle").val(),
				boardContents : $(".boardContents").val()
				};

		$.ajax({
			url:"/freeBoard/addFreeBoardPage",
			type:"post",
			data:sendData,
			success : function(data){

					if(data=='ok'){
						alert("글을 작성했습니다.");
					}
					else{
						alert("글을 작성하지못했습니다.");
					}
					location.href ="/freeBoard/freeBoardViews";
				},
			error : function(){
				alert("error");
				}
		});
			
});
</script>
</body>
</html>