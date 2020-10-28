<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/info/infoList.css">

<form name="formInfo" id="_formInfo" method="post/get" action="infoUpDate">
<input type="hidden" name="seq" value="${infoDto.boardSeq}"/>

<div class="dogDetai1lMain">

<div class="maintop">
<a href=""><img src="/images/infoImg/집.png" >홈</a>/
<a href="/info/dogPage">${infoDto.boardType}</a>/
<a href="/info/dogListPageView?Type='${infoDto.boardCategory}'">${infoDto.boardCategory}</a>/
${infoDto.boardTitle}
</div>

<div class="detailTitle">
	${infoDto.boardTitle}
</div>

<hr>

<div class="detailimg">
	<img src="${infoDto.filePath }" width="350px" height="200px">
</div>

<div class="datailDate">
<table >
	<tr>
		<td>· 조회수</td><td>${infoDto.boardViewCount}</td>
	</tr>
<c:if test="${infoDto.boardUpdDate eq null}">
	<tr>
		<td>· 작성자</td><td>${infoDto.boardRegId}</td>
	</tr>
	<tr>
		<td>· 작성일</td><td>${infoDto.boardRegDate}</td>
	</tr>
</c:if>
<c:if test="${infoDto.boardUpdDate ne null}">
	<tr>
		<td>· 작성자</td><td>${infoDto.boardRegId}</td>
	</tr>
	<tr>
		<td>· 작성일</td><td>${infoDto.boardRegDate}</td>
	</tr>
	<tr>
		<td>· 수정인</td><td>${infoDto.boardUpdId}</td>
	</tr>
	<tr>
		<td>· 수정일</td><td>${infoDto.boardUpdDate}</td>
	</tr>
</c:if>
</table>
</div>

<br><br>

<div class="datailContent1">
	<div class="datailContent2">
		${infoDto.boardContents}
	</div>
</div>	

</div>

<%-- <c:if test="${infoDto.boardRegId eq login.id}">	 --%>
<div class="btnDiv">
	<button class="btn" type="button" id="btnUpdate">글 수정하기</button>
	<button class="btn" type="button" id="btnDelete">글 삭제하기</button>
</div>
<%-- </c:if> --%>

</form>

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
