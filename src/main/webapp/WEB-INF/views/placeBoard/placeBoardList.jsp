<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<script src="<%=request.getContextPath() %>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/placeBoard/placeList.css" />


<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px">
	<tr>
		<td style="padding-left: 5px">
			<select id="_category" name="category">
				<option value="" selected="selected">선택</option>
				<option value="title">장소명</option>
				<option value="content">내용</option>
				<option value="address">주소</option>		
			</select>
		</td>
		<td style="padding-left: 5px">
			<input type="text" id="_keyword" name="keyword">		
		</td>
		<td style="padding-left: 5px">
			<button type="button" id="findButton">검색</button>		
		</td>
	</tr>
</table>


<div class="header">	
	<ul class="board_list">
		<li><button type="button" onclick="selCategory(this.value)" value="동물병원">동물병원</button></li>
		<li><button type="button" onclick="selCategory(this.value)" value="애견카페">애견카페</button></li>
		<li><button type="button" onclick="selCategory(this.value)" value="카페">카페</button></li>
		<li><button type="button" onclick="selCategory(this.value)" value="음식점">음식점</button></li>
	</ul>
</div>



<div class="place_title">
	<p>&nbsp;&nbsp;<a href="#" style="color:grey">홈/</a></p>
	<h2>펫플레이스</h2>
	<p class="intro">반려동물의 동반장소를 소개해드립니다</p>
</div>


<div class="place_container">	
</div>


<div class="header">	
	<ul class="board_list">
		<li><button type="button" id="writeButton">글쓰기</button></li>
	</ul>
</div>


<div class="container">
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination" style="justify-content: center;"></ul>
	</nav>
</div>


<script>

getBbsListData(0);
getBbsListCount();

let boardCategory ="";

$('#findButton').click(function(){
	getBbsListData(0);
	getBbsListCount();
});

$('#writeButton').click(function(){
	location.href = "/placeBoard/placeBoardWriteView";	
});

// 카테고리 선택
function selCategory(BoardCategory){
	boardCategory = BoardCategory;
	getBbsListData(0,boardCategory);
	getBbsListCount(boardCategory);
}

// 누른 페이지를 적용해서 게시물 출력

function getBbsListData( pNumber, boardCategory ){
	
	$.ajax({
		url:"/placeBoard/getPlaceBoardList",
		type:"post",
		data:{ "pageNumber":pNumber, "recordCountPerPage":10, 
			"category":$("#_category").val(), "keyword":$("#_keyword").val(),
			"boardCategory":boardCategory
			 },
		success:function( list ){
		
			$(".place_content").remove();
			if(list == null || list ==''){
				let tagData = "<div class='place_content'>"
							+ "<div class='place_item2'>"
							+ "<p>해당결과가 없습니다.</p></div>"
							+ "</div>";
				$('.place_container').append(tagData);
			}
			else{	
				$.each(list, function(index, placeDto){
					
					let tagData = "<div class='place_content'>"
								+ "<div class='place_item'>"
								+ "<img src='" 
								+ placeDto.imagePath
								+ "'></div>"
								+ "<div class='place_item2'>"
								+ "<div><p>"
								+ placeDto.boardRegDate
								+ "</p></div>"
								+ "<div><h1>"
								+ placeDto.boardTitle
								+ "</h1></div>"
								+ "<div><p>"
								+ placeDto.boardCategory
								+ "</p></div>"
								+ "<div><p>"
								+ placeDto.boardLocation
								+ "</p></div>"
								// 연락처 추가
								+ "<div><a href='/placeBoard/placeBoardDetail?seq="
								+ placeDto.boardSeq
								+ "' class='detailButton'>더알아보기</a></div>"
								+ "</div>";
	
					$('.place_container').append(tagData);
				});
			}
						
		},
		error:function(){
			alert("error");
		}	
	});	
}

// 글의 갯수 카운트
function getBbsListCount(boardCategory){
	$.ajax({
		url:"/placeBoard/getCount",
		type:"post",
		data:{	"category":$("#_category").val(), "keyword":$("#_keyword").val(),
			"boardCategory":boardCategory
			 },
		success:function( count ){
	
			loadPage(count);		
		},
		error:function(){
			alert("error");
		}		
	});	
}


// 지정한 번호에 맞게 게시물 출력 및 페이징 출력
function loadPage( totalCount ){

	let pageSize = 10;
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

</script>


