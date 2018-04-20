<%--
  编写者： vole 
  Time： 2018/4/20.10:38
  内容：帖子管理界面
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>帖子管理页面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">

        function formatTitle(val, row) {
            return "&nbsp;<a target='_blank' href='${pageContext.request.contextPath}/article/" + row.id + ".html'>" + val + "</a>";
        }

        function formatArcType(val, row) {
            return val.typeName;
        }

        function openArticleModifyTab(){
            var selectedRows=$("#dg").datagrid("getSelections");
            if(selectedRows.length!=1){
                $.messager.alert("系统提示","请选择一个要修改的帖子！");
                return;
            }
            var row=selectedRows[0];
            window.parent.openTab("修改博客","modifyArticle.jsp?id="+row.id,"icon-writeArticle");
        }

    </script>
</head>
<body style="margin: 1px">
<table id="dg" title="帖子管理" class="easyui-datagrid"
       fitColumns="true" pagination="true" rownumbers="true"
       url="${pageContext.request.contextPath}/admin/article/list.do" fit="true" toolbar="#tb">
    <thead>
        <tr>
            <th field="cb" checkbox="true" align="center"></th>
            <th field="id" width="20" align="center">编号</th>
            <th field="title" width="200" align="center" formatter="formatTitle">标题</th>
            <th field="publishDate" width="50" align="center">发布日期</th>
            <th field="arcType" width="50" align="center" formatter="formatArcType">博客类别</th>
            <th field="click" width="50" align="center">阅读次数</th>
        </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:openArticleModifyTab()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
    </div>
</div>
</body>
</html>  
