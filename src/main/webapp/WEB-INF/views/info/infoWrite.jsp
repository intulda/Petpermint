<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
.table1{
border: 1px solid black;
color: pink;
}


</style>


<form name="_frmForm" id="_frmForm" method="post" action="dogWriteAf" enctype="multipart/form-data">
<input type="file" name="thumbnail" size="20" required="required"><br>

<table class="table1">
	<tr>
		<td>
			<select id="boardType" name="boardType">
				<option>선택</option>
				<option value="강아지">강아지</option>
				<option value="고양이">고양이</option>
			</select>
		</td>
		<td>
			<select id="boardCategory" name="boardCategory">
				<option>선택</option>
				<option value="음식">[음식]</option>
				<option value="훈련">[행동]</option>
				<option value="백과">[백과]</option>		
			</select>
		</td>
	</tr>
		
	<tr>
		<th>제목</th>
		<td style="text-align: left">
			<input type="text" size="60" id="boardTitle" name="boardTitle"/>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left">
			<textarea rows="10" cols="50" id="boardContents" name="boardContents"></textarea>
		</td>
	</tr>
	<tr>
		<td>
		<button type="button" id="dogwirte">글쓰기</button>
		
		</td>
	</tr>
</table>
</form>


<script type="text/javascript">
$("#dogwirte").click(function() {	
	alert('글작성');	
	$("#_frmForm").attr({"action":"dogWriteAf"}).submit();	
});



</script>

