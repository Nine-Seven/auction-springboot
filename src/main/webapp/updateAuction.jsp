<%--
  Created by IntelliJ IDEA.
  User: 妹控
  Date: 18/10/21
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
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

            if ($("textarea").html().length == 0) {
                $("textarea").next().css("display", "block");
            } else {
                $("textarea").next().css("display", "none");
            }

            if ($("input:eq(0)").val().length == 0
                || $("input:eq(1)").val().length == 0
                || $("input:eq(2)").val().length == 0
                || $("input:eq(3)").val().length == 0
                || $("input:eq(4)").val().length == 0
                || $("textarea").html().length == 0) {
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
    <div class="sale">
        <h1 class="lf">在线拍卖系统</h1>
        <div class="logout right"><a href="${pageContext.request.contextPath}/logout" title="注销">注销</a></div>
    </div>
    <div class="login logns produce">
        <h1 class="blues">拍卖品信息</h1>
        <form action="${pageContext.request.contextPath}/private/update" method="post"
              enctype="multipart/form-data" onsubmit="return sub()">
            <dl>
                <dd>
                    <label>名称：</label>
                    <input type="text" class="inputh lf" value="${auction.auctionName}"
                           name="auctionName"/>
                    <input type="hidden" value="${auction.auctionId}" name="auctionId"/>
                    <div class="xzkbg spbg lf"></div>
                </dd>
                <dd>
                    <label>起拍价：</label>
                    <input type="number" class="inputh lf" value="${auction.auctionStartPrice}"
                           name="auctionStartPrice"/>
                    <div class="lf red laba" style="display: none">不能为空</div>
                </dd>
                <dd>
                    <label>底价：</label>
                    <input type="number" class="inputh lf" value="${auction.auctionUpset}"
                           name="auctionUpset"/>
                    <div class="lf red laba" style="display: none">不能为空</div>
                </dd>
                <dd>
                    <label>开始时间：</label>
                    <input type="text" class="inputh lf"
                           value="<fmt:formatDate value="${auction.auctionStartTime}" pattern="yyyy-MM-dd hh:mm:ss"/>"
                           name="auctionStartTime"/>
                    <div class="lf red laba" style="display: none">不能为空</div>
                </dd>
                <dd>
                    <label>结束时间：</label>
                    <input type="text" class="inputh lf"
                           value="<fmt:formatDate value="${auction.auctionEndTime}" pattern="yyyy-MM-dd hh:mm:ss"/>"
                           name="auctionEndTime"/>
                    <div class="lf red laba" style="display: none">不能为空</div>
                </dd>
                <dd class="dds">
                    <label>描述：</label>
                    <textarea cols="" rows="" class="textarea" name="auctionDesc">${auction.auctionDesc}</textarea>
                </dd>
                <dd>
                    <label>修改图片：</label>
                    <div class="lf salebd"><a href="#"><img
                            src="${pageContext.request.contextPath}/images/${auction.auctionPic}"
                            height="100"/></a></div>
                    <input name="pic" type="file" class="marg10" style="width: 170px"/>
                    <a></a>
                    <input type="hidden"
                           value="${auction.auctionPic}"
                           name="auctionPic"/>
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
