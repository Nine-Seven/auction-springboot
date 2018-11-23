<%--
  Created by IntelliJ IDEA.
  User: 妹控
  Date: 18/10/24
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/get.do">
    <input type="datetime-local" name="date">
    <input type="submit" value="提交">
</form>
</body>
</html>
