<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="menu">
    <div class="w960 m960">
        <ul>
            <li class="first"><a href="/index.jsp">首页</a></li>

            <c:forEach var="arcType" items="${arcTypeList}">
                <li>
                    <a href="${pageContext.request.contextPath}/arcType/${arcType.id}">${arcType.typeName}</a>
                </li>
            </c:forEach>

        </ul>
    </div>
</div>