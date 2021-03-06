<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
    <title></title>
    <meta http-equiv=Content-Type content="text/html">
    <style>
        .warn {
            background-color: #ffff99;
        }

        .alert {
            background-color: orange;
        }
    </style>
</head>

<body>

<%
    Map<String, Long[]> queueLimits = new HashMap<String, Long[]>();
   

 
    queueLimits.put("customerCareQueue", new Long[]{3000L, 15000L});
    queueLimits.put("customerCareDLQ", new Long[]{0L, 6000L});
    queueLimits.put("customerCareEXP", new Long[]{0L, 6000L});
   
    queueLimits.put("creditQueue", new Long[]{300L, 500L});
    queueLimits.put("creditEXP", new Long[]{0L, 100L});
    queueLimits.put("creditDLQ", new Long[]{0L, 100L});

    queueLimits.put("mtsEXP", new Long[]{0L, 100L});
    queueLimits.put("mtsDLQ", new Long[]{0L, 100L});
    queueLimits.put("mtsQueue", new Long[]{3500L, 5000L});

    queueLimits.put("mosQueue", new Long[]{1000L, 15000L});
    queueLimits.put("mosEXP", new Long[]{0L, 100L});
    queueLimits.put("mosDLQ", new Long[]{0L, 100L});


    queueLimits.put("eventsQueue", new Long[]{3000L, 15000L});
    queueLimits.put("eventsDLQ", new Long[]{0L, 100L});
    queueLimits.put("eventsEXP", new Long[]{0L, 100L});

    queueLimits.put("tknRedeemReqQueueEXP", new Long[]{0L, 100L});
    queueLimits.put("tknRedeemReqQueueDLQ", new Long[]{0L, 5L});
    queueLimits.put("tknRedeemReqQueue", new Long[]{1000L, 2000L});

    queueLimits.put("moPreprocessQueueEXP", new Long[]{0L, 10L});
    queueLimits.put("moPreprocessQueueDLQ", new Long[]{0L, 10L});
    queueLimits.put("moPreprocessQueue", new Long[]{1000L, 1500L});

    queueLimits.put("asyncBillingQueueEXP", new Long[]{0L, 10L});
    queueLimits.put("asyncBillingQueueDLQ", new Long[]{0L, 10L});
    queueLimits.put("asyncBillingQueue", new Long[]{1000L, 1500L});

    queueLimits.put("onLimitMoSmsQueueEXP", new Long[]{0L, 10L});
    queueLimits.put("onLimitMoSmsQueueDLQ", new Long[]{0L, 10L});
    queueLimits.put("onLimitMoSmsQueue", new Long[]{1000L, 1500L});


    queueLimits.put("externalChargingQueueEXP", new Long[]{0L, 10L});
    queueLimits.put("externalChargingQueueDLQ", new Long[]{0L, 10L});
    queueLimits.put("externalChargingQueue", new Long[]{1000L, 1500L});

    queueLimits.put("chargingQueueEXP", new Long[]{0L, 10L});
    queueLimits.put("chargingQueueDLQ", new Long[]{0L, 10L});
    queueLimits.put("chargingQueue", new Long[]{1000L, 1500L});



    queueLimits.put("billingOptoutQueueEXP", new Long[]{0L, 10L});
    queueLimits.put("billingOptoutQueueDLQ", new Long[]{0L, 10L});
    queueLimits.put("billingOptoutQueue", new Long[]{1000L, 1500L});



    pageContext.setAttribute("queueLimits", queueLimits);
%>

<h3>Queue Metrics  -  PROMO_FOUR  USER - CLARO</h3>
<table id="tdata" border="1">
    <tr>
        <th>Queue</th>
        <th>MessageCount</th>
        <th>MessagesAdded</th>
        <th>DeliveringCount</th>
        <th>ConsumerCount</th>
    </tr>
    <c:forEach varStatus="status" items="${list}" var="q" >
        <c:choose>
            <c:when test="${q.messageCount le queueLimits[q.qName][0]}">
                <c:set var="level" value="normal"/>
            </c:when>
            <c:when test="${q.messageCount gt queueLimits[q.qName][0] and q.messageCount lt queueLimits[q.qName][1]}">
                <c:set var="level" value="warn"/>
            </c:when>
            <c:when test="${q.messageCount ge queueLimits[q.qName][1]}">
                <c:set var="level" value="alert"/>
            </c:when>
        </c:choose>
        <tr>
            <td class="Queue">${q.qName}</td>
            <td class="MessageCount ${level}">${q.messageCount}</td>
            <td class="MessagesAdded">${q.messagesAdded}</td>
            <td class="DeliveringCount">${q.deliveringCount}</td>
            <td class="ConsumerCount">${q.consumerCount}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
