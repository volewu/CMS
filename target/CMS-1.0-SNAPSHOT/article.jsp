<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${article.title}_CMS 内容管理系统</title>
    <META NAME="Author" CONTENT="vole">
    <meta name="keywords" content="${article.keyWords}"/>
    <meta name="description"
          content="${article.summary}"/>
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
                <div class="dataHeader navi">${navCode }</div>
                <div class="article_title"><h2><strong>${article.title }</strong></h2></div>
                <div class="share">
                    <div class="bshare-custom"><a title="分享到QQ空间" class="bshare-qzone"></a>
                        <a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
                        <a title="分享到人人网" class="bshare-renren"></a>
                        <a title="分享到腾讯微博" class="bshare-qqmb"></a>
                        <a title="分享到网易微博" class="bshare-neteasemb"></a>
                        <a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
                        <span class="BSHARE_COUNT bshare-share-count">0</span></div>
                    <script type="text/javascript" charset="utf-8"
                            src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
                    <script type="text/javascript" charset="utf-8"
                            src="http://static.bshare.cn/b/bshareC0.js"></script>
                </div>
                <div class="article_info">
                    发布时间：『<fmt:formatDate value="${article.publishDate }" pattern="yyyy-MM-dd HH:mm"/>』
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    帖子类别：『${article.arcType.typeName}』&nbsp;&nbsp;阅读次数：${article.click}
                </div>
                <div class="article_summary">
                    ${article.summary }
                </div>
                <div class="article_content">
                    ${article.content }
                </div>
                <div class="article_keyWord">
                    <font><strong>关键字：</strong></font>
                    <c:choose>
                        <c:when test="${keyWords==null }">
                            &nbsp;&nbsp;无
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="keyWord" items="${keyWords }">
                                &nbsp;&nbsp;<a href="http://zhannei.baidu.com/cse/search?q=${keyWord }&s=5738221493575509323&entry=1" target="_blank">${keyWord }</a>&nbsp;&nbsp;
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="article_lastAndNextPage">
                    ${pageCode}
                </div>
            </div>
            <div>
                <!--畅言PC版 需要自己登入该系统，提供相应的代码-->
                <div id="SOHUCS" sid="${article.id }"></div>
                <script charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/changyan.js" ></script>
                <script type="text/javascript">
                    window.changyan.api.config({
                        appid: 'cysGfqVIm',
                        conf: 'prod_b63f4160d3c1165b9a6d353811cc8e2d'
                    });
                </script>
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