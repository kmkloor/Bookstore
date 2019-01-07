<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="p" scope="request" type="viewmodel.BaseViewModel"/>
<header class="header-container" name="top">
    <div class="header-content">
        <div class="logo">
            <a href="homepage">
                <img src="${p.siteImagePath}roundblue.png" alt="Bookstore logo" />
            </a>
        </div>
        <div class="nav">
            <div class="wrap">
                <div class="search">

                    <form action="book" method="post">
                        <input type="text" class="searchTerm"  name="q" placeholder="Search for books">
                        <input type="hidden" name="action" value="search"/>
                        <button type="submit" class="searchButton">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>

                </div>
            </div>
            <ul class="mini">
                <li><a href="homepage">Home</a></li>
                <div class="dropdown"><li>
                    <span>Categories</span>
                    <div class="dropdown-content">
                        <c:forEach var="category" items="${p.categories}">
                            <p><a href="category?category=<c:out value="${category.name}"/>"><c:out value="${category.name}"/></a></p>
                        </c:forEach>
                    </div>
                </li></div>
                <li>
                    <c:choose>
                    <c:when test="${p.logged}">
                        <form action="account" method="post">
                            <input type="hidden" name="action" value="logout"/>
                            <input type="submit" class="linkButton" value="Log Out">
                        </form>
                    </c:when>
                        <c:otherwise>
                        <a href="login">Log In</a>
                        </c:otherwise>
                    </c:choose></li>
                <li><a href="account">Account</a></li>
                <li><a href="cart">Cart(<div id="cartCount">${p.cart.numberOfItems}</div>)</a></li>
            </ul>

        </div>
    </div>
</header>