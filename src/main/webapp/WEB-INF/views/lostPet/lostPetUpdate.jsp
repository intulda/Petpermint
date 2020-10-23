<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/lostPet/lostPetWrite.css" />
<fmt:requestEncoding value="utf-8"/>


<div class="inputArea">
<br><br>
<h3 class="title">글 수정하기</h3>
<div class="inputArea2">
	<form method="post" id="sendForm" action="/lostPet/lostPetUpdateAf"
			enctype="multipart/form-data">

<br>
<h5>등록 번호 : '${lostPetDto.lostSeq}' </h5>
<br>	
<input type="hidden" class="label" name="lostSeq" value="${lostPetDto.lostSeq}">
아이디<br>
<input type="text" class="label" name="lostId"  id="_id" value='${lostPetDto.lostId}' placeholder="아이디" />
<div class="filebox bs3-primary preview-image">
   <input type="file" id="input_file" name="thumbnail" class="upload-hidden" accept=".gif, .jpg, .png"> <br>
		사진<br><input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
			<label for="input_file">사진 첨부</label>
</div> <br>
연락처<br><input type="text" class="label" name="lostPhone" id="_phone" value='${lostPetDto.lostPhone}' placeholder="-을 포함한 연락처 기재"/><br>
장소<br><input type="text" class="label" name="lostLocation" id="_location" value='${lostPetDto.lostLocation}' placeholder="목격/실종 장소"/></br>
동물<br>
<select name="lostType" id="_type" class="label">
		<option value="0">동물 선택</option>
		<option value="1">강아지</option>
		<option value="2">고양이</option>
		<option value="3">기타</option>
</select>
<br>
품종<br> <input type="text" class="label" name="lostKind" id="_kind" value='${lostPetDto.lostKind}'placeholder="품종"/><br>
상태<br>
<select name="lostStatus" id="_status" class="label">
		<option value="0">상태 선택</option>
		<option value="1">실종</option>
		<option value="2">목격</option>
		<option value="3">기타</option>
		<option value="4">구조 완료</option>
</select>
<br>
성별<br>
<select name="lostGender" id="_gender" class="label">
		<option value="0">성별 선택</option>
		<option value="1">암컷</option>
		<option value="2">수컷</option>
		<option value="3">모름</option>
</select>
<br>
상세<br>
<textarea id="_detail" class="label" name="lostDetail" rows="4" cols="50">
${lostPetDto.lostDetail}</textarea>
<br>
	</form>	

<button type="button"id="updateButton" >글수정하기</button>
</div>
</div>



<script type="text/javascript">

$(document).ready(function(){
	   var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            // 파일명 추출
	            var filename = $(this)[0].files[0].name;
	        } 

	        else {
	            // Old IE 파일명 추출
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        };

	        $(this).siblings('.upload-name').val(filename);
	    });

	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();

	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }

	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	});

$(document).ready(function(){	
	let type ='${lostPetDto.lostType}';
	let sel = document.querySelector('#_type');
	for(i=0; i < sel.length; i++){
		if(sel.options[i].value == type){
			sel.options[i].selected =true;
		}	
	}
});

$(document).ready(function(){	
	let status ='${lostPetDto.lostStatus}';
	let sel = document.querySelector('#_status');
	for(i=0; i < sel.length; i++){
		if(sel.options[i].value == status){
			sel.options[i].selected =true;
		}	
	}
		
});

$(document).ready(function(){	
	let gender ='${lostPetDto.lostGender}';
	let sel = document.querySelector('#_gender');
	for(i=0; i < sel.length; i++){
		if(sel.options[i].value == gender){
			sel.options[i].selected =true;
		}	
	}
});

$(document).ready(function() {

	$('#updateButton').click(function(){
		
		if($('#_phone').val().trim() == ""){			
			alert("연락처를 입력해주세요");
			$('#_phone').focus();
		}
		else if($('#_location').val().trim() == ""){			
			alert("실종/발견 장소를 입력해주세요");
			$('#_location').focus();
		}
		else if($('#_type').val() == 0){			
			alert("강아지/고양이를 선택해주세요");
			$('#_type').focus();
		}
		else if($('#_kind').val().trim() == ""){			
			alert("품종을 입력해주세요");
			$('#_kind').focus();
		}
		else if($('#_status').val() == 0){			
			alert("실종/목격 중 선택해주세요");
			$('#_status').focus();
		}
		else if($('#_gender').val() == 0){			
			alert("성별을 선택해주세요");
			$('#_gender').focus();
		}
		else{		
			$('#sendForm').submit();
		}
	});

});


	

/* 

$("#_lostPetUpdate").click(function() {
	
	let sendData = {lostId:$('#_id').val(), lostPhone:$('#_phone').val(),
						lostKind:$('#_kind').val(), lostType:$('#_type').val(),
						lostStatus:$('#_status').val(), lostGender:$('#_gender').val(),
						lostDetail:$('#_detail').val(),
						lostLocation:$('#_location').val(), lostSeq:'${lostPetDto.lostSeq}'
						};
	
	//console.log(sendData);	
	
	$.ajax({
		url:"/lostPet/lostPetUpdateAf",
		type:"post",
		data:sendData,
		success:function(data){
			//alert("success");

			if(data==='ok'){
				alert("수정이 완료됐습니다.");
				location.href='/lostPet/lostPet';
			}
			else{
				alert("글을 작성하지못했습니다.");
			}
	
		},
		error:function(){
			alert("error");
		}

	});
	//$("#_lostPetInfo").attr("action":"lostPetWriteAf").submit();	
});


 */
</script>
