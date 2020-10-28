<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<%=request.getContextPath()%>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/lostPet/lostPetDetail.css" />
<fmt:requestEncoding value="utf-8" />

<title>멍냥 구조대</title>
<div class="title">구조 동물 상세 보기</div>
<div class="inputArea">
	<div class="titlebox">
		<div class="idbox"><img src=/css/lostPet/lostPetIcon/pencil.png class='icon'>&nbsp;&nbsp;${lostPetDto.lostId}
		&nbsp;&nbsp; | &nbsp;&nbsp;${lostPetDto.lostWdate}
		</div>
		<div class="eye"><img src=/css/lostPet/lostPetIcon/eye2.png class='icon'>&nbsp;&nbsp;${lostPetDto.lostViewcount}</div>
	</div>
<div class="inputArea2">	
	<div class="box1">
			<img src="${lostPetDto.imagePath}" width="420px" height="480px">
</div>
<c:if test="${login.id == null }"><br>
</c:if>
<c:if test="${login.id eq lostPetDto.lostId}">
			<div class="buttonList">
				<span class="item">
				<button type="button" onclick="update(${lostPetDto.lostSeq})">수정</button></span> 
				<span class="item">
					<button type="button" onclick="del(${lostPetDto.lostSeq})">삭제</button>
				</span>
			</div>
</c:if>			
			
		<div class="box2">
			<table><tr><th class="head">No.</th>
						<td class='content'>${lostPetDto.lostSeq}</td></tr>
					<tr><th class='head'>품종</th>
						<td class='content'>
							<c:if test="${lostPetDto.lostType == 1}">강아지</c:if>
							<c:if test="${lostPetDto.lostType == 2}">고양이</c:if> 
							<c:if test="${lostPetDto.lostType == 3}">기타</c:if>
							[${lostPetDto.lostKind}]</td></tr>
					<tr><th class='head'>성별</th>
						<td class='content'>
							<c:if test="${lostPetDto.lostGender == 1}">암컷</c:if>
							<c:if test="${lostPetDto.lostGender == 2}">수컷</c:if>
							<c:if test="${lostPetDto.lostGender == 3}">모름</c:if>
						</td>
					</tr>
					<tr><th class='head'>연락처</th>
						<td class='content'>${lostPetDto.lostPhone}</td>
					</tr>		
					<tr><th class='head'>장소</th>
						<td class='content'>${lostPetDto.lostLocation}</td>
					</tr>
					<tr><th class='head'>일자</th>
						<td class='content'>${lostPetDto.lostWdate}</td>
					</tr>
					</table>
					<br>
		</div>
	</div>
	</div>
	<div  class='head2'><h2>상세 내용</h2></div><br>
	<div class='content2'>${lostPetDto.lostDetail}</div>
	<br> <br>
	<div class=lcommArea>
		<h3 class="comm">댓글(${commCount})</h3>
		<div class=lcommArea2>
			<div class="lcommArea3">
				<h4 class="lcommId">
				<c:if test="${login.id == null}"><br></c:if>
				<c:if test="${login.id != null}"><img src=/css/lostPet/lostPetIcon/pencil.png class='icon'>&nbsp;&nbsp;${login.id}</c:if>
				</h4>
				<c:if test="${login.id != null}">
				<span><textarea id="_lcommContent" placeholder="동물들이 따뜻한 가정의 품으로 돌아 갈 수 있도록 도와주세요"></textarea></span> 
				<span><button type="button" id="_lostPetLCommWrite">글쓰기</button></span>
				</c:if>
				<c:if test="${login.id eq null}">
				<span><textarea id="_lcommContent" placeholder="로그인 후 이용해주세요" readonly></textarea></span> 
				<span><button type="button">글쓰기</button></span>
				</c:if>
			</div>
			<c:forEach var="c" items="${LCommList}">
				<div class="lcommArea4">
					<div>
						<span class="font">${c.lcommId}</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<span class="font2">${c.lcommDate}</span>
					</div><br>
					<div>
						<span class="font">${c.lcommContent}</span>
					</div>
					<div class=button2>
					<c:if test="${(login.id eq c.lcommId || login.auth == 3)}">
					<span><button type="button" onclick="upBtn(${c.lcommSeq}, ${c.lostpetSeq})">수정</button></span>
					<span><button type="button" type="button" value="삭제" onclick="delBtn(${c.lcommSeq},${c.lostpetSeq})">삭제</button></span>
</c:if>
</div>
				</div>
			</c:forEach>
		</div>
</div>
	
<script type="text/javascript">
function del(seq) {
		location.href='/lostPet/lostPetDelete?lostSeq='+ seq;	
}

function update(seq) {
		location.href='/lostPet/lostPetUpdate?lostSeq='+ seq;
}

$("#_lostPetLCommWrite").click(function(){
	let lostpetSeq= "${lostPetDto.lostSeq}";
	let sendCommData = {lostpetSeq:lostpetSeq,lcommId:"${login.id}", lcommContent:$('#_lcommContent').val()
			};
	console.log(sendCommData);

	$.ajax({
		url:"/lostPet/lostPetLCommWriteAf",
		type:"post",
		data:sendCommData,
		success:function(data){

			if(data==='ok'){

				location.href='/lostPet/lostPetDetail?seq=' + lostpetSeq;
			}
			else{

			}
		},
		error:function(){

			}
	});	
});

function upBtn(seq, bseq){

	  var windowW = 700;  // 창의 가로 길이
      var windowH = 250;  // 창의 세로 길이
      var left = Math.ceil((window.screen.width - windowW)/2);
      var top = Math.ceil((window.screen.height - windowH)/2);
      
    window.open('/lostPet/lcommUpdate?seq='+seq,'popName',
    		"l top="+top+", left="+left+", height="+windowH+", width="+windowW);
}


function delBtn(seq, bseq){
	let sendCommDelData = { lcommSeq:seq, lostpetSeq:bseq};
	
	$.ajax({
		url:"/lostPet/lcommDel",
		type:"post",
		data:sendCommDelData,
		success:function(data){

			
			if(data==='ok'){

				location.href='/lostPet/lostPetDetail?seq=' + bseq;
			}
			else{

			}
		},
		error:function(){

			}
	});	
}





</script>
