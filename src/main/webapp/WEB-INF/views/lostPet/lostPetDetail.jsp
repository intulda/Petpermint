<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<%=request.getContextPath() %>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/lostPet/lostPetDetail.css" />
<fmt:requestEncoding value="utf-8"/>

<title>멍냥 구조대</title>

<br><br>
<div class="inputArea">
<h3 class="title">구조 동물 상세 보기</h3>
<br><br>
<div class="inputArea2">
<div><img src="${lostPetDto.imagePath}" width="500px" height="auto"></div>
<br>
<div>
<span>No.</span>
<span>${lostPetDto.lostSeq}</span>
</div>
<div>
<br>
<span>품종</span>

<span>
<c:if test="${lostPetDto.lostType == 1}">
강아지
</c:if>

<c:if test="${lostPetDto.lostType == 2}">
고양이
</c:if>

<c:if test="${lostPetDto.lostType == 3}">
기타
</c:if>
[${lostPetDto.lostKind}]</span>
</div>
<div>
<span>성별</span>
<span>${lostPetDto.lostGender}</span>
</div>
<div>
<span>장소</span>
<span>${lostPetDto.lostLocation}</span>
</div>
<div>
<span>공고 일자</span>
<span>${lostPetDto.lostWdate}</span>
</div>
<div>
<span>기타 사항</span>
<span>${lostPetDto.lostDetail}</span>
</div>



<div>
<span><a href="lostPetUpdate?lostSeq=${lostPetDto.lostSeq}">수정</a></span>
<span><input type="button" value="삭제" onclick="del(${lostPetDto.lostSeq})"></span>
</div>
</div>
</div>
<br><br>

<br>
<br>
<div class=lcommArea>
	<h3>댓글</h3>
	<div class=lcommArea2>
<textarea id="_lcommContent"></textarea>
<button type="button" id="_lostPetLCommWrite">글쓰기</button>

 <div>
<c:forEach var="c" items="${LCommList}">
  
    
                 <div><span>${c.lcommId}</span></div>
                 <div><span>${c.lcommContent}</span></div>
                <div><span>${c.lcommDate}</span></div>
                 <span><input type="button" value="수정" onclick="upBtn(${c.lcommSeq}, ${c.lostpetSeq})"/>
				 <input type="button" value="삭제" onclick="delBtn(${c.lcommSeq},${c.lostpetSeq})"></span>
				 <br>
				 <br>
         </c:forEach>
         </div>
</div>



</div>













<script type="text/javascript">
function del(seq) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='/lostPet/lostPetDelete?lostSeq='+ seq;
	}
}

$("#_lostPetLCommWrite").click(function(){
	let lostpetSeq= "${lostPetDto.lostSeq}";
	let sendCommData = {lostpetSeq:lostpetSeq, lcommContent:$('#_lcommContent').val()
			};
	console.log(sendCommData);

	$.ajax({
		url:"/lostPet/lostPetLCommWriteAf",
		type:"post",
		data:sendCommData,
		success:function(data){
		//alert("success");

			if(data==='ok'){
				alert("댓글을 작성했습니다.");
				location.href='/lostPet/lostPetDetail?seq=' + lostpetSeq;
			}
			else{
				alert("댓글을 작성하지못했습니다.");
			}
		},
		error:function(){
			alert("댓글 내용을 입력해주세요.");
			}
	});	
});

function upBtn(seq, bseq){
	 
    window.open('/lostPet/lcommUpdate?seq='+seq,'popName',
                'width=1000,height=200,top=500,left=300,toolbar=no,menubar=no,scrollbars=no,resizable=no,status=no');
}


function delBtn(seq, bseq){
	let sendCommDelData = { lcommSeq:seq, lostpetSeq:bseq};
	
	$.ajax({
		url:"/lostPet/lcommDel",
		type:"post",
		data:sendCommDelData,
		success:function(data){
		//alert("success");

			if(data==='ok'){
				confirm('댓글을 삭제하시겠습니까?');
				alert("댓글을 삭제했습니다.");
				location.href='/lostPet/lostPetDetail?seq=' + bseq;
			}
			else{
				alert("댓글 수정 실패.");
			}
		},
		error:function(){
			alert("error");
			}
	});	
}


let gender = "";

if(lostDto.lostGender == '1'){

	gender = "암컷";
}
else if(lostDto.lostGender == '2'){
	gender = "수컷";
}
else{
	gender = "모름";
}


</script>
