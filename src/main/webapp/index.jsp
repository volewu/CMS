<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CMS 内容管理系统</title>
    <META NAME="Author" CONTENT="Java1234_小锋老师">
    <meta name="keywords" content="Java内容管理系统,JavaCMS,Java 开源,Java 爬虫,JavaSEO,Java CMS"/>
    <meta name="description"
          content="CMS 专注于研发 Java 建站,Java 爬虫,JavaSEO 教程.传授广大学员用 Java 技术来实现互联网资源的搬运,整合汇聚互联网资源建站,顺便获取一些搬运费补贴家用."/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cms.css">
    <script src="${pageContext.request.contextPath}/static/js/jQuery.js"></script>
</head>
<body>
<jsp:include page="/common/head.jsp"/>
<jsp:include page="/common/menu.jsp"/>

<div class="content">
    <div class="w960">

        <div class="left">
            <DIV style="width: 330px; height: 228px;" class="tuhuo">
                <A href="" target="_blank"><IMG
                        style="width: 330px; height: 208px;" id="fou_img" src=""></A> <A
                    href="#"> <IMG style="display: none;" class="tu_img"
                                   src="${pageContext.request.contextPath}/static/userImages/1.jpg"
                                   width="330" height="208"/>
            </A> <A href="#"> <IMG style="display: none;" class="tu_img"
                                   src="${pageContext.request.contextPath}/static/userImages/2.jpg"
                                   width="330" height="208"/>
            </A> <A href="#"> <IMG style="display: none;" class="tu_img"
                                   src="${pageContext.request.contextPath}/static/userImages/3.jpg"
                                   width="330" height="208"/>
            </A> <A href="#"> <IMG style="display: none;" class="tu_img"
                                   src="${pageContext.request.contextPath}/static/userImages/4.jpg"
                                   width="330" height="208"/>
            </A> <A href="#"> <IMG style="display: none;" class="tu_img"
                                   src="${pageContext.request.contextPath}/static/userImages/5.jpg"
                                   width="330" height="208"/>
            </A>
                <P style="height: 20px;" class="tc">
                    <A href="#" target="_blank" title="1">1</A>
                </P>
                <P style="height: 20px;" class="tc">
                    <A href="#" target="_blank" title="2">2</A>
                </P>
                <P style="height: 20px;" class="tc">
                    <A href="#" target="_blank" title="3">3</A>
                </P>
                <P style="height: 20px;" class="tc">
                    <A href="#" target="_blank" title="4">4</A>
                </P>
                <P style="height: 20px;" class="tc">
                    <A href="#" target="_blank" title="5">5</A>
                </P>
                <UL>
                    <LI class="fouce">1</LI>
                    <LI>2</LI>
                    <LI>3</LI>
                    <LI>4</LI>
                    <LI>5</LI>
                </UL>
            </DIV>
        </div>

        <div class="middle">

            <div class="data_list">
                <div class="dataHeader">最近更新</div>
                <div class="datas">
                    <ul>
                        <c:forEach var="article" items="${articleList}">
                            <li><a target="_blank" href="${pageContext.request.contextPath}/article/${article.id}.html"
                                   title="${article.title}">[<fmt:formatDate value="${article.publishDate}" pattern="MM-dd"/>]&nbsp;&nbsp;
                                <font color="${article.titleColor}">${fn:substring(article.title,0 ,20 )}</font>
                            </a></li>
                        </c:forEach>

                    </ul>
                </div>
            </div>
        </div>

        <div class="right">
            <div class="data_list">
                <div class="dataHeader">站长推荐</div>
                <div class="datas">
                    <ul>

                        <li><a target="_blank" href="/article/152.html"
                               title="做活动，领取Java爬虫-Java包下载网源码"><font color="#FF0000">做活动，领取Java爬虫-Jav</font></a>
                        </li>

                        <li><a target="_blank" href="/article/86.html"
                               title="做活动，领取百度云搜索引擎V2.0源码"><font
                                color="#FF0000">做活动，领取百度云搜索引擎V2.</font></a></li>

                        <li><a target="_blank" href="/article/73.html" title="关于我们"><font
                                color="#FF0000">关于我们</font></a></li>

                        <li><a target="_blank" href="/article/77.html"
                               title="如何发布Web项目到互联网"><font color="#FF0000">如何发布Web项目到互联网</font></a>
                        </li>

                        <li><a target="_blank" href="/article/74.html"
                               title="广告联盟推荐-七七联盟"><font color="#FF0000">广告联盟推荐-七七联盟</font></a></li>

                        <li><a target="_blank" href="/article/68.html"
                               title="Java HelloWorld实现及Java运行原理介绍"><font color="#FF0000">Java
                            HelloWorld实</font></a></li>

                        <li><a target="_blank" href="/article/67.html"
                               title="Java运行环境搭建之Jdk配置"><font
                                color="#FF0000">Java运行环境搭建之Jdk配置</font></a></li>

                    </ul>
                </div>
            </div>
        </div>


        <div class="w960 article_row">
            <div class="data_list article_list">
                <div class="dataHeader">
                    Java基础<span class="more"><a href="/arcType/1.html">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>

                        <li>[11-05]&nbsp;&nbsp;<a href="/article/72.html"
                                                  title="Java基本数据类型-数据类型分类"><font color="">Java基本数据类型-数据类型分类</font></a>
                        </li>


                        <li>[11-05]&nbsp;&nbsp;<a href="/article/71.html"
                                                  title="Java中的关键字"><font color="">Java中的关键字</font></a>
                        </li>


                        <li>[11-05]&nbsp;&nbsp;<a href="/article/70.html"
                                                  title="Java标识符命名"><font color="">Java标识符命名</font></a>
                        </li>


                        <li>[11-05]&nbsp;&nbsp;<a href="/article/69.html"
                                                  title="java注释"><font color="">java注释</font></a>
                        </li>


                        <li>[11-05]&nbsp;&nbsp;<a href="/article/68.html"
                                                  title="Java HelloWorld实现及Java运行原理介绍"><font
                                color="#FF0000">Java
                            HelloWorld实现及</font></a></li>


                        <li>[11-05]&nbsp;&nbsp;<a href="/article/67.html"
                                                  title="Java运行环境搭建之Jdk配置"><font color="#FF0000">Java运行环境搭建之Jdk配置</font></a>
                        </li>


                        <li>[11-05]&nbsp;&nbsp;<a href="/article/66.html"
                                                  title="Java简介"><font color="">Java简介</font></a>
                        </li>


                        <li>[11-05]&nbsp;&nbsp;<a href="/article/65.html"
                                                  title="Java HelloWorld实现"><font color="">Java
                            HelloWorld实现</font></a></li>

                    </ul>
                </div>
            </div>

            <div class="data_list article_list" style="margin-left: 12px">
                <div class="dataHeader">
                    网页基础<span class="more"><a href="/arcType/2.html">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>

                        <li>[11-28]&nbsp;&nbsp;<a href="/article/143.html"
                                                  title="css 属性选择器"><font color="">css 属性选择器</font></a>
                        </li>


                        <li>[11-28]&nbsp;&nbsp;<a href="/article/142.html"
                                                  title="css 类选择器"><font color="">css
                            类选择器</font></a></li>


                        <li>[11-28]&nbsp;&nbsp;<a href="/article/141.html"
                                                  title="css id 选择器"><font color="">css id
                            选择器</font></a></li>


                        <li>[11-08]&nbsp;&nbsp;<a href="/article/82.html"
                                                  title="HTML文本排版"><font
                                color="">HTML文本排版</font></a></li>


                        <li>[11-08]&nbsp;&nbsp;<a href="/article/81.html"
                                                  title="HTML入门程序"><font
                                color="">HTML入门程序</font></a></li>


                        <li>[11-08]&nbsp;&nbsp;<a href="/article/80.html"
                                                  title="Web基础"><font color="">Web基础</font></a></li>


                        <li>[11-06]&nbsp;&nbsp;<a href="/article/76.html"
                                                  title="基本的 HTML 标签"><font color="">基本的 HTML
                            标签</font></a></li>


                        <li>[11-06]&nbsp;&nbsp;<a href="/article/75.html"
                                                  title="HTML 简介"><font color="">HTML 简介</font></a>
                        </li>

                    </ul>
                </div>
            </div>


            <div class="data_list article_list" style="margin-left: 12px">
                <div class="dataHeader">
                    Java建站<span class="more"><a href="/arcType/4.html">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>

                        <li>[01-24]&nbsp;&nbsp;<a href="/article/86.html"
                                                  title="做活动，领取百度云搜索引擎V2.0源码"><font color="#FF0000">做活动，领取百度云搜索引擎V2.0源</font></a>
                        </li>


                        <li>[01-03]&nbsp;&nbsp;<a href="/article/151.html"
                                                  title="Tomcat OutOfMemoryError PermGen space 的解决办法"><font
                                color="">Tomcat OutOfMemory</font></a></li>


                        <li>[12-04]&nbsp;&nbsp;<a href="/article/147.html"
                                                  title="http content-type常见文件格式类型"><font color="">http
                            content-type常</font></a></li>


                        <li>[12-04]&nbsp;&nbsp;<a href="/article/145.html"
                                                  title="主机"><font color="">主机</font></a></li>


                        <li>[12-03]&nbsp;&nbsp;<a href="/article/144.html"
                                                  title="域名"><font color="">域名</font></a></li>


                        <li>[11-09]&nbsp;&nbsp;<a href="/article/85.html"
                                                  title="解决Url带中文参数乱码问题"><font color="">解决Url带中文参数乱码问题</font></a>
                        </li>


                        <li>[11-09]&nbsp;&nbsp;<a href="/article/84.html"
                                                  title="Tomcat多域名配置"><font
                                color="">Tomcat多域名配置</font></a></li>


                        <li>[11-06]&nbsp;&nbsp;<a href="/article/77.html"
                                                  title="如何发布Web项目到互联网"><font color="#FF0000">如何发布Web项目到互联网</font></a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>


        <div class="w960 article_row">

            <div class="data_list article_list">
                <div class="dataHeader">
                    Java爬虫<span class="more"><a href="/arcType/5.html">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>

                        <li>[01-24]&nbsp;&nbsp;<a href="/article/152.html"
                                                  title="做活动，领取Java爬虫-Java包下载网源码"><font
                                color="#FF0000">做活动，领取Java爬虫-Java包</font></a></li>


                        <li>[12-04]&nbsp;&nbsp;<a href="/article/146.html"
                                                  title="透明代理、匿名代理、混淆代理、高匿代理有什么区别？"><font
                                color="">透明代理、匿名代理、混淆代理、高匿代</font></a></li>


                        <li>[11-21]&nbsp;&nbsp;<a href="/article/140.html"
                                                  title="HttpClient HTTP缓存"><font color="">HttpClient
                            HTTP缓存</font></a></li>


                        <li>[11-21]&nbsp;&nbsp;<a href="/article/139.html"
                                                  title="HttpClient 响应处理"><font color="">HttpClient
                            响应处理</font></a></li>


                        <li>[11-21]&nbsp;&nbsp;<a href="/article/138.html"
                                                  title="Easy to use facade API"><font color="">Easy
                            to use facade</font></a></li>


                        <li>[11-20]&nbsp;&nbsp;<a href="/article/137.html"
                                                  title="HttpClient SPNEGO/Kerberos认证"><font
                                color="">HttpClient
                            SPNEGO/</font></a></li>


                        <li>[11-20]&nbsp;&nbsp;<a href="/article/136.html"
                                                  title="HttpClient NTLM连接持久性"><font color="">HttpClient
                            NTLM连接持</font></a></li>


                        <li>[11-20]&nbsp;&nbsp;<a href="/article/135.html"
                                                  title="HttpClient NTLM认证"><font color="">HttpClient
                            NTLM认证</font></a></li>

                    </ul>
                </div>
            </div>


            <div class="data_list article_list" style="margin-left: 12px">


                <div class="dataHeader">
                    网站SEO<span class="more"><a href="/arcType/6.html">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>

                        <li>[11-08]&nbsp;&nbsp;<a href="/article/83.html"
                                                  title="搜索引擎工作原理大体过程"><font
                                color="">搜索引擎工作原理大体过程</font></a>
                        </li>


                        <li>[11-07]&nbsp;&nbsp;<a href="/article/79.html"
                                                  title="为什么要做SEO"><font
                                color="">为什么要做SEO</font></a></li>


                        <li>[11-07]&nbsp;&nbsp;<a href="/article/78.html"
                                                  title="什么是SEO"><font
                                color="">什么是SEO</font></a></li>

                    </ul>
                </div>
            </div>


            <div class="data_list article_list" style="margin-left: 12px">
                <div class="dataHeader">
                    广告联盟<span class="more"><a href="/arcType/7.html">更多...</a></span>
                </div>
                <div class="datas">
                    <ul>

                        <li>[12-18]&nbsp;&nbsp;<a href="/article/150.html"
                                                  title="广告联盟推荐-搜狗联盟"><font
                                color="">广告联盟推荐-搜狗联盟</font></a></li>


                        <li>[12-18]&nbsp;&nbsp;<a href="/article/149.html"
                                                  title="广告联盟推荐-谷歌联盟"><font color="#FF0000">广告联盟推荐-谷歌联盟</font></a>
                        </li>


                        <li>[12-18]&nbsp;&nbsp;<a href="/article/148.html"
                                                  title="广告联盟推荐-百度联盟"><font color="#FF0000">广告联盟推荐-百度联盟</font></a>
                        </li>


                        <li>[11-19]&nbsp;&nbsp;<a href="/article/121.html"
                                                  title="广告联盟推荐-大圣联盟(安徽)"><font color="">广告联盟推荐-大圣联盟(安徽)</font></a>
                        </li>


                        <li>[11-19]&nbsp;&nbsp;<a href="/article/120.html"
                                                  title="广告联盟推荐-百游联盟"><font
                                color="">广告联盟推荐-百游联盟</font></a></li>


                        <li>[11-05]&nbsp;&nbsp;<a href="/article/74.html"
                                                  title="广告联盟推荐-七七联盟"><font color="#FF0000">广告联盟推荐-七七联盟</font></a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="/common/link.jsp"/>
<jsp:include page="/common/foot.jsp"/>

</body>
<script type="text/javascript">
    var auto;
    var index = 0;
    $('.tuhuo ul li').hover(function () {
        clearTimeout(auto);
        index = $(this).index();
        move(index);
    }, function () {
        auto = setTimeout('autogo(' + index + ')', 3000);
    });

    function autogo() {
        if (index < 3) {
            move(index);
            index++;
        } else {
            index = 0;
            move(index);
            index++;
        }
    }

    function move(l) {
        var src = $('.tu_img').eq(index).attr('src');
        $("#fou_img").css({
            "opacity": "0"
        });
        $('#fou_img').attr('src', src);
        $('#fou_img').stop(true).animate({
            opacity: '1'
        }, 1000);
        $('.tuhuo ul li').removeClass('fouce');
        $('.tuhuo ul li').eq(index).addClass('fouce');
        $('.tuhuo p').hide();
        $('.tuhuo p').eq(index).show();
        var ao = $('.tuhuo p').eq(index).children('a').attr('href');
        $('#fou_img').parent('a').attr("href", ao);
    }

    autogo();
    setInterval('autogo()', 3000);
</script>
</html>  