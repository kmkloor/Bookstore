<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html>
<head>
	<title>Open Book Bookstore</title>
	<meta charset="utf-8">
	<meta name="description" content="The homepage for My Bookstore">

	<!--
        normalize-and-reset.css is a basic CSS reset; useful for starting from ground zero.
        always include this first.
    -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/normalize-and-reset.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/footer.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/homepage.css"/>">
	<link href="https://fonts.googleapis.com/css?family=PT+Sans|PT+Sans+Narrow" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Libre+Baskerville" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,400i,700" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">


</head>

<body>

<main>
	<jsp:include page="header.jsp"/>
	<jsp:useBean id="p" scope="request" type="viewmodel.HomepageViewModel"/>
	<section>
		<div class="content">
			<div class="content-container clearbg">
				<div class="padded width60">
					<div class="centeredvertically">
						<div class="title floatright">
							<h1 class="pad_right">A curated collection for </h1>
							<div class="highlight bluebg"></div>
						</div>
						<div class="widthmax floatright"></div>
						<div class="title floatright">
							<h1 class="pad_right"> connoisseurs of good books. </h1>
							<div class="highlight bluebg"></div>
						</div>
						<p class="dark floatright" id="intro">Lorem ipsum dolor sit amet, vim nonumy detraxit eleifend in, falli maiorum phaedrum est at. Cu duo unum prompta consequuntur, brute laudem appareat ei his. Odio mandamus an vix, etiam mentitum nam ea, lorem salutandi vel an. An modus eruditi qui, vim nobis laoreet splendide ne, malorum nonumes at mel.
						</p>
					</div>
				</div>
				<div class="padded width40">
					<img src="${p.siteImagePath}book1.jpg" alt="openbook" />
				</div>
			</div>
		</div>
		<div class="content bluebg">
			<div class="content-container" id="loosetitle">
				<div class="title floatright">
					<h1 class="pad_left">Our newest arrivals...</h1>
					<div class="highlight_left whitebg"></div>
				</div>
			</div>
			<div class="content-container categorypad">

				<c:forEach var="book" items="${p.randomBooks}">
					<div class="bookbox whitebg">
						<fmt:setBundle basename="bookdata" var="lang"/>
						<fmt:setLocale value="en_US"/>
						<div class="titlebox" >
							<h1><c:out value="${book.title}"/><fmt:message key="${book.bookId}.sub" bundle="${lang}"/></h1>
						</div>
						<div class="highlight yellowbg opacity"></div>
						<div class="lesspadded">
							<div class="fitcontentheight">
								<img src="${p.bookImagePath}${book.bookId}.jpg" />
								<p> <fmt:message key="${book.bookId}.blurb" bundle="${lang}"/></p>
							</div>
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
				</c:forEach>
			</div>

		</div>
		<div class="content clearbg lastcontent">
			<div class="content-container blackbg">
				<div class="yellowbg width25">
					<div class="centeredvertically">
						<img src="${p.bookImagePath}rooney2.png" alt="openbook" width="400px"/>
					</div>
				</div>
				<div class="floatright padded width75">
					<div class="centeredvertically">
						<div class="title floatright">
							<h1 class="light pad_right">Our new favorite author:</h1>
							<div class="highlight navybg"></div>
						</div>
						<div class="widthmax floatright"></div>
						<div class="title floatright">
							<h1 class="light pad_right">Kathleen Rooney</h1>
							<div class="highlight navybg"></div>
						</div>
						<div id="authorblurb">
							<p class="light floatleft" >Kathleen Rooney’s new novel, Lillian Boxfish Takes a Walk (St. Martin’s Press) follows the life of the red-headed poet of Murray Hill. Spanning six decades, from Lillian’s illustrious career as R.H. Macy’s highest paid ad-writing woman, her life of poetry, love, and heartbreak, to the New Year’s Eve of 1984, where she takes her long, adventurous walk through Manhattan, this novel is both sprawling and personal, and in Kathleen Rooney’s hands, Lillian is nothing short of extraordinary. Via email, I had the pleasure of discussing the new book with Rooney, where we covered Lillian, the joys of research, and the Rooney’s own love of walking.</p>
							<p class="light floatleft"><i>"Because if you’ve taken a walk once, you’ve taken it once — even if you walk down the same stretch of street a hundred times, it will be different on every single journey because the city is an organism that’s always growing, changing, dying and being reborn."</i></p>
							<p class="light floatright"> <a href="https://electricliterature.com/kathleen-rooney-the-art-of-the-stroll-5f2acc2fd3b0">Electric Literature</a></p>
						</div>
					</div>
				</div>
			</div>
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
