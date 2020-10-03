<%--
  Created by IntelliJ IDEA.
  User: kimbogeun
  Date: 2020/09/27
  Time: 12:16 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header__container">
    <div class="header__wrap">
        <div class="header-flex header__left">
            <img src="${pageContext.request.contextPath}/images/logo.png">
        </div>
        <div class="header-flex header__center">
            <input type="text" id="headerSearch" placeholder="궁금하신점을 물어보세요"/>
            <label for="headerSearch">돋보기</label>
        </div>
        <div class="header-flex header__right">
            <ul class="header-flex">
                <li class="header-flex"></li>
                <li class="header-flex">코</li>
            </ul>
        </div>
    </div>
</header>