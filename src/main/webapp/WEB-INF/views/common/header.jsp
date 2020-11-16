<%--
  Created by IntelliJ IDEA.
  User: kimbogeun
  Date: 2020/09/27
  Time: 12:16 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header class="header__container">
    <div class="header__wrap">
        <div class="header__hamburger-menu">
            <input type="checkbox" id="hamburger" />
            <label for="hamburger" id="hamburgerMenu">
                <span></span>
                <span></span>
                <span></span>
            </label>
            <div class="sidebar">
                <ul class="header__hamburger-menu-list">

                </ul>
            </div>
        </div>
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
				<c:if test="${not empty login}">
					<li>
                        <div class="dropdown">
                            <button id="dLabel" class="header__login-profile" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${login.subNickname}
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                <li role="presentation" class="header__profile-li"><a href="/myinfo.do">내 정보 수정</a></li>
                                <li role="presentation" class="divider"></li>
                                <li role="presentation" class="header__profile-li"><a href="/logout">로그아웃</a></li>
                            </ul>
                        </div>
					</li>
				</c:if>
                <c:if test="${empty login}">
                    <%-- 로그인 전 --%>
                    <li class="header-flex login">
                        <a href="${pageContext.request.contextPath}/login.do"> 로그인 </a>
                    </li>
                    <li class="header-flex register">
                        <a href="${pageContext.request.contextPath}/regi.do"> 회원가입 </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</header>