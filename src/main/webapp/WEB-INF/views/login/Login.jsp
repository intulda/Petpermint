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

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/login/login.css" />

<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<body>

<div class="login_container">
		<div id="content_wrap">
			
			<div class="login_title_warp" style="text-align: center;">
				<div style="margin-top: 15px">
					<img src="./images/login_btn2.png" width="700px">
				</div>
			</div>
			
			<br><br>
			
			<div id="login_wrap" class="login_wrap">
				
				<form action="/loginAf.do" name="frmFrom" id="_frmForm" method="post">
					
							<img src="./images/member/댕냥이1.png" width="400px" height="400px">
							
							<br>				

						
							<a href="#none" id="_loginNaver" title="Naver로그인">
								<img alt="" src="./images/member/naverbtn.png" width="500px">
							</a> <br>
						
							<a href="#none" id="_loginNaver" title="Kakao로그인">
								<img alt="" src="./images/member/kakaobtn.png" width="500px">
							</a>
							
							<hr width="500px">
							
							<div class="login_input">
								
								<div class="input-group mb-3 input-group-lg">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="basic-addon1">@</span>
								  </div>
								  <input type="text" class="form-control " id="_userid" name="id" placeholder="이메일" aria-label="id" aria-describedby="basic-addon1">
								</div>
								
								<!-- 
								<input type="text" id="_userid" name="id" class="input-group-text"
										size="10" title="이메일" style="border: 1px solid #dddddd" placeholder="이메일"> <br>
								-->
										
								<input type="text" id="_pwd" name="pwd" class="form-control"
										size="30" title="비밀번호" style="border: 1px solid #dddddd" placeholder="비밀번호"><br>
							</div>
							<input type="checkbox" id="chk_save_id" style="align=left;"> ID 저장
							<br><br>
							<a href="#none" id="_btnlogin" title="로그인">
								<img alt="" src="./images/member/loginbtn1.png">
							</a>
							
							<br>
							<hr width="500px">
							<a href="#none" id="_btnjoin" title="회원가입">
								<img alt="" src="./images/member/joinbtn1.png">
							</a>							
				</form>			
			</div>
			</div>		
		</div>	
	</div>

<br><br><br>

<script type="text/javascript">

/*
 * 
 * 페이지 이동
 */

$(document).ready(function(){
	$('#_btnjoin').click(function() {
		location.href="joinus.do";
	});
/* 	$('#_btnlogin').click(function() {
		location.href="login.do";
	}); */
});


/*
 * 
 * ID 혹은 PWD 칸이 비었을 경우
 */
 
$("#_btnlogin").click(function(){
	// alert("login click");
	if($("#_userid").val().trim() == ""){
		alert($("#_userid").attr("data-msg") + "ID를 입력해주세요");
		$("#_userid").focus();
	}
	else if($("#_pwd").val().trim() == ""){
		alert("Password를 입력해 주세요");
		$("#_pwd").focus();
	}
	else{
		$("#_frmForm").attr({"action":"loginAf.do", "target":"_self"}).submit();
	}
});


/*
 * 
 * 쿠키 설정
 */

let user_id = $.cookie("user_id");
if(user_id != null){
	$("#_userid").val( user_id );
	$("#chk_save_id").attr("checked", "checked");	
}

$("#chk_save_id").click(function(){

	if( $("#chk_save_id").is(":checked") ){
		if( $("#_userid").val().trim() == ""){
			alert("id를 입력해 주세요");
			$("#chk_save_id").prop("checked", false);
		}
		else{
			$.cookie("user_id", $("#_userid").val(), { expires:356, path:'/' });
		}
	}
	else{
		alert("쿠키 삭제");
		$.removeCookie("user_id", {path:'/'});
	}	
});

</script>
</body>