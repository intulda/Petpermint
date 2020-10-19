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
            <a href="/"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
        </div>
        <div class="header-flex header__center">
            <input type="text" id="headerSearch" placeholder="궁금하신점을 물어보세요"/>
            <label for="headerSearch" id="headerSearchBtn">
            </label>
        </div>
        <div class="header-flex header__right">
            <ul class="header-flex">
                <%-- 로그인 후 --%>
<%--                <li class="header-flex first-child"></li>--%>
<%--                <li class="header-flex last-child">코</li>--%>
                <%-- 로그인 전 --%>
                <li class="header-flex login">로그인</li>
                <li class="header-flex register">회원가입</li>
            </ul>
        </div>
    </div>
</header>