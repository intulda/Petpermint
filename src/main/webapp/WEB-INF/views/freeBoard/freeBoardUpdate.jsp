<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<form method="POST" id="sendForm" action="/freeBoard/freeBoardUpdate"
	enctype="multipart/form-data">
		<h1 class="freeWriteH1">글 수정</h1>
		<br>
		<input type="hidden" name="boardSeq" value="${dto.boardSeq}">
		작성자<input type="text" name="id" class="sendData" readonly="readonly" value="aaa"><br>
		제목<input type="text" name="boardTitle" class="boardTitle" value="${dto.boardTitle}">
		<br>이미지추가
		<input type="file" name="IMG" class="sendDataIMG" accept=".gif, .jpg, .png"><br>
		<textarea id="summernote" name="boardContents" class="boardContents"></textarea>
		<br>
		<button type="button" class="freeUpdate" name="freeUpdate">수정하기</button>
	</form>
</div>

<script type="text/javascript">

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

	$("#summernote").summernote('pasteHTML','${dto.boardContents}');

	$('.freeUpdate').click(function(){
		
		if($('.boardTitle').val().trim() == ""){			
			alert("제목을 입력해주세요");
			$('.boardTitle').focus();
		}
		else if($('.boardContents').val().trim() == ""){			
			alert("내용을 입력해주세요");
			$('.boardContents').focus();
		}		
		else{		
			$('#sendForm').submit();
		}
	});
});
</script>
</body>
</html>