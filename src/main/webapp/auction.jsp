<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 妹控
  Date: 18/10/21
  Time: 10:19
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
            if ($(".price").first().html() != null) {
                $("#sale").val(parseFloat($(".price").first().html()) + 10);
            }
        });

        function sub() {
            if ($(".price").first().html() == null) {
                return true;
            }
            if (parseFloat($("#sale").val()) >= (parseFloat($(".price").first().html()) + 1)) {
                $("#dis").css("display", "none");
                return true;
            } else {
                $("#dis").css("display", "block");
                return false;
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
    <div class="items sg-font lf">
        <ul class="rows">
            <li>名称：</li>
            <li class="borderno">${auction.auctionName}</li>
        </ul>
        <ul class="rows">
            <li>描述：</li>
            <li class="borderno">${auction.auctionDesc}</li>
        </ul>
        <ul class="rows">
            <li>开始时间：</li>
            <li class="borderno"><fmt:formatDate value="${auction.auctionStartTime}"
                                                 pattern="yyyy-MM-dd hh:mm:ss"/></li>
        </ul>
        <ul class="rows">
            <li>结束时间：</li>
            <li class="borderno"><fmt:formatDate value="${auction.auctionEndTime}"
                                                 pattern="yyyy-MM-dd hh:mm:ss"/></li>
        </ul>
        <ul class="rows border-no">
            <li>起拍价：</li>
            <li class="borderno">${auction.auctionStartPrice}</li>
        </ul>
    </div>
    <div class="rg borders"><img
            src="${pageContext.request.contextPath}/images/${auction.auctionPic}" height="185"
            alt=""/></div>
    <div class="cl"></div>
    <div class="top10 salebd">
        <form action="${pageContext.request.contextPath}/private/addRecord" method="post">
            <p>
                <label for="sale">出价：</label>
                <input type="text" class="inputwd" id="sale" value="${auction.auctionStartPrice}"
                       name="auctionPrice"/>
                <input type="hidden" value="${auction.auctionId}" name="auctionId"/>
                <input type="submit" value="竞 拍" class="spbg buttombg f14  sale-buttom" onclick="return sub()"/>
            </p>
        </form>
        <p class="f14 red" style="display: none" id="dis">不能低于最高竞拍价</p>
    </div>
    <div class="top10">
        <a href="${pageContext.request.contextPath}/private/selectRecord?auctionId=${auction.auctionId}">
            <input name="" type="submit" value="刷 新" class="spbg buttombg f14"/>
        </a>
        <a href="${pageContext.request.contextPath}/private/selectAll">
            <input name="" type="submit" value="返回列表" class="spbg buttombg f14"/>
        </a>
    </div>
    <div class="offer">
        <h3>出价记录</h3>
        <div class="items sg-font">
            <ul class="rows even strong">
                <li>竞拍时间</li>
                <li>竞拍价格</li>
                <li class="borderno">竞拍人</li>
            </ul>
            <c:forEach var="record" items="${recordList}" varStatus="sta">
                <ul class="rows <c:if test="${(sta.index+1)%2==0}">even</c:if>">
                    <li><fmt:formatDate value="${record.auctionTime}" pattern="yyyy-MM-dd hh:mm:ss"/></li>
                    <li class="price">${record.auctionPrice}</li>
                    <li class="borderno">${record.user.userName}</li>
                </ul>
            </c:forEach>
        </div>
    </div>
    <!-- main end-->
</div>
</body>
</html>
