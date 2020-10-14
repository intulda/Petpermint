<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<h3>글쓰기</h3>
<br>

아이디 : <input type="text" id="_id" placeholder="아이디"/><br>

연락처 : <input type="text" id="_phone" placeholder="-을 포함한 연락처 기재"><br>

장소 :  <input type="text" id="_location" placeholder="목격/실종 장소"/></br>

동물 :
<select name="type" id="_type">
		<option value="0">동물 선택</option>
		<option value="1">강아지</option>
		<option value="2">고양이</option>
		<option value="3">기타</option>
</select>
<br>

품종 : <input type="text" id="_kind" placeholder="품종"/><br>

상태 :
<select name="status" id="_status">
		<option value="0">상태 선택</option>
		<option value="1">실종</option>
		<option value="2">목격</option>
		<option value="3">기타</option>
</select>
<br>

성별 :
<select name="gender" id="_gender">
		<option value="0">성별 선택</option>
		<option value="1">암컷</option>
		<option value="2">수컷</option>
		<option value="3">모름</option>
</select>
<br>

상세 :
<textarea id="_detail" name="detail" placeholder="동물의 안전한 귀가를 위한 보다 상세한 정보를 기재해주세요." rows="4" cols="50">
</textarea>
<br>

<a id="_lostPetWrite" title="글쓰기">		
	<img src="/images/bwrite.png" alt="글쓰기" />
</a>


<script type="text/javascript">
$("#_lostPetWrite").click(function() {
	
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
});
</script>









