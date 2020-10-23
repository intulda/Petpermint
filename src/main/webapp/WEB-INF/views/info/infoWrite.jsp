<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/info/infoList.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 

<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/summernote-ko-KR.js"></script>  
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">

<form name="_frmForm" id="_frmForm" method="post" action="dogWriteAf" enctype="multipart/form-data">

<div class="writemain">
<br>
<h2>글 쓰기</h2><br>
<hr>
	[ Type / Category 선택 ]<br>
<div class="writechoice">
	<select id="boardType" name="boardType">
		<option value="강아지">강아지</option>
		<option value="고양이">고양이</option>
	</select>
	<select id="boardCategory" name="boardCategory">
		<option value="음식">[음식]</option>
		<option value="훈련">[행동]</option>
		<option value="백과">[백과]</option>		
	</select>
</div>	

<div class="writeTitle">
	[ 제목 ] <input type="text" placeholder="제목을 입력해주세요." size="60" id="boardTitle" name="boardTitle"/><br>
	[ 첨부 이미지 ]<input type="file" name="thumbnail" size="20" required="required">
</div>


<div>
	<textarea id="summernote" name="boardContents"></textarea>	  
</div>
<br>
</div>

<div class="btnDiv">
	<button class="btn" type="button" id="dogwirte">글쓰기</button>
</div>
	

</form>


<script type="text/javascript">

$("#dogwirte").click(function() {	
	alert('글작성');	
	$("#_frmForm").attr({"action":"dogWriteAf"}).submit();	
});

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
});

</script>

