<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/summernote-ko-KR.js"></script>  
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/placeBoard/placeWriteUpdate.css" />
	
<div class="place_title">펫플레이스</div>


<form method="post" id="sendForm" action="/placeBoard/placeBoardWrite"
	enctype="multipart/form-data">	
	<div class="inputArea">
		<div class="subArea">			
			<div class="item1">작성자</div>
			<div class="item2"><input type="text" name="id" class="idData" readonly="readonly" value="${login.id}"></div>
		</div>
		<div class="subArea">
			<div class="item1">장소</div>
			<div class="item2"><input type="text" name="boardTitle" id="boardTitle" class="sendData" placeholder="장소명을 입력해주세요"></div>
		</div>
		<div class="subArea">
			<div class="item1">주소</div>
			<div class="item2"><input class="sendData" type="text" name="boardLocation" id="boardLocation" class="sendData" readonly="readonly" placeholder="주소를 입력해주세요">
			<input type="button" onclick="sample4_execDaumPostcode()"  value="주소찾기" style=" vertical-align: -11%;">
			</div>
		</div>
		<div class="subArea">
			<div class="item1">연락처</div>
			<div class="item2"><input type="text" name="boardTel" id="boardTel" class="sendData"placeholder="연락처를 입력해주세요"></div>
		</div>
		<div class="subArea">
			<div class="item1">종류</div>
			<div class="item2">				
			<select name="boardCategory" class="Category_sel">
				<option value="동물병원">동물병원</option>
				<option value="애견카페">애견카페</option>
				<option value="카페">카페</option>
				<option value="음식점">음식점</option>
			</select>
			</div>
		</div>
			<div class="subArea">
			<div class="item1">썸네일이미지</div>
			<div class="item2"><input type="file" name="thumbnail" id="thumbnail" class="sendData" accept=".gif, .jpg, .png"></div>
		</div>	  
	</div>
		<textarea id="summernote" name="boardContents" class="boardContents"></textarea>
</form>	

<div class="submitWrap">
	<button type="button" id="writeButton" class="submitButton" >글등록</button>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


$(document).ready(function() {

	// 섬머노트 api 출력
	$('#summernote').summernote({
		  height: 500,                // 에디터 높이
		  width: 1050,				  // 에디터 너비
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
			
			$('#boardTitle').focus();
		}
		else if($('#boardLocation').val().trim() == ""){			
			
			$('#boardLocation').focus();
		}
		else if($('#boardTel').val().trim() == ""){			
			
			$('#boardTel').focus();
		}		
		else{		
			$('#sendForm').submit();
		}
	});
});

//파일 용량 10MB로 제한
$('#thumbnail').on('change',function(){

	let maxSize = 10 * 1024 * 1024;	// 10MB
	let fileSize = document.querySelector('#thumbnail').files[0].size;
	
	if(maxSize < fileSize){
		if(document.querySelectorAll('.subArea')[6] != null){
			document.querySelectorAll('.subArea')[6].remove();
		}
		
		let warnMessage = "<div class='subArea'><div class='item4'>10MB이하 이미지파일만 업로드 가능합니다.</div>"; 
		$('.subArea:eq(5)').after(warnMessage);
		$('#thumbnail').val('');
	}

});

//주소입력시 도로명과 주소명을 찾음
function sample4_execDaumPostcode() {
 new daum.Postcode({
     oncomplete: function(data) {
         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

         // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
         var roadAddr = data.roadAddress; // 도로명 주소 변수
         var extraRoadAddr = ''; // 참고 항목 변수

         // 법정동명이 있을 경우 추가한다. (법정리는 제외)
         // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
         if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
             extraRoadAddr += data.bname;
         }
         // 건물명이 있고, 공동주택일 경우 추가한다.
         if(data.buildingName !== '' && data.apartment === 'Y'){
            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
         }
  
         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         document.querySelector('#boardLocation').value = roadAddr;
      
     }
 }).open();
}



</script>