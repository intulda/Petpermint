<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<title>멍냥 구조대</title>

</head>
<body>

<h1>멍냥 구조대</h1>
<br>
<a href=lostPetWrite>글쓰기</a>
<br>
<table border="1">
       <tr>
           <th>NO</th>
           <th>DATE</th>
           <th>STATUS</th>
           <th>LOCATION</th>
           <th>VIEWCOUNT</th>
           <th></th>
       </tr>
         <c:forEach var="l" items="${list}">
             <tr>
                 <td><a href="lostPetDetail?seq=${l.lostSeq}">${l.lostSeq}</a></td>
                 <td>${l.lostDate}</td>
                 <td>${l.lostStatus}</td>
                 <td>${l.lostLocation}</td>
                 <td>${l.lostViewcount}</td>
             </tr>
         </c:forEach>
</table>


</body>
</html>