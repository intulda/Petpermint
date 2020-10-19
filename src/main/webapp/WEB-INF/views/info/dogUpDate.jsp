<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<form name="formInfo" id="_formInfo" method="post" action="/info/dogUpDateAf" enctype="multipart/form-data">

<table class="list_table" style="width:85%;">


<tr>
<td>
<input type="hidden" name="boardSeq" value="${infoDto.boardSeq}"/>
<input type="file" name="thumbnail" size="20" required="required"/>
</td>
</tr>
	<tr>
		<th>아이디</th>
		<td style="text-align: left">${infoDto.boardRegId}</td>
		<td><input type="hidden" name="boardUpdId" value="${infoDto.boardRegId}"> </td>
	</tr>
	<tr>
		<th>제목</th>
		<td style="text-align: left"><input type="text" name="boardTitle" id="boardTitle" value="${infoDto.boardTitle}"> </td>
	</tr>
	<tr>
		<th>작성일</th>
		<td style="text-align: left">${infoDto.boardRegDate}</td>
		<td>${infoDto.boardUpdDate}</td>
	</tr>
	<tr>
		<th rowspan="2">내용</th>		
			<td><img style="width: 300px; height: 200px;" src="${infoDto.filePath}"></td>
	</tr>
	<tr>		
			<td style="text-align: left">
			<textarea rows="10" cols="50" name='boardContents' id="boardContents">${infoDto.boardContents}</textarea>
		</td>
	</tr>
<tr>
	<td colspan="2" style="height:50px; text-align:center;">
		<span>
			<button type="button" id="UpdateBtn">글 수정하기</button>
		</span>
	</td>
</tr>
</table>

</form>

<script type="text/javascript">
$("#UpdateBtn").click(function() {	
	alert('글수정하기');	
	$("#_formInfo").submit();
});
</script>
