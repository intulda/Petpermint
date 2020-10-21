<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="<%=request.getContextPath()%>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/lostPet/lostPetDetail.css" />
<fmt:requestEncoding value="utf-8" />

<title>멍냥 구조대</title>


<div class="inputArea">
	<h3 class="title">구조 동물 상세 보기</h3>
	<div class="titlebox">
		<div class="idbox"><img src=/css/lostPet/lostPetIcon/pencil.png class='icon'>&nbsp;&nbsp;${lostPetDto.lostId}
		&nbsp;&nbsp; ${lostPetDto.lostWdate}
		</div>
		<div class="eye"><img src=/css/lostPet/lostPetIcon/eye2.png class='icon'>&nbsp;&nbsp;${lostPetDto.lostViewcount}</div>
	</div>
<div class="inputArea2">	
	<div class="box1">
			<img src="${lostPetDto.imagePath}" width="420px" height="auto">
</div>
		<div class="box2">

			<div><span>No.</span> <span>${lostPetDto.lostSeq}</span>
			<span>품종</span></div> <span><c:if
						test="${lostPetDto.lostType == 1}">
강아지
</c:if> <c:if test="${lostPetDto.lostType == 2}">
고양이
</c:if> <c:if test="${lostPetDto.lostType == 3}">
기타
</c:if> [${lostPetDto.lostKind}]</span></li>

			<div><span>성별</span> 
<span> <c:if
						test="${lostPetDto.lostGender == 1}">
암컷
</c:if> <c:if test="${lostPetDto.lostGender == 2}">
수컷
</c:if> <c:if test="${lostPetDto.lostGender == 3}">
기타
</c:if>

			</span></div>
			<div><span>장소</span> <span>${lostPetDto.lostLocation}</span></div>
			<div><span>공고 일자</span> <span>${lostPetDto.lostWdate}</span></div>
			<div><span>기타 사항</span> <span>${lostPetDto.lostDetail}</span></div>

			<div class="buttonList">
				<span class="item">
				<button type="button" onclick="update(${lostPetDto.lostSeq})">수정</button></span> 
				<span class="item">
					<button type="button" onclick="del(${lostPetDto.lostSeq})">삭제</button>
				</span>
			</div>
		</div>
	</div>
	</div>
	<br> <br>
	<div class=lcommArea>
		<h3 class="comm">댓글()</h3>
		<div class=lcommArea2>
			<div class="lcommArea3">
				<h4 class="lcommId">아이디</h4>
				<span><textarea id="_lcommContent" placeholder="동물들이 따뜻한 가정의 품으로 돌아 갈 수 있도록 도와주세요"></textarea></span> 
				<span><button type="button" id="_lostPetLCommWrite">글쓰기</button></span>
			</div>


			<c:forEach var="c" items="${LCommList}">
				<div class="lcommArea4">
					<div>
						<span>${c.lcommId}</span>
					</div>
					<div>
						<span>${c.lcommDate}</span>
					</div>
					<div>
						<span>${c.lcommContent}</span>
					</div>
					<div class=button2>
					<span><button type="button" onclick="upBtn(${c.lcommSeq}, ${c.lostpetSeq})">수정</button></span>
					<span><button type="button" type="button" value="삭제" onclick="delBtn(${c.lcommSeq},${c.lostpetSeq})">삭제</button></span>
</div>
				</div>

			</c:forEach>


		</div>
</div>
	

<script type="text/javascript">
function del(seq) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='/lostPet/lostPetDelete?lostSeq='+ seq;
	}
}

function update(seq) {
	var chk = confirm("수정 페이지로 이동합니다.");
	if (chk) {
		location.href='/lostPet/lostPetUpdate?lostSeq='+ seq;
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
                'width=850,height=200,top=500,left=300,toolbar=no,menubar=no,scrollbars=no,resizable=no,status=no');
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





</script>
