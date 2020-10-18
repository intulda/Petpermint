<%--
  Created by IntelliJ IDEA.
  User: kimbogeun
  Date: 2020/09/27
  Time: 12:12 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <tiles:insertAttribute name="headResource"/>
</head>
<body>
        <tiles:insertAttribute name="header"/>
        <tiles:insertAttribute name="menu"/>
        <section class="main__container" id="mainContainer">
            <tiles:insertAttribute name="body"/>
        </section>
        <tiles:insertAttribute name="footer"/>
</body>
</html>
