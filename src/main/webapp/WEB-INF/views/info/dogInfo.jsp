<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<h1>강아지 백과</h1>

<table>
	<tr>
		<th colspan="3"><h1 class="gallery-title">강아지 훈련</h1> </th>
	</tr>
	<tr>
		<td colspan="3" align="right"><a href="dogTraining">[더보기]</a></td>
	</tr>
	<c:forEach var="in" items="${getInfoList}">
		<c:if test="${in.boardCategory eq 'food' }">
			<tr>
				<td><img style="width: 300px; height: 200px;" src="${in.filePath}"></td>
				<td colspan="2"><a href="dogDetail?seq=${in.boardSeq}">${in.boardTitle}</a></td>
				<td colspan="1">${in.boardRegId}</td>
				<td colspan="1">[더보기]</td>
			</tr>
		</c:if>
	</c:forEach>
</table>

<a href="infoWrite"><button>글쓰기^^</button></a>