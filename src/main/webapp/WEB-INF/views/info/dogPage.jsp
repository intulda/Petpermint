<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
<!--메인 -->

div{
vertical-align: baseline;
}
.div1{
margin-left: 10px;
}
.div2{
margin: 50px;
 padding: 50px;
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

<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>

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

<div class="div1">
<img src="/images/infoImg/main.jpg" style="height: 500px; width: 1800px">
</div>

<div class="div2">
<form action="" name="frmForm1" id="_frmFormSearch" method="get">

<table>
	<tr>
		<td >
			<select id="choice">
				<option value="sel">선택</option>
				<option value="title">제목</option>
				<option value="content">내용</option>		
			</select>
			<input id="searchWord" placeholder="검색어입력" size="10">
			<button type="button" id="dogsearch">검색</button>
		</td>
	</tr>
</table>	
<!-- 추가 기입 -->

</form>

<div style=" cursor: pointer;" onclick="location.href='dogListPageView?boardType=백과'">
<table>
	<tr>
		<td rowspan="2"><img src="/images/infoImg/info.jpg" style="height: 300px; width: 500px;"></td>
		<td><h1>강아지 백과</h1><br><br><br>
			강아지 종류, 반려견 종류. 강아지 성격, 크기, 역사 등 견종별로 모든 정보가 담겨져 있는 펫퍼민트 견종백과 페이지 입니다<br>
			이 세상에 존재하는 강아지 종류와 품종 과연 이 세상에 존재한는 강아지 종류와 품종은 얼마나 존재할까 하는생각을 해보신적이 있나요?<br>
			현재 FCI(Federation Cynologique International:세계애견연맹)에 등록되어 있는 견종은 338종에 이른다고 합니다!<br>
			펫퍼민트에서 다양한 강아지 견종을 살펴보세요!
		</td>	
	</tr>
</table>	
</div>

<div style=" cursor: pointer;" onclick="location.href='dogListPageView?boardType=${'음식'}';">
<table>
	<tr>
		<td rowspan="2"><img src="/images/infoImg/food.jpg" style="height: 300px; width: 500px;"></td>
		<td><h1 class="gallery-title">강아지 음식</h1></td>
	</tr>
	<tr>
		<td>강아지를 반려동물로 키우게 되면서 강아지 먹기리에 신경쓰는반려인이라면 꼭 알아야 하는 상식!<br>
			강아지에게 위험한 음식과 안전한 음식, 총 정리해보았습니다.<br>
			기본적인 내용만 알아둔다면 앞으론 음식 때문에 아플 일은 없겠죠?<br>
			펫퍼민트에서 음식에 대한 정보를 알아보세요!</td>	
	</tr>
</table>
</div>

<div style=" cursor: pointer;" onclick="location.href='dogListPageView?boardType=${'훈련'}';">
<table>
	<tr>
		<td rowspan="2"><img src="/images/infoImg/train.jpg" style="height: 300px; width: 500px;"></td>
		<td><h1 class="gallery-title">강아지 훈련</h1></td>
	</tr>
	<tr>
		<td>반려견들을 교육할때 어려움을 느끼시나요?<br>
			반려견을 키우는 반려견주견들이라면 꼭 봐야 할 강아지 기초훈련!<br>
			강아지 훈련은 강아지를 가르치는 것 보다 보호자가 반려견과 눈높이를 맞추는 법부터 시작해서,<br>
			사람과 같이 생활하면서 강아지의 기본적인 성품을 길러주는 교육입니다.<br>
			펫퍼민트에서 훈련의 주의사항 등 필요한 정보를 살펴보세요!</td>	
	</tr>
</table>
</div>
<br><br>

<a href="infoWrite"><button>글쓰기^^</button></a>

</form>

</div>
