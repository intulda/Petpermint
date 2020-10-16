<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<title>멍냥 구조대</title>

</head>
<body>

<h1>멍냥 구조대</h1>
<br><br>
<table border="1">
       <tr>
           <th>NO</th>
           <th>DATE</th>
           <th>VIEWCOUNT</th>
           <th>STATUS</th>

           
           <th></th>
       </tr>
       <tr>
           <td>${lostPetDto.lostSeq}</td>
           <td>${lostPetDto.lostKind}</td>
           <td>${lostPetDto.lostViewcount}</td>
           <td>${lostPetDto.lostStatus}</td>
           <td>${lostPetDto.lostLocation}</td>
           
       </tr>
</table>

<a href="lostPetUpdate?lostSeq=${lostPetDto.lostSeq}">수정</a>
<input type="button" value="삭제" onclick="del(${lostPetDto.lostSeq})">


<br><br>

<a href=lostPetWrite>글쓰기</a>
<br>
<br>
<textarea id="_lcommContent"></textarea>
<a id="_lostPetLCommWrite" title="글쓰기">		
	<img src="/images/bwrite.png" alt="글쓰기" />
</a>

<table border="1">
       <tr>
           <th>BNO</th>
           <th>CNO</th>
           <th>ID</th>
           <th>CONTENT</th>
           <th>DATE</th>
           <th>수정</th>
           <th>삭제</th>
           <th></th>
       </tr>
         <c:forEach var="c" items="${LCommList}">
             <tr>
                 <td><a href="lostPetDetail?seq=${c.lostpetSeq}">${c.lostpetSeq}</a></td>
                 <td>${c.lcommSeq}</td>
                 <td>${c.lcommId}</td>
                 <td>${c.lcommContent}</td>
                 <td>${c.lcommDate}</td>
                 <td><input type="button" value="수정" onclick="upBtn(${c.lcommSeq}, ${c.lostpetSeq})"/></td>
				 <td><input type="button" value="삭제" onclick="delBtn(${c.lcommSeq},${c.lostpetSeq})"></td>
             </tr>
         </c:forEach>
</table>

<script type="text/javascript">
function del(seq) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='/lostPet/lostPetDelete?lostSeq='+ seq;
	}
}

$("#_lostPetLCommWrite").click(function(){
	let lostpetSeq= "${lostPetDto.lostSeq}";
	let sendCommData = {lostpetSeq:lostpetSeq, lcommContent:$('#_lcommContent').val()
			};
	console.log(sendCommData);

	$.ajax({
		url:"/lostPet/lostPetLCommWriteAf",
		type:"post",
		data:sendCommData,
		success:function(data){
		//alert("success");

			if(data==='ok'){
				alert("댓글을 작성했습니다.");
				location.href='/lostPet/lostPetDetail?seq=' + lostpetSeq;
			}
			else{
				alert("댓글을 작성하지못했습니다.");
			}
		},
		error:function(){
			alert("error");
			}
	});	
});

function upBtn(seq, bseq){
	 
    window.open('/lostPet/lcommUpdate?seq='+seq,'popName',
                'width=1000,height=200,top=500,left=300,toolbar=no,menubar=no,scrollbars=no,resizable=no,status=no');
}


function delBtn(seq, bseq){
	let sendCommDelData = { lcommSeq:seq, lostpetSeq:bseq};
	
	$.ajax({
		url:"/lostPet/lcommDel",
		type:"post",
		data:sendCommDelData,
		success:function(data){
		//alert("success");

			if(data==='ok'){
				confirm('댓글을 삭제하시겠습니까?');
				alert("댓글을 삭제했습니다.");
				location.href='/lostPet/lostPetDetail?seq=' + bseq;
			}
			else{
				alert("댓글 수정 실패.");
			}
		},
		error:function(){
			alert("error");
			}
	});	
}

</script>

</body>
</html>