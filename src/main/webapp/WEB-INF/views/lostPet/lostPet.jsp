<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<%=request.getContextPath() %>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/lostPet/lostPet.css" />
<fmt:requestEncoding value="utf-8"/>

<title>멍냥 구조대</title>

<br>
<br>
<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px">
	<tr>
		<td style="padding-left: 5px">
			<select id="_category" name="category">
				<option value="" selected="selected">선택</option>
				<option value="lostId">작성자</option>
				<option value="lostLocation">지역</option>		
			</select>
		</td>
		<td style="padding-left: 5px">
			<input type="text" id="_keyword" name="keyword">		
		</td>
		<td style="padding-left: 5px">
			<button type="button" id="findButton">검색</button>		
			<button type="button" id="writeButton">글쓰기</button>
		</td>
	</tr>
</table>
<br>

<div class="lost_container1">	
</div>

<br><br>


<div class="container">
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination" style="justify-content: center;"></ul>
	</nav>
</div>

<script>

getBbsListData(0);
getBbsListCount();



$('#findButton').click(function(){
	getBbsListData(0);
	getBbsListCount();
});

$('#writeButton').click(function(){
	location.href = "/lostPet/lostPetWriteView";	
});


//페이징 함수

function getBbsListData( pNumber){
	
	$.ajax({
		url:"/lostPet/getLostPet",
		type:"post",
		data:{ "pageNumber":pNumber, "recordCountPerPage":9, 
			"category":$("#_category").val(), "keyword":$("#_keyword").val(),
			
			 },
		success:function( list ){
			
			$(".lost_container2").remove();
			if(list == null || list ==''){
				let tagData = "<div class='lost_container2'>"
							+ "<div class='lost_content'>"
							+ "<p>작성 된 글이 없습니다.</p></div>"
							+ "</div>";
				$('.lost_container1').append(tagData);
			}
			else{	
				$.each(list, function(index, lostDto){
					//alert(lostDto.lostSeq);
					//alert(lostDto.imagePath);
					let tagData = "<div class='lost_container2'>"
								+ "<div class='lost_content'>"									
								+ "<div><p>"
								+ "NO .&nbsp;"+ lostDto.lostSeq
								+ "</p></div>"
								+ "<img src='" 
								+ lostDto.imagePath
								+ "' width='250px' height='300px'>"
								+ "<br><br><div><h5>"
								+ "품종&nbsp;&nbsp;"+lostDto.lostType+"&nbsp;["+lostDto.lostKind+"]"
								+ "</h5></div>"
								+ "<div><p>"
								+ "성별&nbsp;&nbsp;"+lostDto.lostGender
								+ "</p></div>"
								+ "<div><p>"
								+ "공고일자&nbsp;&nbsp;"+lostDto.lostLocation
								+ "</p></div>"
								+ "<div><p>"
								+ "구조일&nbsp;&nbsp;"+lostDto.lostWdate
								+ "</p></div>"
								+ "<div><a href='/lostPet/lostPetDetail?seq="
								+ lostDto.lostSeq
								+ "' class='detailButton'>상세보기</a></div>"
								+ "</div>";
	
					$('.lost_container1').append(tagData);
					
				});
					
			}
						
		},
		error:function(){
			alert("error1");
		}	
	});	
}
//글의 총수를 취득
function getBbsListCount(){
	$.ajax({
		url:"/lostPet/getCount",
		type:"post",
		data:{ "pageNumber":0, "recordCountPerPage":9, 
			"category":$("#_category").val(), "keyword":$("#_keyword").val()
			 },
		success:function( count ){
		//	alert("success");
		//	alert(count);	
			loadPage(count);		
		},
		error:function(){
			alert("error2");
		}		
	});	
}


// paging 처리
function loadPage( totalCount ){

	let pageSize = 10;
	let nowPage = 1;

	let totalPages = totalCount / pageSize;
	if(totalCount % pageSize > 0){
		totalPages++;
	}

	$("#pagination").twbsPagination('destroy');	// 페이지 갱신
	
	$("#pagination").twbsPagination({
	//	startPage: 1,
		totalPages: totalPages,		// 전체 페이지 수
		visiblePages: 9,
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