<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<%=request.getContextPath() %>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<fmt:requestEncoding value="utf-8"/>

<style>

.div{
margin: 50px;
 padding: 50px;
 text-align: center;
}

table{ /* 테이블크기 */
	width:100%;
	text-align: center;
}
table, th, td{ /* 테두리 색 .두께 설정  */
	border: solid  1px black;
}
th{
width: 100px;
height: 100px;
}

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

<form action="" name="frmForm1" id="_frmFormSearch" method="get">

<table>
	<tr>
		<td >
			<select id="choice">
				<option>선택</option>
				<option value="title">제목</option>
				<option value="content">내용</option>		
			</select>
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
	<c:when test="${param.boardType eq '백과'}">
	<div>
		<table>
			<tr>
				<th colspan="3"><h1 class="gallery-title">강아지 백과</h1></th>
			</tr>
		</table>
		<div class="place_container">
			<c:forEach var="in" items="${getInfoList}" varStatus="vs">
				<%-- <c:if test="${in.boardCategory eq 'food' }"> --%>
				<div clas="lost_content">
					<div style="float:left; cursor: pointer;" onclick="location.href=dogListPage'";>
						<img style="width: 300px; height: 200px;" src="${in.filePath}"><br>
						<h1>${in.boardTitle}</h1><br>
						작성자: [ ${in.boardRegId} ]
					</div>
				</div>
					<c:if test="${vs.count % 3 == 0 }">
						<br style="clear:both;">
					</c:if>
					
				<%-- </c:if> --%>
			</c:forEach>
		</div>
		
	</div>
	</c:when>
	
	<c:when test="${param.boardType eq '음식'}">
	제가...제가보이시나요?....저는 음식입니다..냠냠
	</c:when>
	
	<c:when test="${param.boardType eq '훈련'}">
	나는 훈련^^
	</c:when>
	
 </c:choose>


<!-- paging -->
<div class="container">
	<nav aria-label="Page navigation">
		<ul class="pagination" id="pagination" style="justify-content: center;"></ul>
	</nav>
</div>

<a href="infoWrite"><button>글쓰기^^</button></a>


<script>
getBbsListCount();

$('#findButton').click(function(){
   getBbsListCount();
});

/* $('#writeButton').click(function(){
   location.href = "/lostPet/lostPetWriteView";   
}); */



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

         alert("length = " +list.length);
         $(".lost_content").remove();
         
         if(list.length < 1 ){
            let tagData = "<div class='lost_content'>"
                     + "<div class='lost_item2'>"
                     + "<p>해당결과가 없습니다.</p></div>"
                     + "</div>";
            $('.place_container').append(tagData);
         }
         else{ 
               
            $.each(list, function(index, infoDto){

                alert(infoDto);
                
               //alert(lostDto.lostSeq);
               
               //alert(lostDto.imagePath);
               /*
               let tagData = "<div class='lost_content'>"
                        + "<div class='place_item'>"
                         +"</div>"
                        + "<div class='lost_item2'>"                                 
                        + "<div><p>"
                        + "NO ."+ infoDto.boardTitle
                        + "</p></div>"
                        + "<img src='" 
                        + infoDto.imagePath
                        + "' width='400px' height='200px'>"
                        + "<div><h5>"
                        + "품종"+infoDto.boardTitle
                        + "</h5></div>"
                        + "<div><p>"
                        + "성별"+infoDto.boardContents
                        + "</p></div>"
                        + "<div><p>"
                        + "구조장소"+infoDto.boardRegDate
                        + "</p></div>"
                        + "<div><a href='/info/infoDetail?seq="
                        + infoDto.boardType
                        + "' class='detailButton'>더알아보기</a></div>"
                        
                        + "</div>";
   
               $('.place_container').append(tagData);
               */
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



