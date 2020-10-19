<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/lostPet/lostPetWrite.css" />
<fmt:requestEncoding value="utf-8"/>



<div class="inputArea">
<br><br>
<h3 class="title">유기 동물 구조 글쓰기</h3>
<div class="inputArea2">
	<form method="post" class="sendData" id="sendForm" action="/lostPet/lostPetWrite"
		enctype="multipart/form-data">
<br>
아이디<br>
<input type="text" class="label" name="lostId" id="_id" value='aaa' readonly placeholder="아이디"/><br>
<div class="filebox bs3-primary preview-image">
   <input type="file" id="input_file" name="thumbnail" class="upload-hidden" accept=".gif, .jpg, .png"> <br>
		사진<br><input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
			<label for="input_file">사진 첨부</label>
</div> <br>
연락처<br><input type="text" class="label" name="lostPhone" id="_phone" placeholder="-을 포함한 연락처 기재"><br><br>
장소<br><input type="text" class="label" name="lostLocation" id="_location" placeholder="목격/실종 장소"></br><br>
동물<br>
<select name="lostType" id="_type" class="label" >
		<option value="0">동물 선택</option>
		<option value="1">강아지</option>
		<option value="2">고양이</option>
		<option value="3">기타</option>
</select>
<br><br>
품종<br><input type="text" class="label" name="lostKind" id="_kind" placeholder="품종"/><br><br>
상태<br>
<select name="lostStatus" class="label" id="_status">
		<option value="0">상태 선택</option>
		<option value="1">실종</option>
		<option value="2">목격</option>
		<option value="3">기타</option>
</select>
<br><br>
성별<br>
<select name="lostGender" class="label" id="_gender">
		<option value="0">성별 선택</option>
		<option value="1">암컷</option>
		<option value="2">수컷</option>
		<option value="3">모름</option>
</select>
<br><br>
상세<br>
<textarea id="_detail" class="label" name="lostDetail" placeholder="동물의 안전한 귀가를 위한 보다 상세한 정보를 기재해주세요." >
</textarea>
<br>

	</form>
	<br><br>
<button type="button" id="writeButton" >작성 완료</button>
</div>
	</div>




<!-- <div class="filebox">
<label for="tumbnail">업로드</label>
<input type="file" class="label" id="tumbnail" name="thumbnail" ><br>
</div> -->


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





$(document).ready(function() {

	$('#writeButton').click(function(){
		
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


	

/* $("#_lostPetWrite").click(function() {
	
	let sendData = {lostId:$('#_id').val(), lostPhone:$('#_phone').val(),
						lostKind:$('#_kind').val(), lostType:$('#_type').val(),
						lostStatus:$('#_status').val(), lostGender:$('#_gender').val(),
						lostDetail:$('#_detail').val(),
						lostLocation:$('#_location').val()
						};
	
	//console.log(sendData);	
	
	$.ajax({
		url:"/lostPet/lostPetWriteAf",
		type:"post",
		data:sendData,
		success:function(data){
			//alert("success");

			if(data==='ok'){
				alert("글을 작성했습니다.");
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
}); */
</script>








=======
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<h3>글쓰기</h3>
<br>

<div id="inputArea">
	<form method="post" id="sendForm" action="/lostPet/lostPetWrite"
		enctype="multipart/form-data">

아이디 : <input type="text" name="lostId" id="_id" value='aaa', readonly placeholder="아이디"/><br>
파 일 : <input type="file" name="thumbnail" accept=".gif, .jpg, .png"><br>
연락처 : <input type="text" name="lostPhone" id="_phone" placeholder="-을 포함한 연락처 기재"><br>
장소 :  <input type="text" name="lostLocation" id="_location" placeholder="목격/실종 장소"/></br>
동물 :
<select name="lostType" id="_type">
		<option value="0">동물 선택</option>
		<option value="1">강아지</option>
		<option value="2">고양이</option>
		<option value="3">기타</option>
</select>
<br>
품종 : <input type="text" name="lostKind" id="_kind" placeholder="품종"/><br>
상태 :
<select name="lostStatus" id="_status">
		<option value="0">상태 선택</option>
		<option value="1">실종</option>
		<option value="2">목격</option>
		<option value="3">기타</option>
</select>
<br>
성별 :
<select name="lostGender" id="_gender">
		<option value="0">성별 선택</option>
		<option value="1">암컷</option>
		<option value="2">수컷</option>
		<option value="3">모름</option>
</select>
<br>
상세 :
<textarea id="_detail" name="lostDetail" placeholder="동물의 안전한 귀가를 위한 보다 상세한 정보를 기재해주세요." rows="4" cols="50">
</textarea>
<br>

	</form>
</div>

<button type="button" id="writeButton" >글등록</button>


<script type="text/javascript">

$(document).ready(function() {

	$('#writeButton').click(function(){
		
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


	

/* $("#_lostPetWrite").click(function() {
	
	let sendData = {lostId:$('#_id').val(), lostPhone:$('#_phone').val(),
						lostKind:$('#_kind').val(), lostType:$('#_type').val(),
						lostStatus:$('#_status').val(), lostGender:$('#_gender').val(),
						lostDetail:$('#_detail').val(),
						lostLocation:$('#_location').val()
						};
	
	//console.log(sendData);	
	
	$.ajax({
		url:"/lostPet/lostPetWriteAf",
		type:"post",
		data:sendData,
		success:function(data){
			//alert("success");

			if(data==='ok'){
				alert("글을 작성했습니다.");
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
}); */
</script>









>>>>>>> branch 'develop' of https://github.com/intulda/Petpermint

