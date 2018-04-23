# CMS
 ### SSM 实用网站 CMS 内容管理系统：

使用 Spring4 + Springmvc + Mybatis3 架构，采用 Mysql 数据库；使用 Maven3 管理项目，使用 Shiro 作为项目安全框架，支持 restful 风格；前台网页 Html+css 纯手工打造；后台管理使用主流易用的 EasyUI 轻量级框架；数据库连接池使用的是阿里巴巴的 Druid；在线编辑器使用了百度的 UEditor，支持单图，多图上传，支持截图上传，支持代码高亮特性；


 #### 未实现的功能
- [ ] 畅言的配置 


- [ ] 百度站内搜索的配置


- [ ] qq 群与 qq 的配置
- [ ] 把 UEditor 换成 MD

 ####问题
 * 关于图片上传？
    在测试环境下，图片是上传到 tomcat 的缓存中去，并不会出现在项目的指定路径下，到图片的请求地址不变。

 #### taglib 标签
 * <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>:用来处理函数的标签
 ```jsp
 <c:forEach var="arcType" items="${arcTypeList}">
        <li><a href="${pageContext.request.contextPath}/arcType/${arcType.id}">${arcType.typeName}</a></li>
  </c:forEach>
 ```
 * <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> ：
 ```jsp
 用于截取字符的标签
${fn:substring(article.title,0 ,20 )}  
 0: 代表从什么位置开始
 20：代表到什么位置结束
 ```

 * <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>：
 ```jsp
用于时间转换
<fmt:formatDate value="${article.publishDate}" pattern="MM-dd"/>
 ```
#### SQL 语句
```mysql
# 取上一位数据:
# &lt;  <  小于符号
SELECT * FROM t_article WHERE id &lt; #{id} ORDER BY id DESC limit 1;
# 取下一位数据
# &gt; >   大于符号
SELECT * FROM t_article WHERE id &gt; #{id} ORDER BY id ASC limit 1;
```
