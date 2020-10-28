<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kimbogeun
  Date: 2020/09/23
  Time: 2:54 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="main__wrap">
        <div class="main__title">
            <span>강아지 이야기</span>
        </div>
        <div class="story__more" data-link="/info/dogPage?Pet=강아지">
            <p>더보기</p>
        </div>
        <div class="main__contents">
            <c:choose>
                <c:when test="${dogList.size() ne 0}">
                    <ul>
                        <c:forEach items="${dogList}" var="dog">
                            <li class="story__card-wrap" data-link="/info/dogDetail?seq=${dog.boardSeq}">
                                <div class="story__card-image">
                                    <c:if test="${dog.thumbnail ne null}">
                                        <div style="background-image: url('${dog.thumbnail}')"></div>
                                    </c:if>
                                </div>
                                <div class="story__card-content">
                                    <span><c:out value='${dog.boardContents.replaceAll("\\\<.*?\\\>","")}' /></span>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:when test="${dogList.size() eq 0}">
                    <div class="main__contents-empty">
                        <p>게시물이 없어요.</p>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </div>
    <div class="main__wrap">
        <div class="main__title">
            <span>고양이 이야기</span>
        </div>
        <div class="story__more" data-link="/info/catPage?Pet=고양이">
            <p>더보기</p>
        </div>
        <div class="main__contents">
            <c:choose>
                <c:when test="${catList.size() ne 0}">
                    <ul>
                        <c:forEach items="${catList}" var="cat">
                            <li class="story__card-wrap" data-link="/info/dogDetail?seq=${cat.boardSeq}">
                                <div class="story__card-image">
                                    <c:if test="${cat.thumbnail ne null}">
                                        <div style="background-image: url('${cat.thumbnail}')"></div>
                                    </c:if>
                                </div>
                                <div class="story__card-content">
                                    <span><c:out value="${cat.boardContents.replaceAll('\\\<.*?\\\>','')}"></c:out></span>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:when test="${catList.size() eq 0}">
                    <div class="main__contents-empty">
                        <p>게시물이 없어요.</p>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </div>
    <div class="main__wrap">
        <div class="main__title">
            <span>유기동물 공고</span>
        </div>
        <div class="story__more" data-link="/lostPet/lostPet">
            <p>더보기</p>
        </div>
        <div class="main__contents">
            <c:choose>
                <c:when test="${lostPetList.size() ne 0}">
                    <ul class="main__contents-lost-wrap">
                        <c:forEach items="${lostPetList}" var="lost">
                            <li class="lostPet__card-wrap" data-link="/lostPet/lostPetDetail?seq=${lost.lostSeq}">
                                <div class="lostPet__card-image">
                                    <c:if test="${lost.thumbnail ne null}">
                                        <div style="background-image: url('${lost.thumbnail}')"></div>
                                    </c:if>
                                    <span>${lost.lostLocation}</span>
                                </div>
                                <div class="lostPet__card-content">
                                    <ul>
                                        <li class="lostPet__card-index-wrap">
                                            <span>품종</span>
                                            <span class="lostPet__point">[${lost.lostTypeName}] ${lost.lostKind}</span>
                                        </li>
                                        <li class="lostPet__card-index-wrap">
                                            <span>성별</span>
                                            <span>${lost.lostGenderName}</span>
                                        </li>
                                        <li class="lostPet__card-index-wrap">
                                            <span>공고</span>
                                            <span>${lost.lostWdate}</span>
                                        </li>
                                        <li class="lostPet__card-index-wrap">
                                            <span>상태</span>
                                            <span>${lost.lostStatusName}</span>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:when test="${lostPetList.size() eq 0}">
                    <div class="main__contents-empty">
                        <p>게시물이 없어요.</p>
                    </div>
                </c:when>
            </c:choose>
            <div id="enters"></div>
        </div>
    </div>