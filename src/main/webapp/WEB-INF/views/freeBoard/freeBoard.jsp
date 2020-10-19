<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href ="/css/freeBoard/freeBoard.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>


<h1 class="freeH1">커뮤니티</h1>
<hr class="freeHr">
<br><br>

<div class="freeDiv">
<button type="button" class="admin">관리자</button>
<button type="button" class="write">글쓰기</button>
<br><br>
	
	<table class="freeTable" id="bbs">
		<thead>
			<tr>
				<th><input name="checkAll" type="checkbox" onclick="toggle(this)"></th>
				<th class="num">번호</th>
				<th class="title">제목</th>
				<th class="name">작성자</th>
				<th class="date">날짜</th>
				<th class="view">조회수</th>
				<th class="like">좋아요</th>
			</tr> 
		</thead>
		<tbody>
		<c:forEach var="l" items="${getFreeBoardList}" varStatus="vs">
				<tr onclick = "location.href='/freeDetail/${l.boardSeq}'">
					<th><input type="checkbox" name="freeCheck"></th>
					<td>${vs.count}</td>
					<td>${l.boardTitle}</td>
					<td>${l.boardRegId}</td>
					<td>${l.boardRegDate}</td>
					<td>${l.boardViewCount}</td>
					<td>${l.boardLikeSeq}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	
	<div class="freeContainer">
		<nav aria-label="Page navigation" >
			<ul class="pagination" ></ul>
		</nav>
		<input type="text" name="searchWord" class="searchWord">
		<button type="button" class="searchButton">검색</button>
		<select class="choice">
			<option value="select">전체</option>
			<option value="title">제목</option>
			<option value="contents">내용</option>
			<option value="name">작성자</option>
		</select>
	</div>
</div>
<br><br>

<script>

getListData(1);
getListCount();

    $('.write').click(function (){
        location.href = "http://localhost:8090/freeBoard/freeWrite";
    });

   /*  $('.freeTable td').click(function(){
		location.href = "http://localhost:8090/freeBoard/freeDetail";
        }); */
    
    function toggle(source) {
    	  checkboxes = document.getElementsByName('freeCheck');
    	  for(var i=0, n=checkboxes.length;i<n;i++) {
    	    checkboxes[i].checked = source.checked;
    	  }
    	}

  
$('.searchButton').click(function(){
	getListData(1);
	getListCount();
});

function getListData(pNumber){
	$.ajax({
		url:"/freeBoard/freeBoardSearch",
		type:"post",
		data:{"nowPage":pNumber, "countPerPage":10, "choice":$(".choice").val(),
				"searchWord":$(".searchWord").val()},
		success : function(data){
			 //alert("호옹이");

			 $("tbody").html("");
			
			$.each(data,function(idx,data){ 
				console.log(data);
				let app = "<tr onclick='location.href=\"freeDetail?boardSeq=" + data.boardSeq + "\"'>"
						+"	<th><input type='checkbox' name='freeCheck'></th>"
						+"	<td>" + (idx + 1) + "</td>"
						+"	<td>" + data.boardTitle + "</td>"
						+"	<td>" + data.boardRegId + "</td>"
						+"	<td>" + data.boardRegDate + "</td>"
						+"	<td>" + data.boardViewCount + "</td>"
						+"	<td>" + data.boardLikeSeq + "</td>"
						+"	</tr>";
						
				$("tbody").append(app);

			/* 	 $('.freeTable td').click(function(){
						location.href = "http://localhost:8090/freeBoard/freeDetail?boardSeq=" + data.boardSeq;
				  });	 */
			});

			},
			error : function(e){
				alert("error");
			}
		});
	}

	function getListCount(){
		
		$.ajax({
			url:"/freeBoard/freeBoardPaging",
			type:"get",
			data:{"nowPage":0, "recordCountPerPage":10,"choice":$("#choice").val(),"searchWord":$("#searchWord").val()},
			success:function(count){
				//alert(count);
				loadPage(count);
				}
			});
		}

	function loadPage(totalCount) {
		//글의 총 수
		let PageSize = 10;		// 보여주고싶은 글의 갯수
		let nowPage = 1;
		
		let totalPages = totalCount / PageSize;
		//		2			23			10
		if(totalCount % PageSize > 0){
			totalPages++;
		}
		
		$(".pagination").twbsPagination('destroy');			// 페이지 갱신
		
		$(".pagination").twbsPagination({
			//startPage: 1,
			totalPages: totalPages,
			visiblePages: 10,
			first:'<span aria-hidden="true">«</span>',		// 첫페이지로 돌아가기
			prev:"이전",
			next:"다음",
			last:'<span aria-hidden="true">»</span>',		// 끝페이지로 이동
			initiateStartPageClick:false,					// onPageClick 자동호출을 막는다
			onPageClick: function(event, page){				// 페이지 번호 클릭시
				nowPage = page;
			//	alert('nowPage:' + nowPage);
			}	
		});
		
		
	}

</script>
</body>
</html>