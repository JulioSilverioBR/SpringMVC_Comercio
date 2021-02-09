<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Qintess - Comércio Online</title>

<link href='<spring:url value="/resources/css/bootstrap.css" />'
	rel="stylesheet" />
<script src='<spring:url value="/resources/js/jquery-3.4.1.min.js" />'></script>
<script src='<spring:url value="/resources/js/bootstrap.js" />'></script>
</head>
<body>
	<jsp:include page="${request.contextPath}/menu"></jsp:include>

	<!-- Page Content -->
	<div class="container mt-3">

		<div class="row">

			<!-- Menu -->
			<jsp:include page="${request.contextPath}/menuLateral"></jsp:include>

			<div class="col-lg-9 mt-5">
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
					<c:forEach var="propaganda" items="${propagandas }" varStatus="loop">
					
					<c:choose>
					
						<c:when test="${loop.index == 0}"> <li data-target="#carouselExampleIndicators" data-slide-to="${ loop.index }"class="active"></li> </c:when>
						<c:otherwise><li data-target="#carouselExampleIndicators" data-slide-to="${ loop.index }"></li></c:otherwise>
					
					</c:choose>
					</c:forEach>
					</ol>
					
					<div class="carousel-inner" role="listbox">
							<c:forEach var="propaganda" items="${propagandas}" varStatus="loop">
							<c:choose>
							<c:when test="${loop.index ==0 }"> <div class="carousel-item active">
										<img class="d-block w-100 text-center"  src="data:image/jpge;base64,${propaganda.imagemEncoded}"
											alt="Slide">
										 <div class="carousel-caption bg-transparent  d-none d-md-block" style=" background: rgba(46, 51, 56, 0.2)!important;width: 100%;position: absolute;left:0;bottom:0;height:18%">
        								  <h5 >${propaganda.nomePropaganda}</h5>
        								</div>
									</div> </c:when>
								<c:otherwise> <div class="carousel-item">
										<img class="d-block w-100 text-center"  src="data:image/jpge;base64,${propaganda.imagemEncoded}"
											alt="Slide">
											<div class="carousel-caption bg-transparent  d-none d-md-block" style=" background: rgba(46, 51, 56, 0.2)!important;width: 100%;position: absolute;left:0;bottom:0;height:18%">
        								  <h5 >${propaganda.nomePropaganda}</h5>
        								</div>
									</div> </c:otherwise>
								</c:choose>
									
							</c:forEach>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
 				
				<div class="row">
					<c:forEach var="produto" items="${produtos}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="#"><img class="card-img-top"
									src="data:image/jpge;base64,${produto.imagemEncoded}" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#">${produto.nome}</a>
									</h4>
									<h5>R$ ${produto.valorUnitario}</h5>
									
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733;
										&#9733; &#9734;</small>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>