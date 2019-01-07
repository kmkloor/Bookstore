
<%@ tag body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ attribute name="input" required="true" type="java.lang.String" description="currency to format" %>

        <c:set var="area" value =  "${fn:substring(input, 0, 3)}"/>
        <c:set var="three" value="${fn:substring(input, 3, 6)}" />
        <c:set var="four" value="${fn:substring(input, 6, input.length())}" />
        (${area})${three}-${four}

