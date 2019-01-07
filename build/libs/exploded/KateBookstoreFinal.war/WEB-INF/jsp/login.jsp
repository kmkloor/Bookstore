<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>


<!doctype html>
<html>
<head>
    <title>Account</title>
    <meta charset="utf-8">
    <meta name="description" content="The category page for My Bookstore">

    <!--
        normalize-and-reset.css.css is a basic CSS reset; useful for starting from ground zero.
        always include this first.
    -->


    <link rel="stylesheet" type="text/css" href="<c:url value="/css/normalize-and-reset.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/footer.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/login.css"/>">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans|PT+Sans+Narrow" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Libre+Baskerville" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,400i,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">


</head>

<body class="home">
<main>
    <jsp:include page="header.jsp"/>
    <jsp:useBean id="p" scope="request" type="viewmodel.LogInViewModel"/>
    <section class="checkoutMain">
        <div class ="content-container form shortpages" >
            <div class="content-container nobottommargin notopmargin">
                <h1>Log In</h1>
            </div>
            <div class="content-container notopmargin">
               <div class="checkout almostwhitebg">
                   <div class="checkoutFormErrors" >
                       <c:if test="${p.noCustomer}">
                           <p class="error">Customer does not exist, please try logging in again.<br></p>
                       </c:if>
                   </div>
                    <div class="checkoutFormAndInfo">
                        <div class="checkoutFormBox">
                            <form class="checkoutForm" action="<c:url value='login'/>" method="post">
                                <p class="no_pad">Email</p>
                                <input class="textField" type="text" name="email" ><br>
                                <p class="no_pad">Last four digits of your credit card</p>
                                <input class="textField" type="text"  name="ccNumber"><br>
                                <p class="suggestion">Suggestion: If you haven't ordered yet, use "kmkloor@email.com" and "4444"
                                to view a sample account.</p><br>
                                <input id="boldSubmitButton" type="submit" class="yellow" value="Find Orders">
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
