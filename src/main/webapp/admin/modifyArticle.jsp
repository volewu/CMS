<%--
  编写者： vole 
  Time： 2018/4/20.17:02
  内容：
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改帖子页面</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" charset="gbk"
            src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="gbk"
            src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="gbk"
            src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/colorPicker/js/jquery.bigcolorpicker.js"></script>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/colorPicker/css/jquery.bigcolorpicker.css"
          type="text/css"/>
    <script type="text/javascript">

        function checkChange() {
            if (document.getElementById("isSlide").checked) {
                $("#hdtp").show();
            } else {
                $("#hdtp").hide();
            }
        }

        //        function submitData() {
        //            var title = $("#title").val();
        //            var arcTypeId = $("#arcTypeId").combobox("getValue");
        //            var summary = $("#summary").val();
        //            var editor = UE.getEditor('editor').getContent();
        //
        //            if (title == null || title == '') {
        //                alert("请输入标题");
        //            } else if (arcTypeId == null || arcTypeId == '') {
        //                alert("请选择帖子类别");
        //            } else if (summary == null || summary == '') {
        //                alert("请输入摘要");
        //            } else if (editor == null || editor == '') {
        //                alert("请输入内容");
        //            } else {
        //                $("#content").val(editor);
        //                $("#fm").submit();
        //            }
        //
        //
        //        }

        function submitData() {
            $("#fm").form("submit", {
                url: "${pageContext.request.contextPath}/admin/article/save.do",
                onSubmit: function () {
                    var arcTypeId = $("#arcTypeId").combobox("getValue");
                    var editor = UE.getEditor('editor').getContent();
                    if (arcTypeId == null || arcTypeId == '') {
                        $.messager.alert("系统提示", "请选择帖子类别！");
                        return false;
                    }
                    if (editor == null || editor == '') {
                        $.messager.alert("系统提示", "请输入内容！");
                        return false;
                    }
                    $("#content").val(editor);
                    return $(this).form("validate");
                },
                success: function (result) {
                    var result = eval('(' + result + ')');
                    console.log(result);
                    if (result.success) {
                        alert(" 修改成功！");
                        window.parent.closeTab("修改博客");
                    } else {
                        $.messager.alert("系统提示", "修改失败！");
                        return;
                    }
                }
            });
        }

    </script>
</head>
<body style="margin: 1px">
<div id="p" class="easyui-panel" title="修改帖子" style="padding: 5px">
    <form id="fm" method="post"
          enctype="multipart/form-data">
        <table cellspacing="10px">
            <tr>
                <td width="80px">帖子标题：</td>
                <td><input type="text" id="title" name="title" style="width: 400px"
                           class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td>所属类别：</td>
                <td>
                    <select class="easyui-combobox" style="width: 154px" id="arcTypeId"
                            name="arcType.id" editable="false" panelHeight="auto">
                        <option value="">请选择帖子类别...</option>
                        <c:forEach var="arcType" items="${arcTypeList }">
                            <option value="${arcType.id }">${arcType.typeName }</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>帖子属性：</td>
                <td>
                    <input type="checkbox" id="isSlide" name="isSlide" onclick="checkChange()"
                           value="1"/>幻灯帖子
                    <input type="checkbox" id="isRecommend" name="isRecommend" value="1"/>推荐帖子
                </td>
            </tr>
            <tr id="hdtp" style="display: none;">
                <td>幻灯图片：</td>
                <td>
                    <input type="file" id="slideImageFile" name="slideImageFile"/>
                </td>
            </tr>
            <tr>
                <td valign="top">帖子摘要：</td>
                <td>
                    <textarea rows="3" cols="40" id="summary" name="summary"
                              class="easyui-validatebox" required="true"></textarea>
                </td>
            </tr>
            <tr>
                <td valign="top">帖子内容：</td>
                <td>
                    <script id="editor" type="text/plain" style="width:1000px;height:500px;"></script>
                    <input type="hidden" id="content" name="content"/>
                </td>
            </tr>
            <tr>
                <td>关键字：</td>
                <td>
                    <input type="text" id="keyWords" name="keyWords" style="width: 300px"/>&nbsp;(多个关键字中间用空格隔开)
                </td>
            </tr>
            <tr>
                <td>标题颜色：</td>
                <td>
                    <input type="text" id="titleColor" name="titleColor"/>
                    <input id="bn" type="button" value="颜色"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="hidden" id="id" name="id" value="${param.id }"/>
                    <a href="javascript:submitData()" class="easyui-linkbutton"
                       data-options="iconCls:'icon-submit'">更新帖子</a>
                </td>
            </tr>
        </table>
    </form>
</div>

<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');

    ue.addListener("ready", function () {
        UE.ajax.request("${pageContext.request.contextPath}/admin/article/findById.do", {
                method: "post",
                async: false,
                data: {"id": "${param.id }"},
                onsuccess: function (result) {
                    result = eval("(" + result.responseText + ")");
                    $("#title").val(result.title);
                    $("#arcTypeId").combobox("setValue", result.arcType.id);
                    if (result.isSlide == 1) {
                        $("#isSlide").prop("checked", true);
                        $("#hdtp").show();
                    }
                    if (result.isRecommend == 1) {
                        $("#isRecommend").prop("checked", true);
                    }
                    $("#summary").val(result.summary);
                    $("#keyWords").val(result.keyWords);
                    $("#titleColor").val(result.titleColor);
                    UE.getEditor('editor').setContent(result.content);
                }
            }
        );
    });

    // 实例化colorPicker
    $("#bn").bigColorpicker("titleColor");
</script>
</body>
</html>