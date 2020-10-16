<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<style>

#inputArea{

	width:60%;	
	margin: 0 auto;
	margin-top: 30px;

}
#inputArea input.sendData{
	margin: 5px;
	height: 30px;
	width: 940px;
	border: none;
	border-bottom: 1px solid black;
}


</style>


<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/summernote-ko-KR.js"></script>  
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">


<div id="inputArea">
	<form method="post" id="sendForm" action="/placeBoard/placeBoardWrite"
		enctype="multipart/form-data">	
			
		작성자<input type="text" name="id" class="sendData" readonly="readonly" value="aaa">
		<input type="text" name="boardTitle" id="boardTitle" class="sendData" placeholder="장소명을 입력해주세요">
		<input type="text" name="boardLocation" id="boardLocation" class="sendData"placeholder="주소를 입력해주세요">
		<input type="text" name="boardTel" id="boardTel" class="sendData"placeholder="연락처를 입력해주세요">
		<select name="boardCategory">
			<option value="동물병원">동물병원</option>
			<option value="애견카페">애견카페</option>
			<option value="카페">카페</option>
			<option value="음식점">음식점</option>
		</select>
		<br>썸네일이미지
		<input type="file" name="thumbnail" class="sendData" accept=".gif, .jpg, .png">	
		<textarea id="summernote" name="boardContents"></textarea>	  
		
	</form>	
</div>

<button type="button" id="writeButton" >글등록</button>




<script>
$(document).ready(function() {
	
	// 섬머노트 api 출력
	$('#summernote').summernote({
		  height: 500,                // 에디터 높이
		  width: 950,				  // 에디터 너비
		  minHeight: 500,             // 최소 높이
		  maxHeight: 500,             // 최대 높이
		  focus: true,                // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",			  // 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	,//placeholder 설정
          toolbar:[
        	  ['style', ['bold', 'italic', 'underline', 'clear']],
        	  ['fontsize', ['fontsize']],
        	  ['color', ['color']],
        	  ['insert', ['link', 'picture', 'video']]
          ]
	});

	// 게시물 등록
	$('#writeButton').click(function(){
		
		if($('#boardTitle').val().trim() == ""){			
			alert("장소명을 입력해주세요");
			$('#boardTitle').focus();
		}
		else if($('#boardLocation').val().trim() == ""){			
			alert("장소주소를 입력해주세요");
			$('#boardLocation').focus();
		}
		else if($('#boardTel').val().trim() == ""){			
			alert("연락처를 입력해주세요");
			$('#boardTel').focus();
		}		
		else{		
			$('#sendForm').submit();
		}
	});
});

</script>