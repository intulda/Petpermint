<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<script src="<%=request.getContextPath() %>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/placeBoard/placeList.css" />




<div class="main_title">펫플레이스</div>

<div class="header">	
	<ul class="board_list">
		<li><button type="button" onclick="selCategory(this.value)" value="동물병원">동물병원</button></li>
		<li><button type="button" onclick="selCategory(this.value)" value="애견카페">애견카페</button></li>
		<li><button type="button" onclick="selCategory(this.value)" value="카페">카페</button></li>
		<li><button type="button" onclick="selCategory(this.value)" value="음식점">음식점</button></li>
	</ul>
	
	<table class="sel_tb">
	<tr>
		<td style="padding-left: 5px" >
			<div  class="box">
				<select id="_category" name="category">
					<option value="" selected="selected">선택</option>
					<option value="title">장소명</option>
					<option value="content">내용</option>
					<option value="address">주소</option>			
				</select>
			</div>
		</td>
		<td class="placeBoard__search" style="padding-left: 5px">
			<input type="text" id="_keyword" name="keyword" class='search-txt'>
			<label for="_keyword"  id="findButton"></label>
		</td>
	</tr>
</table>
</div>







<div class="header_title">
	<p>&nbsp;&nbsp;<a href="/" style="color:grey">홈/</a></p>
	<h2>펫플레이스</h2>
	<p class="intro">반려동물의 동반장소를 소개해드립니다</p>
</div>


<div class="place_container">	
</div>

<c:if test="${login != null }">
	<div class="header">	
		<ul class="bottom_list">
			<li><button type="button" id="writeButton">글쓰기</button></li>
		</ul>
	</div>
</c:if>

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
		data:{ "pageNumber":pNumber, "recordCountPerPage":9, 
			"category":$("#_category").val(), "keyword":$("#_keyword").val(),
			"boardCategory":boardCategory
			 },
		success:function( list ){
			console.log(list);
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
								+ "<p>"
								+ "<img src='../images/placeImg/reg_date.png' class='reg_date'>"
								+ placeDto.boardRegDate
								+ "</p>"
								+ "<h1>"
								+ placeDto.boardTitle
								+ "</h1>"
								+ "<p>종류 : "
								+ placeDto.boardCategory
								+ "</p>"
								+ "<p>주소 : "
								+ placeDto.boardLocation
								+ "</p>"
								+ "<p>연락처 : "
								+ placeDto.boardTel
								+ "</p>"
								
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
			getBbsListData( nowPage - 1 );	
		}	
	});
}

</script>


