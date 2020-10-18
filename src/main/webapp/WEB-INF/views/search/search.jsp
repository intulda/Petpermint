<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kimbogeun
  Date: 2020/10/18
  Time: 8:24 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main__wrap">
    <div class="search__top">
        <div class="search__top-img">
            <div></div>
            <span>펫퍼민트 > 검색</span>
        </div>
        <c:choose>
            <c:when test="${totalCount > 0}">
                <div class="search__top-result">
                    '<span class="search__point">${keyword ne '' ? keyword : '전체'}</span>'에 대한 통합 검색결과 입니다.
                </div>
            </c:when>
            <c:when test="${totalCount <= 0}">
                <div class="search__empty">
                    '<span class="search__point">${keyword ne '' ? keyword : '전체'}</span>'에 대한 통합 검색결과가 없습니다.
                </div>
            </c:when>
        </c:choose>
    </div>
    <c:choose>
        <c:when test="${totalCount > 0}">
            <div class="search__contents">
                <div class="search__title">
                    <div class="search__title-text">
                        강아지 이야기
                        <span>(${dogList.size() > 0 ? dogList[0].count : 0})</span>
                    </div>
                    <div class="search__more" data-link="">
                        <p>더보기</p>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${dogList.size() > 0}">
                        <ul class="search__contents-list">
                            <c:forEach items="${dogList}" var="dog">
                                <li>
                                    <c:if test="${dog.thumbnail ne null}">
                                        <div class="search__card-image">
                                            <div style="background-image: url('${dog.thumbnail}')"></div>
                                        </div>
                                    </c:if>
                                    <div class="search__card-content">
                                        <div class="search__card-title">
                                            ${dog.boardTitle}
                                        </div>
                                        <div class="search__card-date">${dog.boardRegDate}</div>
                                        <span>${dog.boardContents}</span>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:when>
                    <c:when test="${dogList.size() <= 0}">
                        <div class="search__empty">
                            '<span class="search__point">${keyword ne '' ? keyword : '전체'}</span>'에 대한 통합 검색결과가 없습니다.
                        </div>
                    </c:when>
                </c:choose>
            </div>
            <div class="search__contents">
                <div class="search__title">
                    <div class="search__title-text">
                        고양이 이야기
                        <span>(${catList.size() > 0 ? catList[0].count : 0})</span>
                    </div>
                    <div class="search__more" data-link="">
                        <p>더보기</p>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${catList.size() > 0}">
                    <ul class="search__contents-list">
                        <c:forEach items="${catList}" var="cat">
                            <li>
                                <c:if test="${cat.thumbnail ne null}">
                                    <div class="search__card-image">
                                        <div style="background-image: url('${cat.thumbnail}')"></div>
                                    </div>
                                </c:if>
                                <div class="search__card-content">
                                    <div class="search__card-title">
                                            ${cat.boardTitle}
                                    </div>
                                    <div class="search__card-date">${cat.boardRegDate}</div>
                                    <span>${cat.boardContents}</span>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                    </c:when>
                    <c:when test="${catList.size() <= 0}">
                        <div class="search__empty">
                            '<span class="search__point">${keyword ne '' ? keyword : '전체'}</span>'에 대한 통합 검색결과가 없습니다.
                        </div>
                    </c:when>
                </c:choose>
            </div>
            <div class="search__contents">
                <div class="search__title">
                    <div class="search__title-text">
                        커뮤니티
                        <span>(${freeBoard.size() > 0 ? freeBoard[0].count : 0})</span>
                    </div>
                    <div class="search__more" data-link="">
                        <p>더보기</p>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${freeBoard.size() > 0}">
                        <ul class="search__contents-list">
                            <c:forEach items="${freeBoard}" var="free">
                                <li>
                                    <c:if test="${free.thumbnail ne null}">
                                        <div class="search__card-image">
                                            <div style="background-image: url('${free.thumbnail}')"></div>
                                        </div>
                                    </c:if>
                                    <div class="search__card-content">
                                        <div class="search__card-title">
                                                ${free.boardTitle}
                                        </div>
                                        <div class="search__card-date">${free.boardRegDate}</div>
                                        <span>${free.boardContents}</span>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:when>
                    <c:when test="${freeBoard.size() <= 0}">
                        <div class="search__empty">
                            '<span class="search__point">${keyword ne '' ? keyword : '전체'}</span>'에 대한 통합 검색결과가 없습니다.
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </c:when>
    </c:choose>
</div>