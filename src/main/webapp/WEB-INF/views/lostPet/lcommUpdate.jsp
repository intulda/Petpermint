<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/lostPet/lostPetDetail.css" />

<form action="/lostPet/lcommUpdateAf" method="post" id="sendForm"
	name="sendForm">
		<input type='hidden' name='lostpetSeq' value="${dto.lostpetSeq}">
		<input type='hidden' name='lcommSeq' value="${dto.lcommSeq}">
	<div class=lcommAreaPop>
<!-- 	<div class="homeBtn"><button type="button" class="homeBtn" onclick="backBtn()"><img src=/css/lostPet/lostPetIcon/arrow2.png class='icon'></button></div> -->
	<div>
		<h3 class="comm"><img src=/css/lostPet/lostPetIcon/pencil.png class='icon'>${dto.lcommId}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.lcommDate}</h3>
		</div>
			<div class="lcommArea5">
				<span class="item"><textarea id="_lcommContent" name="lcommContent">${dto.lcommContent}</textarea></span>
				<span class="item"><button type="button" onclick="upBtn('${dto.lostpetSeq}', '${dto.lcommSeq}', '${dto.lcommContent}')">수정</button></span>
			</div>
		</div>
</form>

<script type="text/javascript">

function upBtn(bseq, seq, con) {

	window.opener.name = "parentPage"; // 부모창의 이름 설정
    document.sendForm.target = "parentPage"; // 타켓을 부모창으로 설정
    document.sendForm.action = "/lostPet/lcommUpdateAf";
	$('#sendForm').submit();
	
}
function backBtn() {
window.opener.location.reload();
window.close();  
}
</script>