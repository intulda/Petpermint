<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

작성자 : ${dto.lcommId}
<textarea id="_lcommContent">${dto.lcommContent}</textarea>
<input type='button' id='sucBtn' value='수정 완료'/>
<input type='button' onclick='backBtn()' value='취소'/>



<script type="text/javascript">

function backBtn() {
	alert('댓글이 수정되지 않았습니다.');
window.opener.location.reload();
window.close();  
}


</script>