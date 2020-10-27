<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/default.css"/>
<link rel="stylesheet" type="text/css" href="css/login/login.css"/>
<link rel="stylesheet" type="text/css" href="css/login/memberUpdate.css"/>


</head>
<body>


<div class="myinfo_container">
	<div class="myinfo_middle_container">
		<div id="myinfo_content_wrap">
		
			<div style="width: 600px; align: center; margin-left: 170px; margin-top: 10px;">

				<div class="join_title_warp" style="top: 30px;">
					<img src="./images/member/infoupdate_title.png" width="650px">
				</div>
				
				<form action="myinfoAf.do" id="memberUpdateForm" method="post">
				<br><br><br>
				<table style="margin-left: 35px;">
					<colgroup>
						<col width="200px" height="100px"><col width="300px" height="100px"><col width="100px" height="100px">
					</colgroup>
					<tr>
						<td>
							<span> ID </span>
						</td>
						<td colspan="2">
							<input type="text" class="form-control" readonly="readonly" id="id" name="id" value="${login.id }">  <br>
						</td>
					</tr>
					<tr>
						<td>
							<span> Password </span>
						</td>
						<td colspan="2">
							<input type='password' class="form-control" id="pwd" name="pwd"><br>
						</td>
					</tr>
					<!-- 
					<tr>
						<td>
							<span> Password 확인 </span>
						</td>
						<td>
							<input type="text" class="form-control" width="50px">
						</td>
						<td>						
							<button type="button" class="form-control"> 확인 </button> <br>
						</td>
					</tr> -->
					
					<tr>
						<td>
							<span> 닉네임 </span>
						</td>
						<td colspan="2">
							<input type="text" class="form-control" value="${login.nickname }" id="nickname" name="nickname"> <br>
						</td>
					</tr>	
				</table>
				</form>
				
				<br><br>
				
			</div>
			
			<input type="submit" title="회원정보수정" id="memberUpdateBtn" class="memberUpdateBtn_submit form-control" style="top: 30px; margin-left: 170px; width: 650px;"> 
			
			<!-- 
			<a href="#none" type="submit" id="_btnjoin" title="회원정보수정" id="memberUpdateBtn"  style="top: 30px; margin-left: 230px;">
				<img alt="" src="./images/member/myinfobtn.png" width="500px">
			</a>
				 -->
		</div>
	</div>
</div>

<script type="text/javascript">


$("#memberUpdateBtn").click(function(){
		$("#memberUpdateForm").attr("action", "myinfoAf.do").submit();
		alert("정보 수정이 완료되었습니다. 다시 로그인 해주세요!");
});

</script>


</body>
</html>