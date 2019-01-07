<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>


<!doctype html>
<html>
<head>
    <title>Checkout</title>
    <meta charset="utf-8">
    <meta name="description" content="The category page for My Bookstore">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/normalize-and-reset.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/footer.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/checkout.css"/>">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans|PT+Sans+Narrow" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,400i,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="<c:url value="/js/jquery.validate.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/additional-methods.js"/>" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#checkoutForm").validate({
                rules: {
                    name: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    phone: {
                        required: true,
                        number: true,
                        phoneUS: true
                    },
                    address: {
                        required: true
                    },
                    ccNumber: {
                        required: true,
                        creditcard: true
                    }
                }
            });
        });
    </script>
</head>

<body class="home">
<main>
    <jsp:include page="header.jsp"/>
    <jsp:useBean id="p" scope="request" type="viewmodel.CheckoutViewModel"/>
    <section class="checkoutMain sectionpad">
        <div class ="content form shortpages">
        <div class="content-container checkout" id="checkouttitle">
            <h1>Checkout</h1>
        </div>
            <div class="content-container ">

    <div class="checkout almostwhitebg">
        <div class="checkoutFormErrors" ><p class="error">
            <c:if test="${p.hasValidationError}">
                <c:if test="${p.customerForm.hasNameError}">
                    ${p.customerForm.nameErrorMessage}<br>
                </c:if>
                <c:if test="${p.customerForm.hasAddressError}">
                    ${p.customerForm.addressErrorMessage}<br>
                </c:if>
                <c:if test="${p.customerForm.hasPhoneError}">
                    ${p.customerForm.phoneErrorMessage}<br>
                </c:if>
                <c:if test="${p.customerForm.hasEmailError}">
                    ${p.customerForm.emailErrorMessage}<br>
                </c:if>
                <c:if test="${p.customerForm.hasCreditError}">
                    ${p.customerForm.creditErrorMessage}<br>
                </c:if>
                <c:if test="${p.customerForm.hasDateError}">
                    ${p.customerForm.dateErrorMessage}<br>
                </c:if>
            </c:if>
            <c:if test="${p.hasTransactionError}">
                Transactions have not been implemented yet.<br>
            </c:if></p>
        </div>
        <div class="checkoutFormAndInfo">
            <div class="checkoutFormBox">
                <form class="checkoutForm" id="checkoutForm" action="<c:url value='checkout'/>" method="post">
                    <p class="no_pad">Name</p>
                    <input class="textField" type="text"  name="name"
                           value="${p.customerForm.name}"><br>
                    <p class="no_pad">Address</p>
                    <input class="textField" type="text"  name="address" value="${p.customerForm.address}"><br>
                    <p class="no_pad">Phone</p>
                    <input class="textField" type="text" id="phone" name="phone" value="${p.customerForm.phone}"><br>
                    <p class="no_pad">Email</p>
                    <input class="textField" type="text" name="email" value="${p.customerForm.email}"><br>
                    <p class="no_pad">Credit card</p>
                    <input class="textField" type="text" name="ccNumber"><br>
                    <p class="suggestion">Suggestion: Use 4111111111111111 (Visa) or 5500000000000004
                    (Mastercard) for a sample card number that will pass validation.</p>
                    <p class="no_pad"> Exp. date</p><br>
                    <select class="selectMenu" name="ccMonth">
                        <c:set var="montharr"
                               value="${['January','February','March','April','May','June','July','August','September','October','November','December']}"/>
                        <c:forEach begin="0" end="11" var="month">
                            <option value="${month}"
                                    <c:if test="${0 eq month}">selected</c:if>>
                                    ${(month + 1)}-${montharr[month]}
                            </option>
                        </c:forEach>
                    </select>
                    <select class="selectMenu" name="ccYear">
                        <c:forEach begin="2016" end="2027" var="year">
                            <option value="${year}"
                                    <c:if test="${2016 eq year}">selected</c:if>>
                                    ${year}
                            </option>
                        </c:forEach>
                    </select>
                    <span id="checkoutInfoText">

                   <p class="top"> Your credit card will be charged <strong><my:money input="${p.cart.subtotal + p.surcharge}"/></strong><br>
                       (<strong><my:money input="${p.cart.subtotal}"/></strong> + <strong><my:money input="${p.surcharge}"/></strong> shipping)</p>
        </span>
                    <input id="boldSubmitButton" type="submit" class="yellow" value="Submit">
                </form>
            </div>
        </div>
    </div>
        </div>
            <div>
    </section>
    <jsp:include page="footer.jsp"/>
</main>
</body>
</html>
