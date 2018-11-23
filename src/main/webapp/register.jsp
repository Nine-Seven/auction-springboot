<%--
  Created by IntelliJ IDEA.
  User: 妹控
  Date: 18/10/19
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/common.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".code").click(function () {
                $("#imgVcode").prop("src",
                    "${pageContext.request.contextPath }/code?time=" + new Date().getTime());
            })

            $(":text").blur(function () {
                if ($(this).val().length <= 6) {
                    $(this).next().css("display", "block");
                } else {
                    $(this).next().css("display", "none");
                }
            });
        });

        function sub() {
            if (!$("input[type='checkbox']").prop("checked")) {
                return false;
            }
            $("input").each(function (i, n) {
                if(i<=6){
                    if ($(n).val().length <= 6) {
                        $(n).next().css("display", "block");
                    } else {
                        $(n).next().css("display", "none");
                    }
                }
            });
            if ($(":text:eq(0)").val().length <= 6
                || $(":text:eq(1)").val().length <= 6
                || $(":text:eq(2)").val().length == 0
                || $(":text:eq(3)").val().length == 0
                || $(":text:eq(4)").val().length == 0
                || $(":text:eq(5)").val().length == 0
                || $(":text:eq(6)").val().length == 0) {
                return false;
            } else {
                return true;
            }
        }

    </script>
</head>

<body>
<div class="wrap">
    <!-- main begin-->
    <div class="zclf login logns">
        <h1 class="blue">用户注册</h1>
        <form action="${pageContext.request.contextPath}/register" method="post">
            <dl>
                <dd>
                    <label>
                        <small>*</small>
                        用户名</label>
                    <input type="text" class="inputh lf" value="" name="userName"/>
                    <div class="lf red laba" style="display: none">用户名要求不低于6个字符</div>
                </dd>
                <dd>
                    <label>
                        <small>*</small>
                        密码</label>
                    <input type="text" class="inputh lf" value="" name="userPassword"/>
                    <div class="lf red laba" style="display: none">密码要求不低于6个字符</div>
                </dd>
                <dd>
                    <label>
                        <small>*</small>
                        身份证号</label>
                    <input type="text" class="inputh lf" value="" name="userCardNo"/>
                    <div class="lf red laba" style="display: none">身份证号必填</div>
                </dd>
                <dd>
                    <label>
                        <small>*</small>
                        电话</label>
                    <input type="text" class="inputh lf" value="" name="userTel"/>
                    <div class="lf red laba" style="display: none">电话号码必填</div>
                </dd>
                <dd>
                    <label>
                        <small>*</small>
                        住址</label>
                    <input type="text" class="inputh lf" value="" name="userAddress"/>
                </dd>
                <dd>
                    <label>
                        <small>*</small>
                        邮政编码</label>
                    <input type="text" class="inputh lf" value="" name="userPostNumber"/>
                </dd>
                <dd class="hegas">
                    <label>
                        <small>*</small>
                        验证码</label>
                    <input type="text" class="inputh inputs lf" value="" name="code"/>
                    <a></a>
                    <span class="wordp lf"><img src="${pageContext.request.contextPath}/code" id='imgVcode'
                                                height="27" alt=""/></span>
                    <span class="blues lf"><a href="javascript:void(0)" title="" class="code">看不清</a></span>
                </dd>
                <dd class="hegas">
                    <label>&nbsp;</label>
                    <input name="" type="checkbox" id="rem_u" value="123"/>
                    <a></a>
                    <a></a>
                    <label for="rem_u" class="labels">我同意<span class="blues">《服务条款》</span></label>
                </dd>
                <dd class="hegas">
                    <label>&nbsp;</label>
                    <input type="submit" value="立即注册" class="spbg buttombg buttombgs f14 lf" onclick="return sub()"/>
                </dd>
            </dl>
        </form>
    </div>
    <!-- main end-->
    <!-- footer begin-->

</div>
<!--footer end-->

</div>
</body>
</html>
