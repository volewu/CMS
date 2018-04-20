# CMS
 SSM 实用网站 CMS 内容管理系统
 
 
 #### 未实现的功能
 图片压缩
 畅言的配置
 百度站内搜索的配置
 qq 群与 qq 的配置
 
 ####问题
 * 关于图片上传？
 在测试环境下，图片是上传到 tomcat 的缓存中去，并不会出现在项目的指定路径下，到图片的请求地址不变。
 
 #### taglib 标签
 * <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>:用来处理函数的标签
 ```$xslt
 <c:forEach var="arcType" items="${arcTypeList}">
        <li>
            <a href="${pageContext.request.contextPath}/arcType/${arcType.id}">${arcType.typeName}</a>
        </li>
  </c:forEach>
```
 * <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> ：用于截取字符的标签
 ```
 ${fn:substring(article.title,0 ,20 )}  
 0: 代表从什么位置开始
 20：代表到什么位置结束
 ```

 * <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>：用户时间转换
 ```$xslt
<fmt:formatDate value="${article.publishDate}" pattern="MM-dd"/>
```
#### SQL 语句
```$xslt
取上一位数据
SELECT * FROM t_article WHERE id &lt; #{id} ORDER BY id DESC limit 1;
取下一位数据
SELECT * FROM t_article WHERE id &gt; #{id} ORDER BY id ASC limit 1;
```
