<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<%=request.getContextPath() %>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/info/infoList.css">
<fmt:requestEncoding value="utf-8"/>



<div class="infomain">

<table class="infotable">
	<tr>
		<td class="info__search">
			<select id="_category" name="category">
				<option value="choice">선택</option>
				<option value="title">제목</option>
				<option value="content">내용</option>	
			</select>	
			<span class="info__search-wrap">
				<input type="text" id="_keyword" name="keyword" placeholder="검색어입력" size="10">
				<label for="_keyword" id="findButton"></label>	
			</span>
		</td>
	</tr>
</table>	

<c:choose>
	<c:when test="${param.Type eq '강아지백과'}">
		<div class="infotitle">
			<img src="/images/infoImg/아이콘.png" style="height: 50px; width: 50px;">
			강아지백과 페이지 입니다!
		</div>
		<div class="infoDiv">
		</div>
	</c:when>

	<c:when test="${param.Type eq '강아지음식'}">
		<div class="infotitle">
			<img src="/images/infoImg/음식.png" style="height: 50px; width: 50px;">
			강아지음식 페이지 입니다!
		</div>
		<div class="infoDiv">
		</div>
	</c:when>
	
	<c:when test="${param.Type eq '강아지행동'}">
		<div class="infotitle">
		<img src="/images/infoImg/훈련.png" style="height: 50px; width: 50px;">
		강아지행동 페이지 입니다!
		</div>
		<div class="infoDiv">
		</div>
	</c:when>
	
		<c:when test="${param.Type eq '고양이백과'}">
		<div class="infotitle">
			<img src="/images/infoImg/고양.png" style="height: 50px; width: 50px;">
			고양이백과 페이지 입니다!
		</div>
		<div class="infoDiv">
		</div>
	</c:when>

	<c:when test="${param.Type eq '고양이음식'}">
		<div class="infotitle">
			<img src="/images/infoImg/양이.png" style="height: 50px; width: 50px;">
			고양이음식 페이지 입니다!
		</div>
		<div class="infoDiv">
		</div>
	</c:when>
	
	<c:when test="${param.Type eq '고양이행동'}">
		<div class="infotitle">
		<img src="/images/infoImg/이이.png" style="height: 50px; width: 50px;">
			고양이행동 페이지 입니다!
		</div>
		<div class="infoDiv">
		</div>
	</c:when>
 </c:choose>


<!-- paging -->
<div>
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination" style="justify-content: center;"></ul>
	</nav>
</div>

</div>



<script>

getBbsListData(0);
getBbsListCount();

let boardCategory = "";

$('#findButton').click(function(){
    
   getBbsListData(0);
   getBbsListCount();

   //검색검사
   
   let category = $("#_category").val();
   let keyword =$("#_keyword").val();

   if(category == 'choice'){
       alert('카테고리를 선택해주세요!');
       return false;
      }
   if(keyword == "" ){
          alert('검색어를 입력해주세요!');
       return false;
      }
   
});


//페이징 함수
function getBbsListData(pNumber){
   
   let boardType = '${boardType}';
   
   $.ajax({
      url:"/info/dogListPage",
      type:"post",
      data:{ "pageNumber":pNumber, "recordCountPerPage":9, 
         "category":$("#_category").val(), "keyword":$("#_keyword").val(),
         boardType:boardType
          },
      success:function( list ){
		 console.log(list);
         $(".infoDiv").empty();
         
         if(list.length < 1 ){
            let tagData = "<div class='infocontent'>"
                     + "<p>해당결과가 없습니다.</p>"
                     + "</div>";
            $('.infoDiv').append(tagData);
         }
         else{ 
             
            $.each(list, function(index, infoDto){
                let tagData = "<div class='infoDiv2' onclick='detailgo("+infoDto.boardSeq+")'>";
				tagData += "<div class='infocontent'>";
                tagData += "<img class='infoimgz' src='"+infoDto.filePath+"'  style='height: 280px; width: 280px; border-radius: 10px;' ><br><br>";
                tagData += "<h3>"+infoDto.boardTitle+"</h3>";
                tagData += "작성자 ["+infoDto.boardRegId+"]<br>";
                tagData += "</div>";
                tagData += "</div>";
    
               
                $('.infoDiv').append(tagData);
            });   
         }           
      },
      error:function(){
         alert("error");
      }   
   });   
}

//글의 총수를 취득
function getBbsListCount(){

   let boardType = '${boardType}';
   $.ajax({
      url:"/info/getCount",
      type:"post",
      data:{ "pageNumber":0, "recordCountPerPage":9, 
         "category":$("#_category").val(), "keyword":$("#_keyword").val(),
         boardType:boardType
          },
      success:function( count ){
         loadPage(count);      
      },
      error:function(){
         alert("error");
      }      
   });   
}


// paging 처리
function loadPage( totalCount ){

   let pageSize = 10;
   let nowPage = 1;

   let totalPages = 0;

   // 게시물 갯수가 0일경우 페이지수를 1로 지정
   if(totalCount == 0){
      totalPages = 1;
   }else{
	// 자바스크립트는 정수결과를 얻기 위해서 정수변환
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
		visiblePages: 9,
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

//디테일 이동
function detailgo(infoDtoSeq){
	location.href ="/info/dogDetail?seq="+infoDtoSeq;
}

</script>



