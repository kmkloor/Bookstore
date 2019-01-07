
<%@ tag body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ attribute name="input" required="true" type="java.lang.String" description="currency to format" %>

<c:choose>
    <c:when test="${fn:contains(input, '.') && ((fn:indexOf(input, '.')) > 5)}">
        <c:set var = "endStreet" value =  "${(fn:indexOf(input, '.')) + 1}"/>
        <c:set var="street" value="${fn:substring(input, 0, endStreet)}" />
        <c:set var="city" value="${fn:substring(input, endStreet, (fn:length(input)))}" />
        ${street}
        <br>
        ${city}
    </c:when>
    <c:when test="${fn:contains(input, ',') && ((fn:indexOf(input, ',')) > 5)}">
        <c:set var = "endStreet" value =  "${(fn:indexOf(input, ',')) + 1}"/>
        <c:set var="street" value="${fn:substring(input, 0, endStreet)}" />
        <c:set var="city" value="${fn:substring(input, endStreet, (fn:length(input)))}" />
        ${street}
        <br>
        ${city}
    </c:when>
    <c:otherwise>
        ${input}
    </c:otherwise>
</c:choose>

