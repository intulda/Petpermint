<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
​<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/login/lostPetDetail.css" />

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>


<style>
</style>
​
<body>
​
<form action="/joinus" id="joinus" method="post">

<div id="join_main_wrap">
	<div id="join_middle_wrap">
		<div id="join_content_wrap">
		
			<div style="width: 550px; margin-left: 400px;
						position: relative; top: 50px;">

				<div class="join_title_warp" style="top: 30px;">
					<img src="./images/회원가입1.png" width="550px">
				</div>
		
				<div id="join_memberinfo_wrap" style="top:10px;">​​
					<input type="text" class="form-control" placeholder="이메일" width="25"><br>
					<input type="text" class="form-control" placeholder="비밀번호" width="25">
					<input type="text" class="form-control" placeholder="비밀번호 확인" width="25"><br>
				</div>
	
				<span> 이름 </span>
				<img src="./images/red-dot.png"><br>
				<input type="text" class="form-control" size="25" placeholder="이름"><br>
				<span> 연락처 </span><img src="./images/red-dot.png">
				<input type="text" class="form-control" size="25" placeholder="연락처"><br>				
				<span> 닉네임 </span><img src="./images/red-dot.png">
				<input type="text" class="form-control" size="25" placeholder="닉네임"><br>
				
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
					<label class="form-check-label" for="defaultCheck1">
				    	개인정보 제공에 동의합니다.
				  </label>
				</div>
							
			</div>
	​	</div>
	</div>
</div>
​
</form>

<div style="width: 550px; margin-left: 400px; position: relative; top: 30px;">
	<a href="#none" id="_btnjoin" title="회원가입">
		<img alt="" src="./images/joinbtn2.png">
	</a>
</div>


</body>
