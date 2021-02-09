<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Cadastro - Cliente Qintess</title>

<spring:url value="/cliente/" var="home"></spring:url>
<spring:url value="/cliente/deleta/" var="deleta"></spring:url>
<spring:url value="/cliente/altera/" var="altera"></spring:url>
<spring:url value="/cliente/salva" var="salva"></spring:url>

<link href='<spring:url value="/resources/css/bootstrap.css" />'
	rel="stylesheet" />
<script src='<spring:url value="/resources/js/jquery-3.4.1.min.js" />'></script>
<script src='<spring:url value="/resources/js/bootstrap.js" />'></script>
</head>
<body>

	<jsp:include page="${request.contextPath}/menu"></jsp:include>

	<div class="container mt-4">
		<div class="row">

			<!-- Menu -->
			<jsp:include page="${request.contextPath}/menuLateral"></jsp:include>

			<div class="col-lg-9">
			<div class="shadow-sm rounded text-center">
				<c:if test="${not empty mensagemErro }">
					<div id="divMensagemErro" class="alert alert-danger" role="alert">
						${mensagemErro }</div>
				</c:if>

				<c:if test="${not empty mensagemSucesso }">
					<div id="divMensagemSucesso" class="alert alert-success"
						role="alert">${mensagemSucesso }</div>
				</c:if>
			</div>
				<div class="pb-2 mt-4 mb-2 border-bottom">
					<!-- page header -->
					<h1 class="display-4 text-center">Cadastro de Cliente</h1>
				</div>

				<form:form action="${salva }" cssClass="form" modelAttribute="cliente" class="mb-2">

					<form:hidden path="id" />

					<div class="form-group">
						<label>Nome</label> 
						<input type="text" class="form-control"
							name="nome" value="${cliente.nome }" />
					</div>

					<div class="form-group">
						<label>E-mail</label> 
						<input type="email" class="form-control"
							name="email" value="${cliente.email }" />
					</div>

					<div class="form-group">
						<label>Senha</label> 
						<input type="text" class="form-control"
							maxlength="20" name="senha" value="${cliente.senha }" />
					</div>

					<div class="form-group">
						<label>Data Nascimento</label> 
						<input type="date"
							class="form-control" name="dtNascimento"
							value="${cliente.dtNascimento }" />
					</div>
					<input type="submit" class=" btn  btn-outline-success " value="${cliente.id == 0 ? 'Cadastrar' : 'Alterar' }" />
					<c:if test="${cliente.id ne 0}"><a class=" btn btn-outline-danger " href="${home}" >Cancelar alteração</a> </c:if>
				</form:form>
				
				<c:if test="${not empty clientes }">
					<hr>
					<h2 class="display-4 text-center">Clientes Cadastrados</h2>
					<table class="text-center table table-hover table-responsive">
				
						<thead class="thead-dark">
							<tr>
							
								<th>Código</th>
								<th>Nome</th>
								<th>E-mail</th>
								<th>Data Nascimento</th>
								<th>Privilégio</th>
								<th colspan="2">Ações</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cliente" items="${clientes }">
								<c:if test="${cliente.email != usuarioLogado.name }">
								<tr>
									<td>${cliente.id }</td>
									<td>${cliente.nome }</td>
									<td>${cliente.email }</td>
									<fmt:parseDate value="${cliente.dtNascimento }" type="date"
										pattern="yyyy-MM-dd" var="dtParsed" />
									<fmt:formatDate value="${dtParsed }" type="date"
										pattern="dd/MM/yyyy" var="dtTratada" />
									<td>${dtTratada }</td>
									<td>${cliente.papeis == '[USER]' ? 'Usuario' : 'Administrador'}</td>
									<td><a href="${altera}${cliente.id}"
										class="btn btn-outline-warning">Alterar</a></td>
									<td><a href="${deleta}${cliente.id}"
										class="btn btn-outline-danger">Deletar</a></td>
								</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>

				</c:if>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			//na div de id (#) divMensagemErro
			//terá uma espera (delay) de 5 secs (5000ms)
			//será feito um fadeOut lento (frescura)
			$('#divMensagemErro').delay(3500).fadeOut('slow');
			$('#divMensagemSucesso').delay(3500).fadeOut('slow');
		});
	</script>
</body>
</html>