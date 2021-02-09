<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<spring:url value="/produto/deleta/" var="deleta"></spring:url>
<spring:url value="/produto/altera/" var="altera"></spring:url>
<spring:url value="/produto/salva" var="salva"></spring:url>

<link href='<spring:url value="/resources/css/bootstrap.css" ></spring:url>' rel="stylesheet">
<script src='<spring:url value="/resources/js/jquery-3.4.1.min.js" />'></script>
<script src='<spring:url value="/resources/js/bootstrap.js" />' ></script>

<title>Cadastra - Produto</title>
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
	<h2 class="display-4 text-center">Cadastro de Produto</h2>
	
	<hr>
	<form:form action="${salva}" enctype="multipart/form-data" modelAttribute="produto">
		<form:hidden path="id"/>
		<form:hidden path="imagemProd"/>
			<div class="form-group">	
			<label>Nome:</label><br>
			<form:input path="nome" cssClass="form-control"/>
			</div>
			
			<div class="form-group">	
			<label >Valor Unitário: </label>
			<form:input cssClass="form-control" path="valorUnitario"/>
			</div>
			
			<div class="form-group">	
			<label >Descrição: </label>
			<textarea rows="3" name="descricao" class="form-control">${produto.descricao}</textarea>
			</div>
			
			<div class="form-group">	
			<label >Foto: </label>
			<div class="custom-file">
				<input type="file" name="imagem" class="custom-file-input " value="${produto.imagemEncoded}">
				<label class="custom-file-label">Escolha uma Imagem</label>
			</div>
			</div>
			
			<c:if test="${produto.id ne 0 }">
				<div class="mb-5">
					<img class="img-thumbnail" style="width: 255px" alt="Imagem não encontrada" src="data:image/jpge;base64,${produto.imagemEncoded}">
				</div>
			</c:if>
		
			<input type="submit" class="btn btn-outline-success" name="salva" value="${ produto.id == 0 ? 'Cadastrar' : 'Alterar' }">
			<c:if test="${produto.id ne 0}"><a href="/produto" ><button class="btn btn-outline-danger">Cancelar alteração</button></a> </c:if>
	</form:form>
	<c:if test="${not empty produtos }">
	<hr>
		<h1 class="text-center display-4">Produtos Cadastrados</h1>
			<table  class="table table-bordered">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Codigo </th>
						
						<th scope="col">Nome </th>
						
						<th scope="col">Preço Unitário </th>
						
						<th scope="col">Descrição </th>
						
						<th scope="col" colspan="2">Ações </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="produto" items="${produtos}">
					<tr> 
						<td scope="row">${produto.id}</td>
						<td>${produto.nome}</td>
						<td>${produto.valorUnitario}</td>
						<td>${produto.descricao}</td>
						<td colspan="2">
						<a href="${altera}${produto.id}" class="btn btn-outline-warning mr-4">Alterar</a>
						<a href="${deleta}${produto.id}" class="btn btn-outline-danger" onclick="return confirm('Deseja deletar o conteudo?');">Deletar</a>
						</td>

					</tr>
					</c:forEach>
				</tbody>
			</table>
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
</script>
</html>