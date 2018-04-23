<%--
  Created by IntelliJ IDEA.
  User: vole
  Date: 2018/4/19
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理界面-Open1111官方网站 -南通小锋网络科技有限公司</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">

        var url;

        function openTab(text,url,iconCls){
            if($("#tabs").tabs("exists",text)){
                $("#tabs").tabs("select",text);
            }else{
                var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/admin/"+url+"'></iframe>";
                $("#tabs").tabs("add",{
                    title:text,
                    iconCls:iconCls,
                    closable:true,
                    content:content
                });
            }
        }

        function openPasswordModifyDialog(){
            $("#dlg").dialog("open").dialog("setTitle","修改密码");
            url="${pageContext.request.contextPath}/admin/manager/modifyPassword.do";
        }



        function modifyPassword(){
            $("#fm").form("submit",{
                url:url,
                onSubmit:function(){
                    var newPassword=$("#newPassword").val();
                    var newPassword2=$("#newPassword2").val();
                    if(!$(this).form("validate")){
                        return false;
                    }
                    if(newPassword!=newPassword2){
                        $.messager.alert("系统提示","确认新密码输入错误！");
                        return false;
                    }
                    return true;
                },
                success:function(result){
                    var result=eval('('+result+')');
                    if(result.success){
                        $.messager.alert("系统提示","密码修改成功，下一次登录生效！");
                        $("#dlg").dialog("close");
                        resetValue();
                    }else{
                        $.messager.alert("系统提示","密码修改失败！");
                        return;
                    }
                }
            });
        }

        function resetValue(){
            $("#newPassword").val("");
            $("#newPassword2").val("");
        }

        function closePasswordModifyDialog(){
            $("#dlg").dialog("close");
            resetValue();
        }

        function logout(){
            $.messager.confirm("系统提示","您确定要退出系统吗？",function(r){
                if(r){
                    window.location.href='${pageContext.request.contextPath}/admin/manager/logout.do';
                }
            });
        }


    </script>
</head>
<body class="easyui-layout">
<div region="north" style="height: 78px;background-color: #E0ECFF">
    <table style="padding: 5px" width="100%">
        <tr>
            <td width="50%">
                <img alt="logo" src="${pageContext.request.contextPath}/static/images/bglogo.png">
            </td>
            <td valign="bottom" align="right" width="50%">
                <font size="3">&nbsp;&nbsp;<strong>欢迎：</strong>${currentUser.userName }</font>
            </td>
        </tr>
    </table>
</div>
<div region="center" >
    <div class="easyui-tabs" fit="true" border="false" id="tabs">
        <div title="首页" data-options="iconCls:'icon-home'">
            <div align="center" style="padding-top: 100px"><font color="red" size="10">欢迎使用</font></div>
        </div>
    </div>
</div>
<div region="west" style="width:200px;" title="导航菜单" split="true">
    <div style="padding-top: 10px;padding-left: 10px;">
        <a href="javascript:openTab('写帖子','writeArticle.jsp','icon-writeArticle')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeArticle'" style="width: 150px">写帖子</a>
        <a href="javascript:openTab('帖子信息管理','articleManage.jsp','icon-tzgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-tzgl'" style="width: 150px;">帖子信息管理</a>
        <a href="javascript:openTab('帖子类别管理','arcTypeManage.jsp','icon-tzlb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-tzlb'" style="width: 150px;">帖子类别管理</a>
        <a href="javascript:openTab('友情链接管理','linkManage.jsp','icon-link')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-link'" style="width: 150px;">友情链接管理</a>
        <a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
        <a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
    </div>
</div>
<div region="south" style="height: 25px;padding: 5px" align="center">
    Copyright © 2012-2016 南通小锋网络科技有限公司  版权所有
</div>



<div id="dlg" class="easyui-dialog" style="width: 400px;height: 200px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">

    <form id="fm" method="post">
        <table cellspacing="8px">
            <tr>
                <td>
                    用户名：
                </td>
                <td>
                    <input type="text" id="userName" name="userName" readonly="readonly" value="${currentUser.userName }" style="width: 200px"/>
                </td>
            </tr>
            <tr>
                <td>
                    新密码：
                </td>
                <td>
                    <input type="password" id="newPassword" name="newPassword" class="easyui-validatebox"  required="true" style="width:200px"/>
                </td>
            </tr>

            <tr>
                <td>
                    确认新密码：
                </td>
                <td>
                    <input type="password" id="newPassword2" name="newPassword2" class="easyui-validatebox"  required="true" style="width:200px"/>
                </td>
            </tr>
        </table>
    </form>

</div>

<div id="dlg-buttons">
    <a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>