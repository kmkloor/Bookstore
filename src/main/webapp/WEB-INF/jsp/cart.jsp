
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!doctype html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/normalize-and-reset.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/footer.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/cart.css"/>">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans|PT+Sans+Narrow" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,400i,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

</head>
<body>
<main>
    <jsp:include page="header.jsp"/>
    <jsp:useBean id="p" scope="request" type="viewmodel.CartViewModel"/>
    <section>
        <div class="content bluebg">
        <c:choose>
        <c:when test="${p.cart.numberOfItems > 0}">
            <div class="content-container">
                <div class="content-container categorypad">
                    <div class="centeredvertically padded cartbox">
                        <div class="content-container cartcontainer">
                            <table id="cart">
                                <tr >
                                    <th> <h2><strong>Book</strong></h2></th>
                                    <th></th>
                                    <th class="paddedtopbottom"><h2><strong>Quantity</strong></h2></th>
                                    <th><h2><strong>Price</strong></h2></th>
                                </tr>

                                <c:forEach var="book" items="${p.cart.items}" >

                                    <tr class="whitebg border" >
                                        <td> <img src="${p.bookImagePath}${book.bookId}.jpg" class="lesspadded"/></td>
                                        <td><h2><c:out value="${book.book.title}"/></h2>
                                            <p><c:out value="${book.book.author}"/></p></td>
                                        <td><p><div id="test" class="bookCount"><c:out value="${book.quantity}"/></div></p>

                                            <div class="content-container buttons">
                                                <form action="cart" method="post">
                                                    <input type="hidden" name="bookId" value="${book.bookId}"/>
                                                    <input type="hidden" name="action" value="increment"/>
                                                    <button class="addToCartButton roundbtn btnleft " type="submit" name="submit"><i class="fas fa-plus"></i></button>
                                                </form>
                                                <form action="cart" method="post">
                                                    <input type="hidden" name="bookId" value="${book.bookId}"/>
                                                    <input type="hidden" name="action" value="decrement"/>
                                                    <button class="addToCartButton roundbtn " type="submit" name="submit"><i class="fas fa-minus"></i></button>
                                                </form>
                                            </div>

                                        </td>

                                        <td><p><my:money input="${book.total}"/></p></td>
                                    </tr>
                                    <tr class="between">
                                        <td colspan="4" class="break"></td>
                                    </tr>


                                </c:forEach>

                                <tr>
                                    <td class="bottom alignright" colspan="3"> <a class="btn" href="checkout">Check Out</a> <a class="btn btnleft" href="category">Continue Shopping</a></td>
                                    <td class="bottom"><h2>Total: <my:money input="${p.cart.subtotal}"/></h2></td>
                                </tr>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </c:when>
            <c:otherwise>
                <div class="content-container categorypad">
                    <div class="content widthmax">
                        <div class="shortpages">
                            <h2> Your cart is empty.</h2><br>
                            <a class="btn start" href="category">Start Shopping</a>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        </div>
    </section>
    <jsp:include page="footer.jsp"/>
</main>
</body>
</html>
