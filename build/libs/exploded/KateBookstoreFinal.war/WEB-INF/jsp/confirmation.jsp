<%--
  Created by IntelliJ IDEA.
  User: kkloor
  Date: 7/24/2018
  Time: 12:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Confirmation</title>


    <link rel="stylesheet" type="text/css" href="<c:url value="/css/normalize-and-reset.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/footer.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/confirmation.css"/>">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans|PT+Sans+Narrow" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,400i,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

</head>
<body>

<jsp:include page="header.jsp"/>
<jsp:useBean id="p" scope="request" type="viewmodel.ConfirmationViewModel"/>
<section class="sectionpad">
    <div class ="content-container form"  >
        <div class="content-container checkout" >
            <h1>Confirmation</h1>
        </div>
        <div class="content-container ">
            <div id="confirmation" class="checkout almostwhitebg">
                <div class="centertext">
                    <div class="checkoutFormBox">
                      <h1>Order Successful!</h1>
                            <br>
                            <p>Confirmation Number:
                            <strong>${p.orderDetails.order.confirmationNumber}</strong>
                            <br>
                            <fmt:formatDate value="${p.orderDetails.order.dateCreated}"
                                            type="both"
                                            dateStyle="long"
                                            timeStyle="short"/>
                        <br><br>
                        Thank you for your order.
                        </p>

                        <div >
                            <h1 class="bottom">Order Summary</h1>
                            <table class="widthmax bordertable">
                                <tr>
                                    <td><strong>Book</strong></td>
                                    <td><strong>Quantity</strong></td>
                                    <td><strong>Price</strong></td>
                                </tr>
                                <tr><td colspan="3" style="break"><hr></td></tr>

                                <c:forEach var="lineItem" items="${p.orderDetails.lineItems}" varStatus="iter">

                                    <tr>
                                        <td>
                                                ${p.orderDetails.books[iter.index].title}
                                        </td>
                                        <td>
                                                ${lineItem.quantity}
                                        </td>
                                        <td>
                                            <my:money input="${(p.orderDetails.books[iter.index].price * lineItem.quantity)}"/>
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
                                        <my:money input="${p.orderDetails.order.amount}"/></td>
                                </tr>

                                <tr ><td colspan="3" style="break"><hr></td></tr>


                            </table>

                        </div>

                        <div >

                            <h1>Customer Summary</h1>
                            <p>
                                ${p.orderDetails.customer.customerName}
                                <br><br>
                                <my:address input="${p.orderDetails.customer.address}"/><br>
                                <br><br>
                                <strong>Credit Card:</strong> .... .... .... ${p.orderDetails.customer.ccNumber.substring(p.orderDetails.customer.ccNumber.length() - 4)} (${p.orderDetails.customer.ccExpDate.month}/${(p.orderDetails.customer.ccExpDate.year - 100)})


                            <div >
                            <a class="btn start" href="homepage"/>Return</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>


<jsp:include page="footer.jsp"/>


</body>
</html>
