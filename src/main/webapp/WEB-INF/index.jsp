<%--
  Created by IntelliJ IDEA.
  User: kimbogeun
  Date: 2020/09/23
  Time: 2:54 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h1>bodyIndex</h1>
<button>click</button>
<c:if test="${1 eq 1}">
    <h1>되네</h1>
</c:if>


<script>
    $('button').click(function (){
        alert(1);
    })
</script>

