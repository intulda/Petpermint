<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="<%=request.getContextPath() %>/js/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/placeBoard/placeDetail.css" />
<Style>


</Style>


<div class="main_title">펫플레이스</div>
<div class="place_title">
	<div class="item1">
		<p class="board_info">
		<img src="../images/placeImg/detail_writer.png" class="idImg">작성자 : ${placeDto.boardRegId }
		</p>
		<p class="board_info">
			<img src="../images/placeImg/read_count.png" class="readImg" >
			조회수 : ${placeDto.boardViewCount }
		</p>
	</div>
	<div class="item2">
		<p class="board_info">
		게시날짜 : ${placeDto.boardRegDate }  (ID:${placeDto.boardRegId })
		</p>
		<c:if test="${placeDto.boardUpdDate  != null }">
			<P class="board_info">
			수정날짜 : ${placeDto.boardUpdDate } (ID:${placeDto.boardUpdId })
			</p>
		</c:if>
	</div>
</div>

<div class="place_container">
	<h1 class="boardTitle">${placeDto.boardTitle }</h1>
	<div class="place_content">${placeDto.boardContents }</div>
	<div class="bottom_divider"></div>
	
	<div class="bottom_infoWrap">
		<div class="bottom_infoHeaderWrap">
			<div class="bottom_infoHeader">	
			 <a class="location_info">Info</a>
			</div>
		</div>
		<div class="bottom_infoContent">
			<div class="infoContent_sub2">
				<p class="sub2_content">주소</p>
				<p style="margin-left:9px;">${placeDto.boardLocation }</p>
				<p class="sub2_content">연락처</p>
				<p style="margin-left:9px;">${placeDto.boardTel }</p>
				<p class="sub2_content">종류</p>
				<p style="margin-left:9px;">${placeDto.boardCategory }</p>
			</div>
			<div class="infoContent_sub1">
				<div id="map" class="mymap"></div>
			</div>
		</div>
	</div>
		
</div>
<div class="place_comm">
	<div class="place_commInput">
	 	<label for="comm_content">comment</label>
	 	<input type="hidden" value="${login.id }" id="commRegId">	
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
	<c:if test="${login != null &&  (placeDto.boardRegId == login.id || login.auth == 3) }">	
		<div class="footer_item1">
			<button type="button" id="updButton" class="changeButton">수정</button>
			<button type="button" id="delButton" class="changeButton">삭제</button>
		</div>
	</c:if>
	<div class="footer_item2">
	<button type="button" id="listButton" class="changeButton">목록</button>
	</div>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dcdc7367b980d0b1446f352a1693e015&libraries=services"></script>
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

                    let buttons = "";
                    if("${login}"!= null && ("${login.id}" == commDto.commRegId || "${login.auth}" == 3)  ){

                    	buttons = "<a id='commUpdButton"
								+ commDto.commSeq
								+ "' onclick=\"commUpdate('"
								+ commDto.commSeq + "','" + commDto.commContent
								+ "')\" class='commButton'>수정</a>"
								+ "<a id='commDelButton"
								+ commDto.commSeq
								+ "' onclick=\"commDelete('"
								+ commDto.commSeq
								+ "')\" class='commButton'>삭제</a>";
                    }

					
					let tagData = "<div class='commHeader'>"
								+ "<span class='infoId'>"
								+ commDto.commRegId
								+ " |</span>"
								+ updDate							
								+ "<span class='infoData'>등록날짜</span>"
								+ "<span"
								+ " class='infoData' id='commRegDate"
								+ commDto.commSeq
								+ "'>"
								+ commDto.commRegDate
								+ "</span>"
								+ buttons
								+ "</div>"
								+ "<div class='commBody' id='commBody"
								+ commDto.commSeq + "'>"
								+ commDto.commContent
								+ "</div>";
				
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
	
				location.href = "/placeBoard/placeBoardList" ;
			}
			else{
				alert("글을 삭제하지 못했습니다.");				
			}
		},
		error:function(){
				alert("error");
		}
	});
	
});

// 댓글 등록
$('#commButton').click(function(){
	
	let sendData = {commRef:boardSeq, commRegId:"${login.id}", 
			commContent:$('#comm_content').val()};
	
	if("${login.id}" != ""){
		if($('#comm_content').val().trim() == ""){			
		
			$('#comm_content').focus();
		}
		else{	
			$.ajax({
				url:"/placeBoard/placeCommWrite",
				type:"post",
				data: sendData,
				success:function(data){
					
					if(data === 'ok'){
					
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
	}
	else{
		alert("로그인후 댓글등록을 할 수 있습니다.");
	}
	
});

// 게시판으로 이동
$('#listButton').click(function(){

	location.href = "/placeBoard/placeBoardList";
});


// 댓글 수정페이지로 전환
function commUpdate(commSeq, commContent){

	let htmlData = "<textarea rows='70' cols='70' class='input_comm2' placeholder='댓글을 입력해주세요'"
				 + "id='comm_content"+commSeq +"'>"
				 + commContent
				 + "</textarea>";
				 
	$("#commBody" + commSeq).html(htmlData);
	
	let cancelButton = "<a onclick=\"commUpdSwitch('"+commSeq +"','"+commContent+"' )\""
 	  				 + "id='cancelButton"
	  				 + commSeq
	  				 + "' class='commButton'>수정취소</a>";
	$("#commRegDate"+ commSeq).after(cancelButton);
	
	let commUpdAfButton = "<button type='button' onclick=\"commUpdateAf('"+commSeq+"')\""
		 + "id='commUpdAfButton"
		 + commSeq
		 + "' class='upAfButton'>수정하기</button>";
	$("#comm_content" + commSeq).after(commUpdAfButton);
	$("#commUpdButton"+ commSeq).remove();
	
	
}	

// 댓글 출력페이지로 전환
function commUpdSwitch(commSeq, commContent){

	let	 updButton = "<a id='commUpdButton"
				  + commSeq
				  + "' onclick=\"commUpdate('"
				  + commSeq + "','" + commContent
				  + "')\"  class='commButton'>수정</a>";
	$("#commBody" + commSeq).html(commContent);
	$("#commRegDate"+ commSeq).after(updButton);
	$("#cancelButton"+ commSeq).remove();
	
}

// 댓글 수정
function commUpdateAf(commSeq){
	
	let commContent = $("#comm_content" + commSeq).val();
	
	$.ajax({
		url:"/placeBoard/PlaceCommUpdate",
		type:"post",
		data: {commSeq:commSeq, commContent:commContent},
		success:function(data){
			if(data === 'ok'){
				
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


// 지도표시

// 게시물 위치주소 
let locationAddr = "${placeDto.boardLocation}";
// 게시물 위치명
let locationName = "${placeDto.boardTitle}";


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch(locationAddr, function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">' + locationName + '</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});





</script>
