<%@ tag body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ attribute name="input" required="true" type="java.lang.String" description="category to format" %>
<c:set var="categoryEnd" value="${fn:substring(input, input.length() - 1, input.length())}" />
<c:choose>

    <c:when test="${fn:contains(categoryEnd, 'y')}">
        <c:set var="category" value="${fn:substring(input, 0, input.length() - 1)}" />
        ${category}ies
    </c:when>
    <c:otherwise>
        ${input} Books
    </c:otherwise>
</c:choose>
