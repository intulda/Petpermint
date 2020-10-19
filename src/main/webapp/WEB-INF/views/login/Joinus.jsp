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
<div class='join'>
	<img src="/images/회원가입1.png">
</div>
​
<form action="/joinus" id="joinus" method="post">
​
	<div>
		<input type="text" class="form-control" placeholder="이메일" width="100"> <br>
		<input type="text" class="form-control" placeholder="비밀번호" width="100"><br>
		<input type="text" class="form-control" placeholder="비밀번호 확인" width="100"><br>
	</div>
	
	
	<span> 이름 </span>
	<img src="/images/red-dot.png">
	<br>
	<input type="text" class="form-control" size="60" placeholder="로그인"><br>
	
	<span> 연락처 </span><img src="/images/red-dot.png">
	<input type="text" class="form-control" size="60" placeholder="연락처"><br>
	
	<span> 닉네임 </span><img src="/images/red-dot.png">
	<input type="text" class="form-control" size="60" placeholder="닉네임"><br>
	
	<input type="checkbox"> 개인정보 제공에 동의합니다.
​
</form>
​
<br><br>
<input type="submit" id="joinSaveBtn" value="회원가입 완료">
​
</body>
