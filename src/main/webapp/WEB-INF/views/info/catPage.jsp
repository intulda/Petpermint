<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/info/infoList.css">



<div class="mainimg">
<img src="/images/infoImg/고양이.jpg" style="height: 300px; width: 1050px; ">
</div>

<div class="dogmain">
<div class="godDiv" onclick="location.href='dogListPageView?Type=${'고양이백과'}'" style="cursor: pointer; ">
	<div class="dogimg">
		<img src="/images/infoImg/고.jpg" style="height: 300px; width: 500px; border-radius: 10px;">
	</div>
	<div class="dogtitle">
		<h1>고양이 백과</h1>
	</div>
	<div class='dogcontent'>
		오늘은 전세계 41종 공식등록 되어 있는 
		고양이 종류(품종/종)에 대해<br>사진으로 알아볼까 해요!<br>
		공식 등록되기 위한 고양이 종류 판단의 기준은<br>
		체형/ 털의 길이/ 털의 색깔/ 눈의 색깔 이라고 합니다!<br>
		펫퍼민트 묘종백과에서 고양이의 정보를 더 알아보아요!

	</div>
</div>

<div class="godDiv" onclick="location.href='dogListPageView?Type=${'고양이음식'}'" style="cursor: pointer;" >
	<div class="dogimg2">
		<img src="/images/infoImg/양.jpg" style="height: 300px; width: 500px; border-radius: 10px;">
	</div>
	<div class="dogtitle2">
		<h1 class="gallery-title">고양이 음식</h1>
	</div>
	<div class='dogcontent2'>
		요즘 반려묘와 함께 행복한 생활을 하시는 분들이 많은데요,<br>
		반려묘에게 맛있는 음식을 먹이고 싶은 마음은 누구나 다 똑같은 것 같아요.<br>
		고양이에게 좋은 음식이 있는 반면, 해가되는 음식 있다는 것 알고 계셨나요?<br>
		고양이들이 먹으면 안되는 음식들을 알아보도록 하겠습니다!<br>
		펫퍼민트에서 고양이 음식에 대한 정보를 알아보세요!
	</div>	
</div>

<div class="godDiv" onclick="location.href='dogListPageView?Type=${'고양이행동'}'" style="cursor: pointer;">
	<div class="dogimg">
		<img src="/images/infoImg/이.jpg" style="height: 300px; width: 500px; border-radius: 10px;">
	</div>	
	<div class="dogtitle">
		<h1 class="gallery-title">고양이 행동</h1>
	</div>
	<div class='dogcontent'>
		많은 집사들은 생각합니다.<br>
		‘고양이가 나에게 말을 할 수 있다면 얼마나 좋을까?’<br>
		고양이는 말을 할 수 없지만 집사님들에게는 방법이 있습니다!<br>
		집사인 우리들이 고양이 언어, 바디랭귀지를 배우는 것!  <br>
		고양이가 취하는 자세, 방향, 꼬리, 귀 그리고 눈을 살펴보면<br>
		고양이가 무엇을 말하고 싶은지 더 잘 파악할 수 있을겁니다.<br>
		펫퍼민트 고양이 행동에서 더 자세하게 알아보아요!
	</div>
</div>
</div>
<br>
<c:if test="${login.id eq '운영자' }">
<div class="btnDiv">
<a href="infoWrite"><button class="btn">글쓰기^^</button></a>
</div>
</c:if>
