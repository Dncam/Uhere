<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<input type="hidden" value="<c:url value="/login"/>" id="l_openModal">
<c:url var="vPesquisar" value="/anuncio/pesquisa/busca/simples" />

<nav class="navbar navbar-inverse navbar-fixed-top dark" id="navbar">
    <div class="container">
     <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menumobile" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand ancora" href="<c:url value="/"/>"><img src="<c:url value="/resources/img/uhere-logo.png"/>"></a>
    </div>
    <div class="collapse navbar-collapse" id="menumobile">
      <form class="navbar-form navbar-left" action="${vPesquisar}" method="GET">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="<fmt:message key="home.cabecario.placeholder.pesquisar"/>" name="descricao">
        </div>
        <button type="submit" class="btn btn-primary"><fmt:message key="home.cabecario.btn.pesquisar"/></button>
      </form>
      <sec:authorize var="isActive" access="isAuthenticated()" />
      <c:choose>
		<c:when test="${isActive}">
			 <!-- MENU LOGADO -->
		     <ul class="nav navbar-nav navbar-right">
		        <li><a href="<c:url value="/anuncio/meus/anuncios"/>"><fmt:message key="home.cabecario.link.meus.anuncios"/></a></li>
		        <li><a href="#"><fmt:message key="home.cabecario.link.meus.leiloes"/></a></li>
		        <li><a href="<c:url value="/leilao"/>" data-toggle="modal"><fmt:message key="home.cabecario.link.criar.leilao"/></a></li>
		        <li><a href="<c:url value="/anuncio/tela/cadastrar"/>"><fmt:message key="home.cabecario.link.criar.anuncio"/></a></li>
		        <li class="dropdown" role="user">
		          <a class="icon-user dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"></a>
		          <ul class="dropdown-menu">
		            <li><a href="<c:url value="/cliente/tela/completar" />"><fmt:message key="home.cabecario.link.alterar.cadastro"/></a></li>
		            <li><a href="<c:url value="/cliente/tela/modificar/senha" />"><fmt:message key="home.cabecario.link.alterar.senha"/></a></li>
		            <li><a href="<c:url value="/logout" />"><fmt:message key="home.cabecario.link.sair"/></a></li>
		          </ul>
		        </li>
		      </ul>
	     </c:when>
      	 <c:otherwise>
      	 	<!-- MENU NÃO LOGADO -->
	       	<ul class="nav navbar-nav navbar-right">
		      <li><a href="#footer" class="ancora"><fmt:message key="home.cabecario.link.comprar"/></a></li>
		      <li><a href="#footer" class="ancora"><fmt:message key="home.cabecario.link.vender"/></a></li>
		      <li><a href="#sobrenos" class="ancora"><fmt:message key="home.cabecario.link.sobre"/></a></li>
		      <li><a href="#footer" class="ancora"><fmt:message key="home.cabecario.link.contato"/></a></li>
		      <li><button type="button" class="btn btn-primary navbar-btn logincadastro" data-toggle="modal" data-target="#login"><fmt:message key="home.cabecario.btn.login" /></button></li>
		    </ul>
      	</c:otherwise>
     </c:choose>
    </div>
  </div>
</nav>
