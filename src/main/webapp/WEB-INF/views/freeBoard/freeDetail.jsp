<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href ="/css/freeBoard/freeBoard.css" />
</head>
<body>
<h1 class="detailH1">${dto.boardTitle}</h1>
<p class="detailP">${dto.boardRegDate}</p>
<p class="detailP">${dto.boardUpdDate}</p>

<c:if test="${login != null || login.auth == 3 }">
	<button class="freeUpdate">수정</button>
	<button class="freeDelete">삭제</button>
</c:if>

<br><br>
<hr class="freeDetailHr">
<br><br>

<div class="detailDiv" id="detailDiv">
	<p>${dto.boardContents}</p>
</div>
<br>
<span id="replyCount"></span>개의 댓글
<hr>
<br>
<div class="comm_container">
	<input type="hidden" value="aaa" id="commRedId">
	<label for="comm_content">댓글</label>
	<input type="hidden" value="aaa" id="commRegId">
	<textarea rows="5" cols="40" name="commContents" class="commContents"
	placeholder="댓글을 입력해주세요"></textarea>
 	<c:if test="${login == null }">
		<button type="button" class="notLogin">로그인 후 사용 가능</button>
	</c:if> 
	 <c:if test="${login != null }"> 
		<button type="button" class="commButton">등록하기</button>
	 </c:if> 
</div>
<div class="free_commList">
	<div class="comm_listItem">	
	</div>
	<div class="container">
		<nav aria-label="Page navigation">
			<ul class="pagination" id="pagination"></ul>
		</nav>
	</div>	
</div>



<script type="text/javascript">

$(".freeDelete").click(function(){

	let boardSeq = ${dto.boardSeq};
	
	$.ajax({
		url:"/freeBoard/freeBoardDelete",
		type:"post",
		data:{boardSeq},
		success : function(data){
			if(data === 'ok'){
		//	alert("삭제되었습니다.");
			location.href="/freeBoard/freeBoardViews";
		}else{
		//	alert("글삭제 노노");
			}
		},
		error : function(){
	//	alert("쉽벌");
			}
	});

});

$(".freeUpdate").click(function(){
	
	let boardSeq = ${dto.boardSeq};
	location.href ="/freeBoard/freeBoardUpdateView?boardSeq=" + boardSeq;
	
});

$(".commButton").click(function(){

	let sendData = {
			commContents :$('.commContents').val(), commRef:${dto.boardSeq},
				commRegId:'aaa' };
	
	if($('.commContents').val().trim() == ""){			
		alert("댓글의 내용을 입력하세요");
		$('.commContents').focus();
	}
	else{
	$.ajax({
		url:"/freeBoard/addFreeComm",
		type:"post",
		data:sendData,
		success:function(data){
			if(data == 'ok'){
			//	alert("예아");
				location.href = "/freeBoard/freeDetail?boardSeq=" + ${dto.boardSeq};
			}
			else{
			//	alert("저런..");
			}
			},
			error : function(){
			//	alert("error");
				}
		});
	}
});

getListData(0);
getBbsListCount();

function getListData(pNumber){
	$.ajax({
		url : "/freeBoard/getFreeCommList",
		type : "post",
		data : {"pageNumber":pNumber, "countPerPage":10, "commRef" : ${dto.boardSeq} },
		success : function(list){
		//	console.log(list);

			$.each(list, function(idx, commDTO){

				$('.comm_listItem').empty();
				if(list != null || list !=''){
					$.each(list, function(index, commDTO){

				let updDate ="";
				if(commDTO.commUpdate != null){
					updDate = "<span class='infoData'>수정날짜 </span>"
							+ "<span class='infoData'>"
							+ commDTO.commUpdate
							+ "</span><br>";
				}	
				
			//	console.log(commDTO);
				let app = "<div class='commHeader'>"
					+ "<span class='infoId'>aaa</span><br>"
					+ updDate							
					+ "<span"
					+ " class='infoData' id='commRegDate"
					+ commDTO.commSeq
					+ "'>"
					+ commDTO.commRegDate
					+ "</span>"
					+"	<c:if test='${login != null }'>"
					+ "<a id='commUpdButton"
					+ commDTO.commSeq
					+ "' onclick=\"commUpdate('"
					+ commDTO.commSeq + "','" + commDTO.commContents
					+ "')\" class='commUpdButton'>수정</a>"
					+ "<a id='commDelButton"
					+ commDTO.commSeq
					+ "' onclick=\"commDelete('"
					+ commDTO.commSeq
					+ "')\" class='commDelButton'>삭제</a>"
					+"	</c:if>"
					+ "</div>"
					+ "<div class='commBody' id='commBody"
					+ commDTO.commSeq + "'>"
					+ commDTO.commContents
					+ "</div><hr>";

				$('.comm_listItem').append(app);
				});
				}
				});
			/* getLikeCount(${dto.boardSeq}); */
			},
			error:function(){
			//	alert('아 이거다');
				}
		});
	}

function getBbsListCount(){
	$.ajax({
		url : "/freeBoard/getCommCount",
		type:"post",
		data:{"commRef" : ${dto.boardSeq} },
		success : function(count){
			$("#replyCount").text(count);
			loadPage(count);
		},
		error:function(){
		//	alert("이거냐?");
		}
	});
}

function loadPage(totalCount){
	
	let pageSize = 10;
	let nowPage = 1;

	let totalPages = 0;

	if(totalCount == 0 ){
		totalPages = 1;
	}
	else{
		totalPages = parseInt(totalCount / pageSize);
		if(totalCount % pageSize > 0){
			totalPages++;
		}
	}
	$("#pagination").twbsPagination('destroy');

	$("#pagination").twbsPagination({
		
		totalPages : totalPages,
		visiblePages: 5,
		first:'<span aria-hidden="true">«</span>',		
		prev:"이전",
		next:"다음",
		last:'<span aria-hidden="true">»</span>',		
		initiateStartPageClick:false,					
		onPageClick: function(event, page){				
			nowPage = page;
			//alert("nowPage = " + nowPage);
			getListData(nowPage - 1);
		}
	});
}

function commDelete(commSeq){

	$.ajax({
		url:"/freeBoard/freeCommDelete",
		type:"post",
		data:{commSeq:commSeq},
		success:function(data){
			if(data === 'ok'){
			//	alert("댓글삭제");
				location.href = "/freeBoard/freeDetail?boardSeq=" + ${dto.boardSeq};
				}
			else{
			//	alert("인생");
				}
			},
			error : function(){
			//	alert('error');
				}
		});
}

function commUpdate(commSeq, commContents){

	let htmlData = "<textarea rows='5' cols='40' class='input_comm' placeholder='댓글을 입력해주세요'"
				 + "id='comm_content"+commSeq +"'>"
				 + commContents
				 + "</textarea>";
				 
	$("#commBody" + commSeq).html(htmlData);
	
	let cancelButton = "<a onclick=\"commUpdSwitch('"+commSeq +"','"+commContents+"' )\""
 	  				 + "id='cancelButton"
	  				 + commSeq
	  				 + "'> 수정취소</a>";
	$("#commRegDate"+ commSeq).after(cancelButton);
	
	let commUpdAfButton = "<a onclick=\"commUpdateAf('"+commSeq+"')\""
		 + "id='commUpdAfButton"
		 + commSeq
		 + "' class='commUpdateAf'>수정완료</a>";
	$("#comm_content" + commSeq).after(commUpdAfButton);
	$("#commUpdButton"+ commSeq).remove();
	
	
}

function commUpdSwitch(commSeq, commContent){

	let	 updButton = "<a id='commUpdButton"
				  + commSeq
				  + "' onclick=\"commUpdate('"
				  + commSeq + "','" + commContent
				  + "')\"  class='commUpdButton'>수정</a>";
	$("#commBody" + commSeq).html(commContent);
	$("#commRegDate"+ commSeq).after(updButton);
	$("#cancelButton"+ commSeq).remove();
	
}


function commUpdateAf(commSeq){

	let commContents = $("#comm_content" + commSeq).val();
//	alert(commContents);

	$.ajax({
		url:"/freeBoard/freeCommUpdate",
		type:"post",
		data:{commSeq:commSeq , commContents:commContents},
		success:function(data){
			if(data === 'ok'){
			//	alert("댓글수정");
				location.href = "/freeBoard/freeDetail?boardSeq=" + ${dto.boardSeq};
			}
			else{
			//	alert("인생");
				}
			},
			error:function(){
			//	alert('error');
			}
		});	
}

$(".likeButton").click(function (){

	/* 	var click = true; */

	$.ajax({
		url : "/freeBoard/freeLikeButton",
		type:"post",
		data : {boardSeq : ${dto.boardSeq},
				id : 'aaa'},
		success:function(data){
			if(data === 1){
			// alert("좋아용");
		}
		else if(data === 0){
			//alert('싫어용');
			boardLikeSeq--;
			
		}
		},
		error:function(){
			alert("error");
			}
		});	
});

/*  function getLikeCount(num){

//	alert(num)
	
	 $.ajax({
		url : "/freeBoard/getLikeCount",
		type:"post",
		data: { boardSeq : num },
		success : function(count){
			$("#LikeCount").html(count);
		},
		error:function(){
			alert("error");
		}
	});
}
 */
 
 $('.likeButton').click(function(){
	  if($(this).hasClass('btn_unlike')){
	    $(this).removeClass('btn_unlike');
	    $('.ani_heart_m').removeClass('hi');
	    $('.ani_heart_m').addClass('bye');
	  }
	  else{
	    $(this).addClass('btn_unlike');
	    $('.ani_heart_m').addClass('hi');
	    $('.ani_heart_m').removeClass('bye');
	  }
});


</script>
</body>	
</html>