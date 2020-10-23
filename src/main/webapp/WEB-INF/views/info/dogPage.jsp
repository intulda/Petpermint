<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/info/infoList.css">



<div class="mainimg">
<img src="/images/infoImg/main.jpg" style="height: 500px; width: 1800px;">
</div>

<div class="dogmain">
<div class="godDiv" onclick="location.href='dogListPageView?Type=${'백과'}'" style="cursor: pointer;">
	<div class="dogimg">
		<img src="/images/infoImg/info.jpg" style="height: 300px; width: 500px;">
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

<div class="godDiv" onclick="location.href='dogListPageView?Type=${'음식'}'" style="cursor: pointer;" >
	<div class="dogimg2">
		<img src="/images/infoImg/food.jpg" style="height: 300px; width: 500px;">
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

<div class="godDiv" onclick="location.href='dogListPageView?Type=${'훈련'}'" style="cursor: pointer;">
	<div class="dogimg">
		<img src="/images/infoImg/train.jpg" style="height: 300px; width: 500px;">
	</div>	
	<div class="dogtitle">
		<h1 class="gallery-title">강아지 훈련</h1>
	</div>
	<div class='dogcontent'>
		반려견들을 교육할때 어려움을 느끼시나요?<br>
		반려견을 키우는 반려견주견들이라면 꼭 봐야 할 강아지 기초훈련!<br>
		강아지 훈련은 강아지를 가르치는 것 보다 보호자가 반려견과 눈높이를 맞추는 법부터 시작해서,<br>
		사람과 같이 생활하면서 강아지의 기본적인 성품을 길러주는 교육입니다.<br>
		펫퍼민트에서 훈련의 주의사항 등 필요한 정보를 살펴보세요!	
	</div>
</div>
</div>
<br>
<div class="btnDiv">
<a href="infoWrite"><button class="btn">글쓰기^^</button></a>
</div>
