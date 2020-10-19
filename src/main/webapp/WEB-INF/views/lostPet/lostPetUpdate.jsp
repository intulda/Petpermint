<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/lostPet/lostPet.css" />
<fmt:requestEncoding value="utf-8"/>


<div id="inputArea">
	<div id="inputArea">
	<form method="post" id="sendForm" action="/lostPet/lostPetUpdateAf"
			enctype="multipart/form-data">
<h3>등록 정보 변경</h3>
<br>
<h5>등록 번호 : '${lostPetDto.lostSeq}' </h5>
<br>	
<input type="hidden" name="lostSeq" value="${lostPetDto.lostSeq}">
아이디 : <input type="text" name="lostId"  id="_id" value='${lostPetDto.lostId}' placeholder="아이디" /><br>
파 일 : <input type="file" name="thumbnail" accept=".gif, .jpg, .png"><br>
연락처 : <input type="text" name="lostPhone" id="_phone" value='${lostPetDto.lostPhone}' placeholder="-을 포함한 연락처 기재"/><br>
장소 :  <input type="text" name="lostLocation" id="_location" value='${lostPetDto.lostLocation}' placeholder="목격/실종 장소"/></br>
동물 :
<select name="lostType" id="_type"  >
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
		<option value="4">구조 완료</option>
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
<textarea id="_detail" name="lostDetail" rows="4" cols="50">
${lostPetDto.lostDetail}</textarea>
<br>
	</form>	

<button type="button" id="updateButton" >글수정하기</button>
</div>
</div>



<script type="text/javascript">

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
=======
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<h3>수정</h3>
<br>
<h5>시퀀스 : '${lostPetDto.lostSeq}' </h5>

	<form method="post" id="sendForm" action="/lostPet/lostPetUpdateAf"
			enctype="multipart/form-data">	
<input type="hidden" name="lostSeq" value="${lostPetDto.lostSeq}">
아이디 : <input type="text" name="lostId"  id="_id" value='${lostPetDto.lostId}' placeholder="아이디" /><br>
파 일 : <input type="file" name="thumbnail" accept=".gif, .jpg, .png"><br>
연락처 : <input type="text" name="lostPhone" id="_phone" value='${lostPetDto.lostPhone}' placeholder="-을 포함한 연락처 기재"/><br>
장소 :  <input type="text" name="lostLocation" id="_location" value='${lostPetDto.lostLocation}' placeholder="목격/실종 장소"/></br>
동물 :
<select name="lostType" id="_type"  >
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
		<option value="4">구조 완료</option>
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
<textarea id="_detail" name="lostDetail" rows="4" cols="50">
${lostPetDto.lostDetail}</textarea>
<br>
	</form>	

<button type="button" id="updateButton" >글수정하기</button>

<script type="text/javascript">

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
>>>>>>> branch 'develop' of https://github.com/intulda/Petpermint
</script>
