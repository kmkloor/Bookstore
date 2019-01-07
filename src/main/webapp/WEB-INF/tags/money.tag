
<%@ tag body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ attribute name="input" required="true" type="java.lang.String" description="currency to format" %>

<c:choose>
<c:when test="${fn:length(input)> 2}">
    <c:set var="before" value="${fn:substring(input, 0, (fn:length(input)-2))}" />
    <c:set var="after" value="${fn:substring(input, (fn:length(input)-2), fn:length(input))}" />
</c:when>
</c:choose>
<c:choose>
    <c:when test="${fn:length(input)< 3}">
        <c:set var="before" value="${input}" />
        <c:set var="after" value="00" />
    </c:when>
</c:choose>


$${before}.${after}