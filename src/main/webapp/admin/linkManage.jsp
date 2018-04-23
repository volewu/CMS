<%--
  编写者： vole 
  Time： 2018/4/23.15:51
  内容：友情链接界面
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>友情链接管理页面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">

        var url;

        function openLinkAddDialog(){
            $("#dlg").dialog("open").dialog("setTitle","添加友情链接信息");
            url="${pageContext.request.contextPath}/admin/link/save.do";
        }

        function openLinkModifyDialog(){
            var selectedRows=$("#dg").datagrid("getSelections");
            if(selectedRows.length!=1){
                $.messager.alert("系统提示","请选择一个要修改的友情链接！");
                return;
            }
            var row=selectedRows[0];
            $("#dlg").dialog("open").dialog("setTitle","编辑友情链接信息");
            $("#fm").form("load",row);
            url="${pageContext.request.contextPath}/admin/link/save.do?id="+row.id;
        }



        function saveLink(){
            $("#fm").form("submit",{
                url:url,
                onSubmit:function(){
                    return $(this).form("validate");
                },
                success:function(result){
                    var result=eval('('+result+')');
                    if(result.success){
                        $.messager.alert("系统提示","保存成功！");
                        $("#dlg").dialog("close");
                        $("#dg").datagrid("reload");
                        resetValue();
                    }else{
                        $.messager.alert("系统提示","保存失败！");
                        return;
                    }
                }
            });
        }

        function resetValue(){
            $("#name").val("");
            $("#url").val("");
            $("#sortNo").val("");
        }

        function closeLinkDialog(){
            $("#dlg").dialog("close");
            resetValue();
        }

        function deleteLink(){
            var selectedRows=$("#dg").datagrid("getSelections");
            if(selectedRows.length==0){
                $.messager.alert("系统提示","请选择要删除的友情链接！");
                return;
            }
            var strIds=[];
            for(var i=0;i<selectedRows.length;i++){
                strIds.push(selectedRows[i].id);
            }
            var ids=strIds.join(",");
            $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
                if(r){
                    $.post("${pageContext.request.contextPath}/admin/link/delete.do",{ids:ids},function(result){
                        if(result.success){
                            $.messager.alert("系统提示","数据已成功删除！");
                            $("#dg").datagrid("reload");
                        }else{
                            $.messager.alert("系统提示","数据删除失败！");
                        }
                    },"json");
                }
            });
        }

    </script>
</head>
<body style="margin: 1px">
<table id="dg" title="友情链接管理" class="easyui-datagrid"
       fitColumns="true" pagination="true" rownumbers="true"
       url="${pageContext.request.contextPath}/admin/link/list.do" fit="true" toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="20" align="center">编号</th>
        <th field="name" width="100" align="center">链接名称</th>
        <th field="url" width="150" align="center">链接地址</th>
        <th field="sortNo" width="50" align="center">排列序号 </th>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:openLinkAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
        <a href="javascript:openLinkModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:deleteLink()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>
</div>


<div id="dlg" class="easyui-dialog" style="width: 500px;height: 200px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">

    <form id="fm" method="post">
        <table cellspacing="8px">
            <tr>
                <td>
                    友情链接名称：
                </td>
                <td>
                    <input type="text" id="name" name="name" class="easyui-validatebox" required="true"/>
                </td>
            </tr>
            <tr>
                <td>
                    友情链接地址：
                </td>
                <td>
                    <input type="text" id="url" name="url" class="easyui-validatebox" validtype="url" required="true" style="width:250px"/>
                </td>
            </tr>
            <tr>
                <td>
                    友情链接排序：
                </td>
                <td>
                    <input type="text" id="sortNo" name="sortNo" class="easyui-numberbox" required="true" style="width: 60px"/>&nbsp;(类别根据排序序号从小到大排序)&nbsp;
                </td>
            </tr>

        </table>
    </form>

</div>

<div id="dlg-buttons">
    <a href="javascript:saveLink()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeLinkDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>
