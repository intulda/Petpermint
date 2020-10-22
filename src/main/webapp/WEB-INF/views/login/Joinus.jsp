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

<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<style>
</style>

<body>
​
<form action="" method="post" id="_frmForm" name="frmForm">

<div id="join_main_wrap">
	<div id="join_middle_wrap">
		<div id="join_content_wrap">
		
			<div style="width: 550px; margin-left: 300px;
						position: relative; top: 10px;">

				<div class="join_title_warp" style="top: 30px;">
					<img src="./images/회원가입1.png" width="550px">
				</div>
		
				<div id="join_memberinfo_wrap" style="top:10px;">​​
					<input type="text" class="form-control" name="id" id="id" placeholder="이메일" width="25">
					<button type="button" class="form-control" id="btnGetId" size="10"> 이메일 확인 </button>
					<div id="rgetid"></div>
					<input type="text" class="form-control" name="pwd" id="pwd" placeholder="비밀번호" width="25">
					<input type="text" class="form-control" id="pwdcfm" placeholder="비밀번호 확인" width="25"><br>
				</div>
	
				<span> 닉네임 </span><img src="./images/red-dot.png">
				<input type="text" class="form-control" name="nickname" id="nickname" size="25" placeholder="닉네임"><br>
				<span> 연락처 </span><img src="./images/red-dot.png">
				<input type="text" class="form-control" name="phone" id="phone" size="25" placeholder="연락처"><br>				
				
				
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

<div style="width: 550px; margin-left: 300px; position: relative; top: 30px;">

	<a href="#none" id="_btnjoin" title="회원가입">
		<img alt="" src="./images/joinbtn2.png">
	</a>
	 
</div>

<script type="text/javascript">
$("#_btnjoin").click(function(){
	if( $("#id").val().trim() == "" ){
		alert("id를 입력해 주십시오");
		$("#id").focus();		
	}
	else{
		$("#_frmForm").attr("action", "regiAf.do").submit();
	}
});

/* 
$("#_btnjoin").click(function(){
	if( $("#id").val().trim() == "" ){
		alert("id를 입력해 주십시오");
		$("#id").focus();		
	}
	else{
		$("#_frmForm").attr("action", "joinus.do").submit();
		alert("회원가입이 완료되었습니다");
	}
});
 */

$("#btnGetId").click(function(){

	if($("#id").val().trim() == ""){
		 alert("id를 입력해 주십시오");
		$("#id").val("");
		$("#id").focus();
		$("#id").val("");
		$("#rgetid").html("아이디를 입력해 주십시오");		
	}
	else{

		$.ajax({
			url:"getId.do",
			type:"post",
			data:{ id:$("#id").val() },
			success:function( msg ){
				if(msg == 'YES'){
					// alert("이 ID를 사용할 수 없습니다");
					$("#rgetid").html("사용할 수 없는 ID입니다");
					$("#rgetid").css("color", "#ff0000");
					$("#id").val();
					$("#id").val();
				}
				else{
					$("#rgetid").html("사용 가능한 ID입니다");
					$("#rgetid").css("color", "#0000ff");
					$("#id").val(  $("#id").val().trim()  );
				}
			},
			error:function(){
				alert("error");
			}			
		});
	}	
});

/*
 * 
 * 개인정보 동의 체크박스 해제 후 회원가입 시
 */
 $(document).ready(function(){
     $("#defaultCheck1").change(function(){
         if($("#defaultCheck1").is(":checked")){
             alert("체크박스 체크했음!");
         }else{
             alert("체크박스 체크 해제!");
         }
     });
 });


</script>


</body>




