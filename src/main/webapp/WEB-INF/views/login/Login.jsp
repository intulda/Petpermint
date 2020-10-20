<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"/>

<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<body>

<div id="main_wrap">
	<div id="middle_wrap">
		<div id="content_wrap">
			
			<div style="width: 900px; margin-left: 300px;
						position: relative; top: 50px;">
								
			<div class="login_title_warp">
				<div style="margin-top: 15px">
					<img src="./images/로그인1.png" width="950px">
				</div>			
			</div>
			
			<br><br>
			
			<div id="login_wrap">
				
				<form action="/loginCheck.do" name="frmFrom" id="_frmForm" method="post">
					
					<table class="content_table" >
					<tr colspan="2">
						<td>
							<img src="./images/login_pic1.jpg" width="450px" height="450px">						
						</td>	
						
						
						<td style="margin: 10px">
							<a href="#none" id="_loginNaver" title="Naver로그인">
								<img alt="" src="./images/naverbtn.png" width="500px">
							</a>
							&nbsp;
							<a href="#none" id="_loginNaver" title="Kakao로그인">
								<img alt="" src="./images/kakaobtn.png" width="500px">
							</a>
							
							<hr>
							<input type="text" id="_userid" name="id" class="form-control"
									size="400px" title="이메일" style="border: 1px solid #dddddd" placeholder="이메일"> <br>
							<input type="text" id="_pwd" name="pwd" class="form-control"
									size="100px" title="비밀번호" style="border: 1px solid #dddddd" placeholder="비밀번호">	<br>
							<input type="checkbox"> 로그인 상태 유지
							<br>
							<a href="#none" id="_btnlogin" title="로그인">
								<img alt="" src="./images/loginbtn1.png">
							</a>
							
							<br>
							<hr>
							<a href="#none" id="_btnjoin" title="회원가입">
								<img alt="" src="./images/joinbtn1.png">
							</a>							
						</td>					
					</tr>											
					</table>
				</form>			
			</div>
			</div>		
		</div>	
	</div>
</div>

<script type="text/javascript">

/*
 * 
 * 페이지 이동
 */

$(document).ready(function(){
	$('#_btnjoin').click(function() {
		location.href="joinus.do";
	});
	$('#_btnlogin').click(function() {
		location.href="login.do";
	});
});


/*
 * 
 * ID 혹은 PWD 칸이 비었을 경우
 */
 
$("#_btnlogin").click(function(){
	//alert("login click");
	if($("#_userid").val().trim() == ""){
		alert($("#_userid").attr("data-msg") + "ID를 입력해주세요");
		$("#_userid").focus();
	}
	else if($("#_pwd").val().trim() == ""){
		alert("Password를 입력해 주세요");
		$("#_pwd").focus();
	}
	else{
		$("#_frmForm").attr({"action":"loginCheck.do", "target":"_self"}).submit();
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