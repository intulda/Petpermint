<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/placeBoard/placeMap.css" />    


<h1>Pet Map</h1>

<div class="viewMap">

	<div class="title">
		<p>원하는 지역을 선택해서 근처 동물병원을 찾으세요</p>
	</div>
	<div class="menu">
		<div name="city">서울
		</div>
		<div name="city">경기도
		</div>
		<div name="city">충청도
		</div>
		<div name="city">강원도
		</div>
		<div name="city">경상도
		</div>
		<div name="city">전라도
		</div>
		<div name="city">제주도
		</div>
	</div>
	<table class="city_content" id="서울">
		<tr>
			<td>강남구</td>
			<td>강동구</td>
			<td>강북구</td>
			<td>강서구</td>
			<td>관악구</td>			
		</tr>
		<tr>
			<td>광진구</td>
			<td>구로구</td>
			<td>금천구</td>
			<td>노원구</td>
			<td>도봉구</td>			
		</tr>
		<tr>
			<td>동대문구</td>
			<td>동작구</td>
			<td>마포구</td>
			<td>서대문구</td>
			<td>서초구</td>			
		</tr>
		<tr>
			<td>성동구</td>
			<td>성북구</td>
			<td>송파구</td>
			<td>양천구</td>
			<td>영등포구</td>			
		</tr>
		<tr>
			<td>용산구</td>
			<td>은평구</td>
			<td>종로구</td>
			<td>중구</td>
			<td>중랑구</td>			
		</tr>
	</table>
	<table class="city_content" id="경기도">
		<tr>
			<td>고양시</td>
			<td>과천시</td>
			<td>광명시</td>
			<td>광주시</td>
		</tr>
		<tr>
			<td>구리시</td>
			<td>군포시</td>
			<td>김포시</td>
			<td>남양주시</td>
		</tr>
		<tr>
			<td>동두천시</td>
			<td>부천시</td>
			<td>성남시</td>
			<td>수원시</td>
		</tr>
		<tr>
			<td>시흥시</td>
			<td>안산시</td>
			<td>안성시</td>
			<td>안양시</td>
		</tr>
		<tr>
			<td>양주시</td>
			<td>여주시</td>
			<td>오산시</td>
			<td>용인시</td>
		</tr>
		<tr>
			<td>의왕시</td>
			<td>의정부시</td>
			<td>이천시</td>
			<td>파주시</td>
		</tr>
		<tr>
			<td>평택시</td>
			<td>포천시</td>
			<td>하남시</td>
			<td>화성시</td>
		</tr>
	</table>
	<table class="city_content" id="충청도">
		<tr>
			<td>대전시</td>
			<td>청주시</td>
			<td>천안시</td>
		</tr>
		<tr>
			<td>세종시</td>
			<td>아산시</td>
			<td>충주시</td>
		</tr>
	</table>
	<table class="city_content" id="강원도">
		<tr>
			<td>춘천시</td>
			<td>원주시</td>
			<td>강릉시</td>
			<td>속초시</td>
		</tr>
		<tr>
			<td>동해시</td>
			<td>태백시</td>
			<td>삼척시</td>
			<td></td>
		</tr>
	</table>
	<table class="city_content" id="경상도">
		<tr>
			<td>부산시</td>
			<td>대구시</td>
			<td>울산시</td>
			<td>창원시</td>
			<td>김해시</td>
		</tr>
		<tr>
			<td>포항시</td>
			<td>구미시</td>
			<td>양산시</td>
			<td>진주시</td>
			<td></td>
		</tr>
	</table>
	<table class="city_content" id="전라도">
		<tr>
			<td>목포시</td>
			<td>여수시</td>
			<td>순천시</td>
		</tr>
		<tr>
			<td>나주시</td>
			<td>광양시</td>
			<td></td>
		</tr>
	</table>
	<table class="city_content" id="제주도">
		<tr>
			<td colspan='3'>제주시</td>
		</tr>
	</table>
	<div id="map" class="mymap"></div>
	
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dcdc7367b980d0b1446f352a1693e015&libraries=services"></script>
<script type="text/javascript">

// 지역선택시 해당테이블 출력
$('div[name="city"]').click(function (){
	
	$(".city_content").not("#"+this.innerText).hide();
	$("#"+this.innerText).slideToggle('slow');	
});

// 지역내 도시선택시 지도에 동물병원 표시
$('.city_content td').click(function(){

	ps.keywordSearch(this.innerText + ' 동물병원', placesSearchCB); 
});


//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

//키워드로 장소를 검색합니다
ps.keywordSearch('동물병원', placesSearchCB); 



// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>
