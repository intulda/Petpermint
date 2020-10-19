<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
작성자 : ${dto.lcommId}
<form action="/lostPet/lcommUpdateAf" method="post" id="sendForm" name="sendForm">
	<textarea id="_lcommContent" name="lcommContent">${dto.lcommContent}</textarea>
	<input type='hidden' name='lostpetSeq' value="${dto.lostpetSeq }" >
	<input type='hidden' name='lcommSeq' value="${dto.lcommSeq }" >
</form>
<input type='button' onclick="upBtn('${dto.lostpetSeq}', '${dto.lcommSeq}', '${dto.lcommContent}')" value='수정'/>
<input type='button' onclick='backBtn()' value='취소'/>

<script type="text/javascript">



function upBtn(bseq, seq, con) {

	alert("확인");
	window.opener.name = "parentPage"; // 부모창의 이름 설정
    document.sendForm.target = "parentPage"; // 타켓을 부모창으로 설정
    document.sendForm.action = "/lostPet/lcommUpdateAf";
	$('#sendForm').submit();
	
}
function backBtn() {
	alert('댓글이 수정되지 않았습니다.');
window.opener.location.reload();
window.close();  
}
</script>