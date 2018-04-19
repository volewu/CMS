<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="login-content" data-ng-app="materialAdmin">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>管理员登录界面</title>
    <!-- Vendor CSS -->
    <link href="${pageContext.request.contextPath}/static/login/css/material-design-iconic-font/css/material-design-iconic-font.min.css"
          rel="stylesheet" type="text/css">
    <!-- CSS -->
    <link href="${pageContext.request.contextPath}/static/login/css/app.min.1.css" rel="stylesheet"
          type="text/css">
    <script type="text/javascript">

        function submitData() {
            var userName = $("#userName").val();
            var password = $("#password").val();
            if (userName == "") {
                alert("请输入用户名！");
                return;
            }
            if (password == "") {
                alert("请输入密码！");
                return;
            }
            $.post("${pageContext.request.contextPath}/manager2/login.do", {
                userName: userName,
                password: password
            },function (result) {
                if(result.success){
                    window.location.href='${pageContext.request.contextPath}/admin/main.jsp'
                }else{
                    alert(result.errorInfo)
                }
            },"json");
        }


    </script>
</head>
<body class="login-content" data-ng-controller="loginCtrl as lctrl">

<div class="lc-block" id="l-login" data-ng-class="{'toggled':lctrl.login === 1}">
    <h1 class="lean">Login</h1>

    <div class="input-group m-b-20">
	    		<span class="input-group-addon">
	    			<i class="zmdi zmdi-account"></i>
	    		</span>
        <div class="fg-line">
            <input type="text" id="userName" name="userName" class="form-control"
                   placeholder="userName" regex="^\w{3,16}$"/>
        </div>
    </div>

    <div class="input-group m-b-20">
	    		<span class="input-group-addon">
	    			<i class="zmdi zmdi-male"></i>
	    		</span>
        <div class="fg-line">
            <input type="password" id="password" name="password" class="form-control"
                   placeholder="password" regex="^\w+"/>
        </div>
    </div>

    <div class="clearfix"></div>

    <div>
        vole 所有 2018-20??
    </div>


    <a href="javascript:submitData()" class="btn btn-login btn-danger btn-float">
        <i class="zmdi zmdi-arrow-forward"></i>
    </a>

</div>


</body>

<script src="${pageContext.request.contextPath}/static/login/js/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/login/js/log.js"></script>
<!-- Angular -->
<script src="${pageContext.request.contextPath}/static/login/js/bower_components/angular/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/static/login/js/bower_components/angular-resource/angular-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/static/login/js/bower_components/angular-animate/angular-animate.min.js"></script>


<!-- Angular Modules -->
<script src="${pageContext.request.contextPath}/static/login/js/bower_components/angular-ui-router/release/angular-ui-router.min.js"></script>
<script src="${pageContext.request.contextPath}/static/login/js/bower_components/angular-loading-bar/src/loading-bar.js"></script>
<script src="${pageContext.request.contextPath}/static/login/js/bower_components/oclazyload/dist/ocLazyLoad.min.js"></script>
<script src="${pageContext.request.contextPath}/static/login/js/bower_components/angular-bootstrap/ui-bootstrap-tpls.min.js"></script>

<!-- Common js -->
<script src="${pageContext.request.contextPath}/static/login/js/bower_components/angular-nouislider/src/nouislider.min.js"></script>
<script src="${pageContext.request.contextPath}/static/login/js/bower_components/ng-table/dist/ng-table.min.js"></script>


<script src="${pageContext.request.contextPath}/static/login/js/app.js"></script>
<script src="${pageContext.request.contextPath}/static/login/js/controllers/main.js"></script>
<script src="${pageContext.request.contextPath}/static/login/js/controllers/ui-bootstrap.js"></script>


<!-- Template Modules -->
<script src="${pageContext.request.contextPath}/static/login/js/modules/form.js"></script>
</html>