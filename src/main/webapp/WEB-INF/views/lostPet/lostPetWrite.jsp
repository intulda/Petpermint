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










