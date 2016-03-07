<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
    <title></title>
    <meta http-equiv=Content-Type content="text/html">
</head>

<body>
<h3>Queue Metrics</h3>
<table id="tdata" border="1">
    <tr>
        <th>Name</th>
        <th>AvailableConnectionCount</th>
        <th>ConnectionCount</th>
        <th>ConnectionCreatedCount</th>
        <th>ConnectionDestroyedCount</th>
        <th>InUseConnectionCount</th>
        <th>MaxConnectionsInUseCount</th>
    </tr>
    <c:forEach varStatus="status" items="${list}" var="q" >
        <tr>
            <td class="Name">${q.name}</td>
            <td class="AvailableConnectionCount">${q.availableConnectionCount}</td>
            <td class="ConnectionCount">${q.connectionCount}</td>
            <td class="ConnectionCreatedCount">${q.connectionCreatedCount}</td>
            <td class="ConnectionDestroyedCount">${q.connectionDestroyedCount}</td>
            <td class="InUseConnectionCount">${q.inUseConnectionCount}</td>
            <td class="MaxConnectionsInUseCount">${q.maxConnectionsInUseCount}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
