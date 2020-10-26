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
	<c:when test="${param.Type eq '백과'}">
		<div class="infotitle">
			<img src="/images/infoImg/아이콘.png" style="height: 50px; width: 50px;">
			강아지백과 페이지 입니다!
		</div>
		<div class="infoDiv">
		</div>
	</c:when>

	<c:when test="${param.Type eq '음식'}">
		<div class="infotitle">
			<img src="/images/infoImg/음식.png" style="height: 50px; width: 50px;">
			강아지음식 페이지 입니다!
		</div>
		<div class="infoDiv">
		</div>
	</c:when>
	
	<c:when test="${param.Type eq '훈련'}">
		<div class="infotitle">
		<img src="/images/infoImg/훈련.png" style="height: 50px; width: 50px;">
		강아지훈련 페이지 입니다!
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
                tagData += "<img src='"+infoDto.filePath+"' width='300px' height='300px'><br>";
                tagData += "<h3>"+infoDto.boardTitle+"</h3>";
                tagData += "작성자:["+infoDto.boardRegId+"]<br>";
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

   let totalPages = totalCount / pageSize;
   if(totalCount % pageSize > 0){
      totalPages++;
   }
   
   $("#pagination").twbsPagination('destroy');	// 페이지 갱신
	
	$("#pagination").twbsPagination({
	//	startPage: 1,
		totalPages: totalPages,		// 전체 페이지 수
		visiblePages: 10,
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



