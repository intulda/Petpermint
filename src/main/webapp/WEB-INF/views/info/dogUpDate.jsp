<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/info/infoList.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 


<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/summernote-ko-KR.js"></script>  
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">

<form name="formInfo" id="_formInfo" method="post" action="/info/dogUpDateAf" enctype="multipart/form-data">
<input type="hidden" name="boardSeq" value="${infoDto.boardSeq}"/>
<input type="hidden" name="boardUpdId" value="${infoDto.boardRegId}">

<div class="upDatemain">

<div class="title" >
	<h2>제목 : <input type="text" name="boardTitle" id="boardTitle" value="${infoDto.boardTitle}"></h2> 
</div>
<hr>
<br>
<div class="updateData">
	아이디 : ${infoDto.boardRegId} <br>
	작성일: ${infoDto.boardRegDate} <br>
	아이디 : ${infoDto.boardUpdId} <br>
	마지막 수정일 : ${infoDto.boardUpdDate}
</div>	
<div class="updateContent">
	<img style="width: 300px; height: 200px;" src="${infoDto.filePath}"><br>
	수정할 첨부이미지<br>
	<input type="file" name="thumbnail" size="20" required="required"/>
	<textarea rows="10" cols="50" name="boardContents" id="summernote">${infoDto.boardContents}</textarea>
</div>
</div>
</form>
<div class="btnDiv">
<button class="btn" type="button" id="UpdateBtn">글 수정하기</button>
</div>



<script type="text/javascript">
$("#UpdateBtn").click(function() {	
	alert('글수정하기');	
	$("#_formInfo").submit();
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
