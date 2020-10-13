<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/placeBoard/placeDetail.css" />


<div class="place_title">
	<p class="board_info">
	게시날짜 : ${placeDto.boardRegDate }  (ID : ${placeDto.boardRegId })
	</p>
	<c:if test="${placeDto.boardUpdDate  != null }">
		<P class="board_info">
		수정날짜 : ${placeDto.boardUpdDate } (ID : ${placeDto.boardUpdId })
		</p>
	</c:if>
</div>

<div class="place_container">
<h1 class="boardTitle">${placeDto.boardTitle }</h1>
<div class="place_content">${placeDto.boardContents }</div>
<hr class="bottom_line"></hr>
</div>

<div class="footer">
	<button type="button" id="updButton">수정</button>
	<button type="button" id="delButton">삭제</button>
</div>


<script>

$('#updButton').click(function(){
	let boardSeq = "${placeDto.boardSeq}";
	location.href = "/placeBoard/placeBoardUpdate?boardSeq=" + boardSeq;
});


$('#delButton').click(function(){
	let boardSeq = ${placeDto.boardSeq};
	$.ajax({
	
		
		url:"/placeBoard/placeBoardDelete",
		type:"post",
		data:{boardSeq},
		success:function(data){
			if(data === 'ok'){
	
				alert("글을 삭제했습니다.");
				location.href = "/placdBoard/getPlaceBoardList";
			}
			else{
				alert("글을 삭제하지 못했습니다.");
				
			}
		},
		error:function(){
				alert("실패");
		}
	});
	
});


</script>






    

