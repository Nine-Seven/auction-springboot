<%--
  Created by IntelliJ IDEA.
  User: 妹控
  Date: 18/10/19
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>

<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>

<body>
<div class="wrap">
    <!-- main begin-->
    <div class="sale">
        <h1 class="lf">在线拍卖系统</h1>
        <div class="logout right"><a href="${pageContext.request.contextPath}/logout" title="注销">注销</a></div>
    </div>
    <div class="forms">
        <form action="${pageContext.request.contextPath}/private/selectAll" method="post">
            <label for="name">名称</label>
            <input name="auctionName" type="text" class="nwinput" id="name"
                   value="${auction.auctionName}"/>
            <label for="names">描述</label>
            <input name="auctionDesc" type="text" id="names" class="nwinput"
                   value="${auction.auctionDesc}"/>
            <label for="time">开始时间</label>
            <input name="auctionStartTime" type="text" id="time" class="nwinput"
                   value="<fmt:formatDate value="${auction.auctionStartTime}" pattern="yyyy-MM-dd hh:mm:ss"/>"/>
            <label for="end-time">结束时间</label>
            <input name="auctionEndTime" type="text" id="end-time" class="nwinput"
                   value="<fmt:formatDate value="${auction.auctionEndTime}" pattern="yyyy-MM-dd hh:mm:ss"/>"/>
            <label for="price">起拍价</label>
            <input name="auctionUpset" type="text" id="price" class="nwinput"
                   value="${auction.auctionUpset}"/>
            <input name="" type="submit" value="查询" class="spbg buttombg f14  sale-buttom"/>
        </form>
        <c:if test="${sessionScope.login.userIsAdmin == 1}">
            <a href="${pageContext.request.contextPath}/addAuction.jsp"><input name="" type="button" value="发布"
                                                                               class="spbg buttombg f14  sale-buttom buttomb"/></a>
        </c:if>
    </div>
    <div class="items">
        <ul class="rows even strong">
            <li>名称</li>
            <li class="list-wd">描述</li>
            <li>开始时间</li>
            <li>结束时间</li>
            <li>起拍价</li>
            <li class="borderno">操作</li>
        </ul>
        <c:forEach var="auction" items="${auctionList}" varStatus="sta">
            <ul class="rows <c:if test="${(sta.index+1)%2==0}">even</c:if>">
                <li>
                    <a href="${pageContext.request.contextPath}/private/selectRecord?auctionId=${auction.auctionId}"
                       title="">${auction.auctionName} </a></li>
                <li class="list-wd">${auction.auctionDesc}</li>
                <li><fmt:formatDate value="${auction.auctionStartTime}" pattern="yyyy-MM-dd hh:mm:ss"/></li>
                <li><fmt:formatDate value="${auction.auctionEndTime}" pattern="yyyy-MM-dd hh:mm:ss"/></li>
                <li>${auction.auctionUpset}</li>
                <li class="borderno red">
                    <c:if test="${sessionScope.login.userIsAdmin == 0}">
                        <a href="${pageContext.request.contextPath}/private/selectRecord?auctionId=${auction.auctionId}">竞拍</a>
                    </c:if>
                    <c:if test="${sessionScope.login.userIsAdmin == 1}">
                        <a href="${pageContext.request.contextPath}/private/selectOneAuction?auctionId=${auction.auctionId}"
                           title="修改" onclick="return update();">修改</a>|
                        <a href="${pageContext.request.contextPath}/private/delete?auctionId=${auction.auctionId}"
                           title="删除" onclick="return dele();">删除</a>
                    </c:if>
                </li>
            </ul>
        </c:forEach>

        <div class="page">
            <a href="${pageContext.request.contextPath}/private/selectAll?currentPage=1" title="">首页</a>
            <a href="${pageContext.request.contextPath}/private/selectAll?currentPage=${requestScope.currentPage-1}" title="">上一页</a>
            <a href="${pageContext.request.contextPath}/private/selectAll?currentPage=${requestScope.currentPage+1}" title="">下一页</a>
            <a href="${pageContext.request.contextPath}/private/selectAll?currentPage=${requestScope.totalPage}" title="">尾页</a>
        </div>
    </div>
    <script>
        function dele() {

            if (confirm("你真的确认要删除吗？请确认")) {
                // window.location.href = "/auction/private/auction_delete?auction.auctionId="+id;
                return true;
            }
            else {
                return false;
            }

        };

        function update() {
            if (confirm("你真的确认要修改吗？请确认")) {
                // window.location.href = "/auction/private/auction_selectOne?auction.auctionId=" + id;
                return true;
            }
            else {
                return false;
            }
        }
    </script>
    <!-- main end-->
</div>
</body>
</html>
