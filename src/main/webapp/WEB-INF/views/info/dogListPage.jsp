<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<%=request.getContextPath() %>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<fmt:requestEncoding value="utf-8"/>

<style>


</style>

<%
String choice = (String)request.getAttribute("choice");
if(choice == null) choice = "";

String searchWord = (String)request.getAttribute("searchWord");
if(searchWord == null) searchWord = "";

if(searchWord.equals("")){
	choice = "";
}
%>

<script>
let choice = "<%=choice %>";
let searchWord = "<%=searchWord %>";
$(document).ready(function(){
	$("#_choice").val(choice);

	// $("#_searchWord").val(searchWord);
	document.frmForm1.searchWord.value = searchWord;
});
</script>

<form action="" name="frmForm1" id="_frmFormSearch" method="post">

<table>
	<tr>
		<td >
			<select id="choice">
				<option>선택</option>
				<option value="title">제목</option>
				<option value="content">내용</option>		
<!-- 			</select> -->
			<input id="searchWord" placeholder="검색어입력" size="10">
			<button type="button" id="dogsearch">검색</button>
		</td>
	</tr>
</table>	
<!-- 추가 기입 -->
<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">

</form>



<c:choose>
	<c:when test="${param.Type eq '백과'}">
<div class="infoList" onclick='location.href = dogDetail?=${infoDto.boardSeq}'">
</div>
	</c:when>
	
	<c:when test="${param.Type eq '음식'}">
	제가...제가보이시나요?....저는 음식입니다..냠냠
<div class="infoList" onclick='location.href = dogDetail?=${infoDto.boardSeq}'">
	</c:when>
	
	<c:when test="${param.Type eq '훈련'}">
	나는 훈련^^
	</c:when>
	
 </c:choose>

<div class="infofoList">
</div>
<!-- paging -->
<div class="container">
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination" style="justify-content: center;"></ul>
	</nav>
</div>


<a href="infoWrite"><button>글쓰기^^</button></a>

<div onclick="location.href='dogListPageView?Type=${'음식'}'"></div>

<script>
getBbsListData(0);
getBbsListCount();

$('#findButton').click(function(){
   getBbsListData(0);
   getBbsListCount();
});




//페이징 함수

function getBbsListData(pNumber){
   //alert(${boardType});
   
   let boardType = '${boardType}';
   $.ajax({
      url:"/info/dogListPage",
      type:"post",
      data:{ "pageNumber":pNumber, "recordCountPerPage":10, 
         "category":$("#_category").val(), "keyword":$("#_keyword").val(),
         boardType:boardType
          },
      success:function( list ){

         $(".infoList").remove();
         
         if(list.length < 1 ){
            let tagData = "<div class='infoList'>"
                     + "<p>해당결과가 없습니다.</p>"
                     + "</div>";
            $('.place_container').append(tagData);
         }
         else{ 
               
            $.each(list, function(index, infoDto){
				let tagData = "<div class='infoList' onclick>";
				tagData	+= "<a href='/info/dogDetail?="+infoDto.boardSeq+"'>이동</a><br>";
                tagData += "<img src='"+infoDto.filePath+"'><br>";
                tagData += "<h1>"+infoDto.boardTitle+"</h1><br>";
                tagData += "작성자:["+infoDto.boardRegId+"]<br>";
                tagData += "seq:["+infoDto.boardSeq+"]<br>";
                tagData += "</div>"
                    
                if(index%3 == 0){
                    tagData +="<br style='clear:both;'>";
                }
                $('.infofoList').append(tagData);
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
   $.ajax({
      url:"/info/getCount",
      type:"post",
      data:{ "pageNumber":0, "recordCountPerPage":10, 
         "category":$("#_category").val(), "keyword":$("#_keyword").val()
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









</script>



