# CMS
#### 一、项目简介：

> 一个采用 SSM 框架实现的 CMS  Web 系统；

#### 二、项目姿势：

* 开发工具：IDEA + Tomcat8.5
* 核心框架：Spring4、SpringMVC、Mybatis3
* 数据库：MySql（[数据库链接：db_cms](https://github.com/volewu/CMS/blob/master/db_cms.sql)）
* 项目管理：Maven3
* 其他框架：Shiro(安全) + EsayUI(后台管理) + UEditor(百度在线编辑器) + Druid(阿里巴巴数据库连接池) + 原生HTML、CSS
* 项目运行截图

**整体效果：**

![cms](https://github.com/volewu/CMS/blob/master/preview/cms.gif?raw=true)


 #### 三、未实的功能
- [ ] 畅言的配置 
- [ ] 百度站内搜索的配置
- [ ] qq 群与 qq 的配置
- [ ] 把 UEditor 换成 MD
- [ ] 极验(登入验证滑动图片)
 #### 四、问题
 * 关于图片上传？
    在测试环境下，图片是上传到 tomcat 的缓存中去，并不会出现在项目的指定路径下，到图片的请求地址不变。

#### 五、姿势点记录

 ##### 5.1 taglib 标签

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
##### 5.2 MySQL 语句
```mysql
# 取上一位数据:
# &lt;  <  小于符号
SELECT * FROM t_article WHERE id &lt; #{id} ORDER BY id DESC limit 1;
# 取下一位数据
# &gt; >   大于符号
SELECT * FROM t_article WHERE id &gt; #{id} ORDER BY id ASC limit 1;
```
