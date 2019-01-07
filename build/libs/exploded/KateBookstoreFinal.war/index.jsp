<%--
  Created by IntelliJ IDEA.
  User: kkloor
  Date: 6/26/2018
  Time: 12:45 PM
  To change this template use File | Settings | File Templates.
--%>

<%--This took forever to solve but my homepage ajax buttons could not access the secure cart page
    because jsp:forward was not loading the homepage servlet since it wasn't technically a doGet.
    I could have removed the "Add to Cart" homepage options but I hope this workaround is okay instead.
 --%>
<html>
<head>
</head>
<body>
<%
    response.sendRedirect(request.getRequestURL() + "homepage");
%>
</body>
</html>