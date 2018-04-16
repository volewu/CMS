# CMS
 SSM 实用网站 CMS 内容管理系统
 
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

