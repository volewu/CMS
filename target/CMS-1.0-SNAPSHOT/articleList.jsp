<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${arcType.typeName}_CMS 内容管理系统</title>
    <META NAME="Author" CONTENT="vole">
    <meta name="keywords" content="${arcType.keywords}"/>
    <meta name="description"
          content="${arcType.description}"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cms.css">
    <script src="${pageContext.request.contextPath}/static/js/jQuery.js"></script>
</head>
<body>
<jsp:include page="/common/head.jsp"/>
<jsp:include page="/common/menu.jsp"/>

<div class="content">
    <div class="w960">
        <div class="pLeft">
            <div class="data_list">
                <div class="dataHeader navi">${navCode}</div>
                <div class="datas article_type_list">
                    <ul>
                        <c:forEach var="article" items="${articleList }">
                            <li><a target="_blank"
                                   href="${pageContext.request.contextPath}/article/${article.id }.html"
                                   title="${article.title }">[<fmt:formatDate value="${article.publishDate }"
                                    pattern="MM-dd"/>]&nbsp;&nbsp;<font
                                    color="${article.titleColor }">${fn:substring(article.title,0,20) }</font></a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="upAndDownPage">
                    ${pageCode}
                </div>
            </div>

        </div>


        <div class="pRight">
            <div class="data_list">
                <div class="dataHeader">站长推荐</div>
                <div class="datas">
                    <ul>
                        <c:forEach var="article" items="${recommendArticleList }">
                            <li><a target="_blank"
                                   href="${pageContext.request.contextPath}/article/${article.id}.html"
                                   title="${article.title }"><font
                                    color="${article.titleColor }">${fn:substring(article.title,0,16) }</font></a>
                            </li>
                        </c:forEach>

                    </ul>
                </div>
            </div>

            <div class="data_list" style="margin-top: 10px;">
                <div class="dataHeader">最近更新</div>
                <div class="datas">
                    <ul>
                        <c:forEach var="article" items="${newestArticleList }">
                            <li><a target="_blank"
                                   href="${pageContext.request.contextPath}/article/${article.id}.html"
                                   title="${article.title }"><font
                                    color="${article.titleColor }">${fn:substring(article.title,0,16) }</font></a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/common/foot.jsp"/>
</body>
</html>  