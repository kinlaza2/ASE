<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
    <title></title>
    <meta http-equiv=Content-Type content="text/html">
    <script src="scripts/jquery-1.5.1.min.js"></script>
    <script src="scripts/lib/json2.js"></script>
    <script src="scripts/lib/jolokia.js"></script>
    <script src="scripts/lib/jolokia-simple.js"></script>
    <script src="scripts/utils.js"></script>
</head>

<body>
<h3>Queue Metrics</h3>
<table id="tdata" border="1">
    <tr>
        <th>Queue</th>
        <th>MessageCount</th>
        <th>MessagesAdded</th>
        <th>DeliveringCount</th>
        <th>ConsumerCount</th>
    </tr>
    <tr id="row-template" style="display:none;">
        <td class="Queue">-</td>
        <td class="MessageCount">-</td>
        <td class="MessagesAdded">-</td>
        <td class="DeliveringCount">-</td>
        <td class="ConsumerCount">-</td>
    </tr>
</table>
</body>

<script type="text/javascript">
//    var url="service:jmx:rmi:///jndi/rmi://10.1.1.60:3900/jmxrmi";
    var url='${jmxurl}';
    var username='${username}';
    var password='${password}';
    displayQueuesInformation(url,username,password);
</script>
</html>