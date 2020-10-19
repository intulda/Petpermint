<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>


<form name="formInfo" id="_formInfo" method="post/get" action="infoUpDate">
<input type="text" name="seq" value="${infoDto.boardSeq}"/>

<table>
	<tr>
		<th>아이디</th>
		<td style="text-align: left">${infoDto.boardRegId}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td style="text-align: left">${infoDto.boardTitle}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td style="text-align: left">${infoDto.boardRegDate}</td>
	</tr>
	<tr>
		<th rowspan="2">내용</th>		
		<td><img style="width: 300px; height: 200px;" src="${infoDto.filePath}"></td>
	</tr>
	<tr>		
		<td style="text-align: left">
			<textarea rows="10" cols="50" name='content' id="_content">${infoDto.boardContents}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
		<span>
			<!--<c:if test="${infoDto.boardRegId eq login.id}">
				</c:if>-->
			<button type="button" id="btnUpdate">글 수정하기</button>
			<button type="button" id="btnDelete">글 삭제하기</button>
		</span>
		</td>
	</tr>
</table>
</form>
</body>


<script type="text/javascript">
$("#btnUpdate").click(function() {	
	alert('글수정하기');		
	$("#_formInfo").attr({"action":"infoUpDate"}).submit();
});

$("#btnDelete").click(function() {	
	alert("삭제하기");
	$("#_formInfo").attr({ "action":"infoDelete" }).submit();
});
</script>
