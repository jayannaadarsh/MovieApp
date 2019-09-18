<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="s"%>

<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}

.w3-col.m4, .w3-third {
	width: 25%;
}

p {
	margin: 5px 0;
}

.text-field {
	width: 100%;
	height: 45px;
	margin-bottom: 20px;
	padding-left: 15px;
	font-weight: bold;
}

.button {
	position: absolute;
	top: 8px;
	right: 15px;
	cursor: pointer;
}

.form-row {
	position: relative;
}

.w3-third.w3-container.w3-margin-bottom img {
    max-height: 150px;
}
</style>
<body class="w3-light-grey w3-content" style="max-width: 1600px">


	<!-- !PAGE CONTENT! -->
	<div class="w3-main">

		<!-- Header -->
		<header id="portfolio">
			<a href="#"><img src="/w3images/avatar_g2.jpg"
				style="width: 65px;"
				class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<div class="w3-container">
				<h1>
					<b>My Movies</b>
				</h1>
				<s:form action="search" modelAttribute="movie">
					<div class="form-row">
						<s:input type="text" path="movieName" class="text-field" />
						<button type="submit" value="SEARCH" class="button">SEARCH</button>
						<s:errors cssStyle="color: #ff0000;" path="movieName"/>
					</div>

				</s:form>
			</div>
		</header>

		<!-- First Photo Grid-->



		<div class="w3-row-padding">
			<c:if test="${not empty movielist}">
				<c:forEach var="movie" items="${movielist}">
					<div class="w3-third w3-container w3-margin-bottom">


						<img src="${movie.poster}" alt="Norway"
							style="width: 100%; height: auto;" class="w3-hover-opacity">
						<div class="w3-container w3-white">
							<p>
								<b>${movie.title}</b>
							</p>
							<p>
								Year: <b>${movie.year}</b>
							</p>
							<p>
								Type: <b>${movie.type}</b>
							</p>
						</div>
					</div>
				</c:forEach>
			</c:if>

		</div>






		<!-- End page content -->
	</div>


</body>
</html>
