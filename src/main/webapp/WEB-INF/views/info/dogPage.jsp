<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/info/infoList.css">



<div class="mainimg">
<img src="/images/infoImg/main.jpg" style="height: 300px; width: 1050px;">
</div>

<div class="dogmain">
<div class="godDiv" onclick="location.href='dogListPageView?Type=${'강아지백과'}'" style="cursor: pointer;">
	<div class="dogimg">
		<img src="/images/infoImg/호박.jpg" style="height: 300px; width: 500px; border-radius: 10px;">
	</div>
	<div class="dogtitle">
		<h1>강아지 백과</h1>
	</div>
	<div class='dogcontent'>
		강아지 종류, 반려견 종류. 강아지 성격, 크기, 역사 등 견종별로 모든 정보가 담겨져 있는 펫퍼민트 견종백과 페이지 입니다<br>
		이 세상에 존재하는 강아지 종류와 품종 과연 이 세상에 존재한는 강아지 종류와 품종은 얼마나 존재할까 하는생각을 해보신적이 있나요?<br>
		현재 FCI(세계애견연맹)에 등록되어 있는 견종은 338종에 이른다고 합니다!<br>
		펫퍼민트에서 다양한 강아지 견종을 살펴보세요!
	</div>
</div>

<div class="godDiv" onclick="location.href='dogListPageView?Type=${'강아지음식'}'" style="cursor: pointer;" >
	<div class="dogimg2">
		<img src="/images/infoImg/food.jpg" style="height: 300px; width: 500px; border-radius: 10px;">
	</div>
	<div class="dogtitle2">
		<h1 class="gallery-title">강아지 음식</h1>
	</div>
	<div class='dogcontent2'>
		강아지를 반려동물로 키우게 되면서 강아지 먹기리에 신경쓰는반려인이라면 꼭 알아야 하는 상식!<br>
		강아지에게 위험한 음식과 안전한 음식, 총 정리해보았습니다.<br>
		기본적인 내용만 알아둔다면 앞으론 음식 때문에 아플 일은 없겠죠?<br>
		펫퍼민트에서 음식에 대한 정보를 알아보세요!
	</div>	
</div>

<div class="godDiv" onclick="location.href='dogListPageView?Type=${'강아지행동'}'" style="cursor: pointer;">
	<div class="dogimg">
		<img src="/images/infoImg/놀이.jpg" style="height: 300px; width: 500px; border-radius: 10px;">
	</div>	
	<div class="dogtitle">
		<h1 class="gallery-title">강아지 행동</h1>
	</div>
	<div class='dogcontent'>
		반려견들의 행동을 이해할 수 없거나 어려움을 느끼시나요?<br>
		우리는 반려견과 ‘언어’로 소통할 수 없어 답답할 때가 많이 있지만<br>
		이미 강아지는 행동이나 혹은 짖음으로 이미 많은 것을 말하고 있습니다!<br>
		강아지의 바디랭귀지를 이해하고, 내가 몰랐던 반려견의 기분, 상태 등을<br>
		펫퍼민트에서 강아지 행동에 대해 알아보세요!!	
	</div>
</div>
</div>
<br>
<c:if test="${login.id eq '운영자' }">
<div class="btnDiv">
<a href="infoWrite"><button class="btn">글쓰기^^</button></a>
</div>
</c:if>
