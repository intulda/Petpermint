<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
<link rel="stylesheet" href ="/css/freeBoard/freeBoard.css" />
</head>
<body>
<div class="freewrite">
	<form method="post" id="sendForm" action="/freeBoard/freeWrite"
		enctype="multipart/form-data">
		<h1 class="freeWriteH1">글쓰기</h1>
		<br>
		작성자<input type="text" name="id" class="sendData" readonly="readonly" value="aaa"><br>
		제목<input type="text" name="title" class="sendData" placeholder="제목을 입력해주세요.">
		<br>이미지추가
		<input type="file" name="thumbnail" class="sendData" accept=".gif, .jpg, .png"><br>
		<textarea id="summernote" name="boardContents"></textarea>	
		
		<br>
		<button type="button" class="freeWriteRegi" name="freeWriteRegi">등록하기</button>
		<button type="button" class="backButton" name="backButton">목록으로</button>
	</form>
</div>

<script>

$(document).ready(function() {
	
	$('#summernote').summernote({
		  height: 500,                 // 에디터 높이
		  width: 950,
		  minHeight: 500,             // 최소 높이
		  maxHeight: 500,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다',//placeholder 설정
          toolbar:[
        	  ['style', ['bold', 'italic', 'underline', 'clear']],
        	  ['fontsize', ['fontsize']],
        	  ['color', ['color']],
        	  ['insert', ['link', 'picture', 'video']]
          ]
	});

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