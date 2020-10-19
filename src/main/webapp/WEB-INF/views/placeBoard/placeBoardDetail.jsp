<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="<%=request.getContextPath() %>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
<div class="place_comm">
	<div class="place_commInput">
	 	<label for="comm_content">comment</label>
	 	<input type="hidden" value="aaa" id="commRegId">	
	 	<textarea rows="40" cols="20" id="comm_content" class="input_comm"
	 	 placeholder="댓글을 입력해주세요"></textarea>
		<button type="button" id="commButton" class="comm_button">입력</button>
	</div>
	<div class="place_commList">
		<div class="comm_listItem">	
		</div>
		<div class="container">
			<nav aria-label="Page navigation">
				<ul class="pagination" id="pagination" style="justify-content: center;"></ul>
			</nav>
		</div>	
	</div>
</div>	

<div class="footer">
	<button type="button" id="updButton">수정</button>
	<button type="button" id="delButton">삭제</button>
</div>






<script>

let boardSeq = ${placeDto.boardSeq};

getBbsListData(0);
getBbsListCount();
			

// 지정 번호에 해당하는 댓글 게시물 출력
function getBbsListData(pNumber){
	
	$.ajax({
		url:"/placeBoard/getCommList",
		type:"post",
		data:{ "pageNumber":pNumber, "recordCountPerPage":5,
				"commRef":${placeDto.boardSeq}
			 },
		success:function( list ){
		
			$('.comm_listItem').html("");
			if(list != null || list !=''){
				$.each(list, function(index, commDto){
					
					let updDate ="";
					if(commDto.commUpdDate != null){
						updDate = "<span class='infoData'>수정날짜</span>"
								+ "<span class='infoData'>"
								+ commDto.commUpdDate
								+ "</span>";
					}

					
					let tagData = "<div class='commHeader'>"
								+ "<span class='infoId'>aaa</span>"
								+ updDate							
								+ "<span class='infoData'>등록날짜</span>"
								+ "<span"
								+ " id='commRegDate"
								+ commDto.commSeq
								+ "'>"
								+ commDto.commRegDate
								+ "</span>"
								+ "<button type='button' id='commUpdButton"
								+ commDto.commSeq
								+ "' onclick=\"commUpdate('"
								+ commDto.commSeq + "','" + commDto.commContent
								+ "')\">수정</button>"
								+ "<button type='button' id='commDelButton"
								+ commDto.commSeq
								+ "' onclick=\"commDelete('"
								+ commDto.commSeq
								+ "')\">삭제</button>"
								+ "</div>"
								+ "<div class='commBody' id='commBody"
								+ commDto.commSeq + "'>"
								+ commDto.commContent
								+ "</div>";




					/*
					let tagData = "<div class='commHeader'>"
								+ "<input type='text' value='aaa' class='commData'>"
								+ "<span class='infoData'>등록날짜  -  </span>"
								+ "<input type='text' value='"
								+ commDto.commRegDate
								+ "' id='commRegDate"
								+ commDto.commSeq
								+ "' class='comRegDate'>"
								+ "<button type='button' id='commUpdButton"
								+ commDto.commSeq
								+ "' onclick=\"commUpdate('"
								+ commDto.commSeq + "','" + commDto.commContent
								+ "')\">수정</button>"
								+ "<button type='button' id='commDelButton"
								+ commDto.commSeq
								+ "' onclick=\"commDelete('"
								+ commDto.commSeq
								+ "')\">삭제</button>"
								+ "</div>"
								+ "<div class='commBody' id='commBody"
								+ commDto.commSeq + "'>"
								+ commDto.commContent
								+ "</div>";
						*/				
					$('.comm_listItem').append(tagData);
				});
			}		
		},
		error:function(){
			alert("error");
		}	
	});	
}

// 댓글의 총 갯수 카운팅
function getBbsListCount(boardCategory){
	$.ajax({
		url:"/placeBoard/getCommCount",
		type:"post",
		data:{"commRef":${placeDto.boardSeq}
			 },
		success:function( count ){
	
			loadPage(count);		
		},
		error:function(){
			alert("error");
		}		
	});	
}


// 댓글의 페이징 출력
function loadPage( totalCount ){

	let pageSize = 5;
	let nowPage = 1;

	let totalPages = 0;

	// 게시물의 갯수가 0일 경우 페이지수를 1로 지정
	if(totalCount == 0){
		totalPages = 1;
	}
	else{	
		// 자바스크립트는 정수결과를 얻기 위해서 정수변환
		totalPages =  parseInt(totalCount / pageSize);
		if(totalCount % pageSize > 0){
		
			totalPages++;
		}
	}
	$("#pagination").twbsPagination('destroy');	// 페이지 갱신
	
	$("#pagination").twbsPagination({
		//startPage: 1,
		totalPages: totalPages,		// 전체 페이지 수
		visiblePages: 5,
		first:'<span aria-hidden="true">«</span>',
		prev:"이전",
		next:"다음",
		last:'<span aria-hidden="true">»</span>',
		initiateStartPageClick:false,		// onPageClick 자동 실행하지 않는다
		onPageClick: function(event, page){
			nowPage = page;
		//	alert('nowPage:' + nowPage);
			getBbsListData( nowPage - 1 );	
		}	
	});
}


// 업데이트 페이지로 이동
$('#updButton').click(function(){
	
	location.href = "/placeBoard/placeBoardUpdate?boardSeq=" + boardSeq;
});

// 게시물 삭제
$('#delButton').click(function(){
	
	$.ajax({
	
		
		url:"/placeBoard/placeBoardDelete",
		type:"post",
		data:{boardSeq},
		success:function(data){
			if(data === 'ok'){
	
				alert("글을 삭제했습니다.");
				location.href = "/placeBoard/placeBoardList" ;
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

// 댓글 등록
$('#commButton').click(function(){
		
	let sendData = {commRef:boardSeq, commRegId:'aaa', 
			commContent:$('#comm_content').val()};
	
	if($('#comm_content').val().trim() == ""){			
		alert("댓글의 내용을 입력하세요");
		$('#comm_content').focus();
	}
	else{	
		$.ajax({
			url:"/placeBoard/placeCommWrite",
			type:"post",
			data: sendData,
			success:function(data){
				
				if(data === 'ok'){
					alert("댓글을 작성했습니다");
					location.href = "/placeBoard/placeBoardDetail?seq=" + boardSeq;
				}
				else{
					alert("댓글을 작성하지 못했습니다");
				}
			},
			error:function(){
				alert("error");
			}
		});
	}
	
});

// 댓글 수정페이지로 전환
function commUpdate(commSeq, commContent){

	let htmlData = "<textarea rows='40' cols='20' class='input_comm' placeholder='댓글을 입력해주세요'"
				 + "id='comm_content"+commSeq +"'>"
				 + commContent
				 + "</textarea>";
				 
	$("#commBody" + commSeq).html(htmlData);
	
	let cancelButton = "<button type='button' onclick=\"commUpdSwitch('"+commSeq +"','"+commContent+"' )\""
 	  				 + "id='cancelButton"
	  				 + commSeq
	  				 + "'>수정취소</button>";
	$("#commRegDate"+ commSeq).after(cancelButton);
	
	let commUpdAfButton = "<button type='button' onclick=\"commUpdateAf('"+commSeq+"')\""
		 + "id='commUpdAfButton"
		 + commSeq
		 + "'>수정완료</button>";
	$("#comm_content" + commSeq).after(commUpdAfButton);
	$("#commUpdButton"+ commSeq).remove();
	
	
}	

// 댓글 출력페이지로 전환
function commUpdSwitch(commSeq, commContent){

	let	 updButton = "<button type='button' id='commUpdButton"
				  + commSeq
				  + "' onclick=\"commUpdate('"
				  + commSeq + "','" + commContent
				  + "')\">수정</button>";
	$("#commBody" + commSeq).html(commContent);
	$("#commRegDate"+ commSeq).after(updButton);
	$("#cancelButton"+ commSeq).remove();
	
}

// 댓글 수정
function commUpdateAf(commSeq){
	
	let commContent = $("#comm_content" + commSeq).val();
	alert(commContent);
	
	$.ajax({
		url:"/placeBoard/PlaceCommUpdate",
		type:"post",
		data: {commSeq:commSeq, commContent:commContent},
		success:function(data){
			if(data === 'ok'){
				alert("댓글을 수정했습니다");
				location.href = "/placeBoard/placeBoardDetail?seq=" + boardSeq;				
			}
			else{
				alert("댓글을 수정하지 못했습니다");
			}		
		},
		error:function(){
			alert("error");
		} 
	});	
}

// 댓글 삭제
function commDelete(commSeq){

	$.ajax({

		url:"/placeBoard/PlaceCommDelete",
		type:"post",
		data:{commSeq:commSeq},
		success:function(data){
			if(data === 'ok'){
				alert("댓글을 삭제했습니다");
				location.href = "/placeBoard/placeBoardDetail?seq=" + boardSeq;				
			}
			else{
				alert("댓글을 삭제하지 못했습니다");
			}			
		},
		error:function(){
			alert("error");
		} 	
	});
}

</script>
