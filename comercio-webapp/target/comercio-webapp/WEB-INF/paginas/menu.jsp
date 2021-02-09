<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<spring:url value="/" var="inicio"></spring:url>
<spring:url value="/produto" var="produto"></spring:url>
<spring:url value="/cliente" var="cliente"></spring:url>

<spring:url value="/logout" var="logout"></spring:url>
<spring:url value="/login" var="logar"></spring:url>
    
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  <h5 class="my-0 mr-md-auto font-weight-normal">Gerenciamento de Clientes-Produto</h5>
  <nav class="my-2 my-md-0 mr-md-3">
  
	<c:if test="${usuarioLogado.authorities[0] eq 'ROLE_ADMIN' }">
    <a class="p-2 text-dark" href="${inicio}">Inicio</a>
    <a class="p-2 text-muted "href="${produto}">Produtos</a>
    <a class="p-2 text-dark" href="${cliente}">Cliente</a>
    </c:if>
	<a class="p-2 text-dark" href="#">${usuarioLogado.name == 'anonymousUser' ? '' : usuarioLogado.name}</a>		
	
	<c:if test="${usuarioLogado.name eq 'anonymousUser' }">
	<a class="p-2 text-dark" href="${logar}" >Logar</a>
	</c:if>
	
	<c:if test="${usuarioLogado.name ne 'anonymousUser' }">
	<a class="p-2 text-dark" href="${logout}" >Deslogar</a>
	</c:if>
  </nav>
</div>