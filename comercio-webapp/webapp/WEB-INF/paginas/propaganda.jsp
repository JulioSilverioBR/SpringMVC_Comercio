<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/propaganda/deleta/" var="deleta"></spring:url>
<spring:url value="/propaganda/altera/" var="altera"></spring:url>
<spring:url value="/propaganda/salva" var="salva"></spring:url>

<link href='<spring:url value="/resources/css/bootstrap.css" ></spring:url>' rel="stylesheet">
<script src='<spring:url value="/resources/js/jquery-3.4.1.min.js" />'></script>
<script src='<spring:url value="/resources/js/bootstrap.js" />' ></script>
<script src='<spring:url value="/resources/js/bootstrap.bundle.min.js" />' ></script>

<meta charset="UTF-8">
<title>Cadastro - Propaganda Qintess</title>
</head>
<body>
	<jsp:include page="${request.contextPath}/menu"></jsp:include>
	<div class="shadow-sm rounded text-center">
	<c:if test="${not empty mensagemErro }">
		<div id="divMensagemErro" class="alert alert-danger text-center" role="alert" >
			${mensagemErro}
		</div>
	</c:if>
	
	<c:if test="${not empty mensagemSucesso }">
		<div id="divMensagemSucesso" class="alert alert-success text-center" role="alert" >
			${mensagemSucesso}
		</div>
	</c:if>
	</div>
<div class="container mt-5">
		<div class="row">	
	<jsp:include page="${request.contextPath}/menuLateral"></jsp:include>
	
	<div class="col-lg-9">
	<h2 class="display-4 text-center">Cadastro de Propaganda</h2>
	
	<hr>
	<form:form action="${salva}" enctype="multipart/form-data" modelAttribute="propaganda">
		<form:hidden path="id"/>
		<form:hidden path="imagemProp"/>
			<div class="form-group">	
			<label>Título da Propaganda:</label><br>
			<form:input path="nomePropaganda" cssClass="form-control"/>
			</div>
			
			<div class="form-group">	
			<label >Imagem da Propaganda: </label>
			<div class="custom-file">
				<input type="file" name="imagem" class="custom-file-input " value="${propaganda.imagemEncoded}">
				<label class="custom-file-label">Escolha uma Imagem</label>
			</div>
			</div>
			
			<c:if test="${propaganda.id ne 0 }">
				<div class="mb-5">
					<img class="img-thumbnail" style="width: 255px" alt="Imagem não encontrada" src="data:image/jpge;base64,${propaganda.imagemEncoded}">
				</div>
			</c:if>
		
			<input type="submit" class="btn btn-outline-success" name="salva" value="${ propaganda.id == 0 ? 'Cadastrar' : 'Alterar' }">
			<c:if test="${propaganda.id ne 0}"><a href="/propaganda" ><button class="btn btn-outline-danger">Cancelar alteração</button></a> </c:if>
	</form:form>
	<c:if test="${not empty propaganda }">
	<hr>
		<h1 class="text-center display-4">Propagandas Cadastradas</h1>

<div class="row">
<div class="card-deck mt-4">
<c:forEach var="propaganda" items="${propagandas}">
<div class="col-sm-4 mb-4">
  <div class="card">
    <img src="data:image/jpge;base64,${propaganda.imagemEncoded}"  class="card-img-top img-fluid" alt="${propaganda.nomePropaganda}">
    <div class="card-body">
      <h5 class="card-title">${propaganda.nomePropaganda}</h5>
      <a href="${altera}${propaganda.id}" class="btn btn-outline-warning mr-4 float-left">Alterar</a>
      <a href="${deleta}${propaganda.id}" class="btn btn-outline-danger float-right" onclick="return confirm('Deseja deletar o conteudo?');">Deletar</a>
    </div>
     <div class="card-footer text-muted">
    <p class="text-center">ID: ${propaganda.id} </p>
  </div>
  </div>
  </div>
  </c:forEach>
 </div>		
 </div>		
			<hr>
	</c:if>
	</div>
</div>
</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#divMensagemErro').delay(3500).fadeOut('slow');
		$('#divMensagemSucesso').delay(3500).fadeOut('slow');
	});	
	
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
</script>