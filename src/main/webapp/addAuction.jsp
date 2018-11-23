<%--
  Created by IntelliJ IDEA.
  User: 妹控
  Date: 18/10/21
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(function () {
            $("input").blur(function () {
                if ($(this).val().length == 0) {
                    $(this).next().css("display", "block");
                } else {
                    $(this).next().css("display", "none");
                }
            });
            $("textarea").blur(function () {
                if ($(this).html().length == 0) {
                    $(this).next().css("display", "block");
                } else {
                    $(this).next().css("display", "none");
                }
            })
        });


        function sub() {
            $("input").each(function (i, n) {
                if ($(n).val().length == 0) {
                    $(n).next().css("display", "block");
                } else {
                    $(n).next().css("display", "none");
                }
            });


            if (!$(":file").val()) {
                $(":file").next().html("未选中图片");
                return false;
            } else if ($("input:eq(0)").val().length == 0
                || $("input:eq(1)").val().length == 0
                || $("input:eq(2)").val().length == 0
                || $("input:eq(3)").val().length == 0
                || $("input:eq(4)").val().length == 0) {
                return false;
            } else {
                return true;
            }
        }

        $(function () {
            // 文件上传(文件域)的改变事件
            $(':file').change(function (event) {
                //  HTML5 js 对象的获取
                var files = event.target.files, file;
                if (files && files.length > 0) {
                    // 获取目前上传的文件
                    file = files[0];
                    // 文件的限定类型什么的道理是一样的
                    if (file.size > 1024 * 1024 * 4) {
                        alert('图片大小不能超过 2MB!');
                        return false;
                    }
                    // file对象生成可用的图片
                    var URL = window.URL || window.webkitURL;
                    // 通过 file 生成目标 url
                    var imgURL = URL.createObjectURL(file);
                    // 用这个 URL 产生一个 <img> 将其显示出来
                    $("img").prop('src', imgURL);
                }
            });
        });
    </script>
</head>

<body>
<div class="wrap">
    <!-- main begin-->
    <div class="sale">
        <h1 class="lf">在线拍卖系统</h1>
        <div class="logout right"><a href="${pageContext.request.contextPath}/logout" title="注销">注销</a></div>
    </div>
    <div class="login logns produce">
        <h1 class="blues">拍卖品信息</h1>
        <form action="${pageContext.request.contextPath}/private/addAuction" method="post"
              enctype="multipart/form-data" onsubmit="return sub()">
            <dl>
                <dd>
                    <label>名称：</label>
                    <input type="text" class="inputh lf" value="" name="auctionName"/>
                    <div class="lf red laba" style="display: none">不能为空</div>
                </dd>
                <dd>
                    <label>起拍价：</label>
                    <input type="number" class="inputh lf" value="" name="auctionStartPrice"/>
                    <div class="lf red laba" style="display: none">不能为空</div>
                </dd>
                <dd>
                    <label>底价：</label>
                    <input type="number" class="inputh lf" value="" name="auctionUpset"/>
                    <div class="lf red laba" style="display: none">不能为空</div>
                </dd>
                <dd>
                    <label>开始时间：</label>
                    <input type="date" class="inputh lf" value="" name="auctionStartTime"
                    />
                    <div class="lf red laba" style="display: none">不能为空</div>
                </dd>
                <dd>
                    <label>结束时间：</label>
                    <input type="date" class="inputh lf" value="" name="auctionEndTime"
                    />
                    <div class="lf red laba" style="display: none">不能为空</div>
                </dd>
                <dd class="dds">
                    <label>拍卖品图片：</label>
                    <div class="lf salebd"><a href="#"><img src="" height="100"/></a></div>
                    <input name="pic" type="file"/>
                    <div class="lf red laba"></div>
                </dd>
                <dd class="dds">
                    <label>描述：</label>
                    <textarea cols="" rows="" class="textarea" name="auctionDesc"></textarea>
                    <div class="lf red laba" style="margin-left: 200px;display: none">不能为空</div>
                </dd>
                <dd class="hegas">
                    <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs f14 lf"/>
                    <a></a>
                    <a href="${pageContext.request.contextPath}/private/selectAll"><input name="" type="button"
                                                                                             value="取 消"
                                                                                             class="spbg buttombg buttombgs buttomb f14 lf"/></a>
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
