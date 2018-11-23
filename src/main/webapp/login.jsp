<%--
  Created by IntelliJ IDEA.
  User: 妹控
  Date: 18/10/19
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <script>
        $(function () {
            $(".code").click(function () {
                $("#imgVcode").prop("src",
                    "${pageContext.request.contextPath }/code?time=" + new Date().getTime());
            })
        })
    </script>

</head>
<body>
<div class="wrap">
    <!-- main begin-->
    <div class="main">
        <div class="sidebar">
            <p><img src="images/img1.jpg" width="443" height="314" alt=""/></p>
        </div>
        <div class="sidebarg">
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="login">
                    <dl>
                        <dt class="blues">用户登陆</dt>
                        <dd><label for="name">用户名：</label><input type="text" class="inputh" value="123" id="name"
                                                                 name="userName"/>
                        </dd>
                        <dd><label for="password">密 码：</label><input type="text" class="inputh" value="123" name="userPassword"
                                                                     id="password"/></dd>
                        <dd>
                            <label class="lf" for="passwords">验证码：</label>
                            <input type="text" class="inputh inputs lf" value="" id="passwords" name="code"/>
                            <span class="wordp lf"><img src="${pageContext.request.contextPath}/code" height="27" alt=""
                                                        id='imgVcode'/></span>
                            <span class="blues lf"><a href="javascript:void(0)" title="" class="code">看不清</a></span>
                        </dd>
                        <dd>
                            <input name="" type="checkbox" id="rem_u"/>
                            <span for="rem_u">下次自动登录</span>
                        </dd>
                        <dd class="buttom">
                            <input name="" type="submit" value="登 录" class="spbg buttombg f14 lf"/>
                            <a href="register.jsp" class="spbg buttombg f14 lf">注册</a>
                            <span class="blues  lf"><a href="javascript:void(0)" title="">忘记密码?</a></span>
                            <div class="cl"></div>
                        </dd>

                    </dl>
                </div>
            </form>
        </div>
        <div class="cl"></div>
    </div>
    <!-- main end-->

    <!-- footer begin-->
</div>
<!--footer end-->

</div>
</body>
</html>
