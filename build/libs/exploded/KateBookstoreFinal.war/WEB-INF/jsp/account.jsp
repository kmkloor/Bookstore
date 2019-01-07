
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Account</title>


    <link rel="stylesheet" type="text/css" href="<c:url value="/css/normalize-and-reset.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/footer.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/account.css"/>">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans|PT+Sans+Narrow" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,400i,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

</head>
<body>

<jsp:include page="header.jsp"/>

<jsp:useBean id="p" scope="request" type="viewmodel.AccountViewModel"/>
<section>
    <div class ="content-container form shortpages">
        <div class="content-container nobottommargin notopmargin" >
            <h1>Account</h1>
        </div>
        <div class="content-container notopmargin">
            <div class="checkoutFormAndInfo checkout almostwhitebg">
                <div class="centertext">
                    <div id="checkoutFormBox">
                        <c:choose>
                            <c:when test="${(p.customer.size() > 0)}">
                                <div >
                                    <p> Welcome back, ${p.customer[0].customerName}!<br></p>
                                    <p>
                                        <my:address input="${p.customer[0].address}"/><br>
                                            ${p.customer[0].email}<br>
                                        <my:phone input="${p.customer[0].phone}"/><br>
                                        <strong>Credit Card:</strong> .... .... .... ${p.customer[0].ccNumber.substring(p.customer[0].ccNumber.length() - 4)} (${p.customer[0].ccExpDate.month}/${(p.customer[0].ccExpDate.year - 100)})
                                    </p>
                                </div>
                                <div id="logout">
                                    <form action="account" method="post">
                                        <input type="hidden" name="action" value="logout"/>
                                        <input type="submit" class="yellow" value="Log Out"/>
                                    </form>
                                </div>
                                <div>
                                    <div id="ordersummary">
                                <h1 class="bottom">Order Summary</h1>
                                    </div>
                                <c:forEach var="orderDetails" items="${p.accountOrders}">
                                    <p class="confirmation">Confirmation Number:
                                        <strong>${orderDetails.order.confirmationNumber}</strong>
                                        <br>
                                        <fmt:formatDate value="${orderDetails.order.dateCreated}"
                                                        type="both"
                                                        dateStyle="long"
                                                        timeStyle="short"/>

                                    </p>
                                    <div>

                                        <table class="widthmax bordertable">
                                            <tr>
                                                <td><strong>Book</strong></td>
                                                <td><strong>Quantity</strong></td>
                                                <td><strong>Price</strong></td>
                                            </tr>
                                            <tr><td colspan="3" style="break"><hr></td></tr>

                                            <c:forEach var="lineItem" items="${orderDetails.lineItems}" varStatus="iter">

                                                <tr>
                                                    <td>
                                                            ${orderDetails.books[iter.index].title}
                                                    </td>
                                                    <td>
                                                            ${lineItem.quantity}
                                                    </td>
                                                    <td>
                                                        <my:money input="${(orderDetails.books[iter.index].price * lineItem.quantity)}"/>
                                                    </td>
                                                </tr>

                                            </c:forEach>

                                            <tr><td colspan="3" style="break"><hr></td></tr>

                                            <tr >
                                                <td colspan="2" class="alignright"><strong>Surcharge:</strong></td>
                                                <td>
                                                    <my:money input="${p.surcharge}"/></td>
                                            </tr>
                                            <tr >
                                                <td colspan="2" class="alignright"><strong>Total:</strong></td>
                                                <td>
                                                    <my:money input="${orderDetails.order.amount}"/></td>
                                            </tr>

                                            <tr ><td colspan="3" style="break"><hr></td></tr>


                                        </table>
                                    </div>
                                </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div >
                                    <h1>Not Logged In</h1>
                                    <p> You have not logged in yet.</p>
                                    <div>
                                        <form method="get" action="<c:url value="/login"/>">
                                            <input type="submit" class="yellow" value="Log In"/>
                                        </form>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>


                    </div>
                </div>
            </div>
        </div>
    </div>

</section>


<jsp:include page="footer.jsp"/>


</body>
</html>
