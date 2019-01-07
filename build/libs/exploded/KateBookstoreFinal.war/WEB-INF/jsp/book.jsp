<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html>
<head>
    <title>Bookstore Category Page</title>
    <meta charset="utf-8">
    <meta name="description" content="The category page for a bookstore">

    <!--
        normalize-and-reset.css.css is a basic CSS reset; useful for starting from ground zero.
        always include this first.
    -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/normalize-and-reset.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/footer.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/book.css"/>">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans|PT+Sans+Narrow" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,400i,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

</head>

<body>
<main>
    <jsp:include page="header.jsp"/>
    <jsp:useBean id="p" scope="request" type="viewmodel.BookViewModel"/>
    <section>
        <div class="content">
        <c:choose>
            <c:when test="${p.matchesExist()}">
                    <div class="content-container categorypad">
                        <c:forEach var="category" items="${p.selectedCategories}">
                            <c:forEach var="book" items="${p.selectedBooks}">
                               <c:if test="${book.categoryId == category.categoryId}">
                                    <div class="bookbox whitebg">
                                        <fmt:setBundle basename="bookdata" var="lang"/>
                                        <fmt:setLocale value="en_US"/>
                                        <div class="titlebox" >
                                            <h1><c:out value="${book.title}"/><fmt:message key="${book.bookId}.sub" bundle="${lang}"/></h1>
                                        </div>
                                        <div class="highlight yellowbg"></div>
                                        <div class="lesspadded bookblurb">
                                            <img src="${p.bookImagePath}${book.bookId}.jpg"/>
                                            <p> <fmt:message key="${book.bookId}.blurb" bundle="${lang}"/></p>
                                            <div class="bookinfo">
                                                <div class="bookauthor">
                                                    <c:out value="${book.author}"/><br>
                                                    <fmt:message key="${book.bookId}.publisher" bundle="${lang}"/><br>
                                                    <fmt:message key="${book.bookId}.publication_date" bundle="${lang}"/><br>
                                                    <my:money input="${book.price}"/>
                                                </div>
                                                <div class="widthmax floatright"></div>
                                                <button class="addToCartButton btn btnleft"
                                                        data-book-id="${book.bookId}"
                                                        data-action="add">
                                                    Add to Cart
                                                </button>
                                                <c:if test="${book.isPublic}">
                                                    <a class="btn" href="">Read Now</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <div class="content widthmax">
                                <div class="centeredhorizontally">
                                    <a class="btn start" href="category?category=<c:out value="${category.name}"/>">More <my:category input="${category.name}"/></a>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
            </c:when>
        <c:otherwise>
            <div class="content-container categorypad">
                <div class="content widthmax">
                    <div class="shortpages">
                        <h2> No matches found.</h2><br>
                        <a class="btn start" href="category">View All Books</a>
                    </div>
                </div>
            </div>
        </c:otherwise>
        </c:choose>
        </div>
    </section>
    <jsp:include page="footer.jsp"/>
</main>
<script src="<c:url value="/js/ajax-functions.js"/>" type="text/javascript"></script>
<script>
    var addToCartButtons = document.getElementsByClassName("addToCartButton");
    for (var i = 0; i < addToCartButtons.length; i++) {
        addToCartButtons[i].addEventListener("click", function(event) {
            addToCartEvent(event.target) });
    }

    function addToCartEvent(button) {
        var data = {"bookId":button.dataset.bookId,
            "action":button.dataset.action
        };
        ajaxPost('category', data, function(text, xhr) {
            addToCartCallback(text, xhr)
        });
    }

    function addToCartCallback(responseText, xhr) {
        var cartCount = JSON.parse(responseText).cartCount;
        document.getElementById('cartCount').textContent = '' + cartCount;
    }
</script>
</body>
</html>
