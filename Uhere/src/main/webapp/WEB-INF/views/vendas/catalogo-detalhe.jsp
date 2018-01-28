<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="cti" uri="/WEB-INF/tag/ConvertToImage.tld"%>

<input type="hidden" value="<c:url value="/login"/>" id="l_openModal">
<div class="container">
	<div class="row">
		<div class="col-sm-12 col-md-12">
			<h1>${anuncio.tblVeiculo.tblMarca.descricao} - ${anuncio.tblVeiculo.tblModelo.descricao} </h1>
		</div>
		<div class="col-md-6">
			<!-- COMEÇA O CARD DO CARRO -->
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<c:forEach begin="1" end="${fn:length(anuncio.tblVeiculo.fotos)}" varStatus="cont">
						<li data-target="#carousel-example-generic" data-slide-to="${cont.count -1}" class=""></li>
					</c:forEach>
				</ol>
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<c:forEach items="${anuncio.tblVeiculo.fotos}" var="foto" varStatus="cont">
						<c:choose>
							<c:when test="${cont.count == 1 }">
								<div class="item active">
									<img src="data:image/jpeg;base64,<cti:image vImagem="${foto.value}" />" alt="carro" >
								</div>
							</c:when>
							<c:otherwise>
								<div class="item">
									<img src="data:image/jpeg;base64,<cti:image vImagem="${foto.value}" />" alt="carro" >
								</div>
							</c:otherwise>				
						</c:choose>
				    </c:forEach>
		    	</div>
				
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> 
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> 
					<span class="sr-only"><fmt:message key="vendas.catalogo.detalhe.link.anterior"/></span>
				</a> 
				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> 
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only"><fmt:message key="vendas.catalogo.detalhe.link.proximo"/></span>
				</a>
			</div>
			<div class="col-sm-12 col-md-12">
				<h2><fmt:message key="vendas.catalogo.detalhe.label.preco"/> : <fmt:formatNumber type="currency" value="${anuncio.precoInicial}"/> </h2>
			</div>
		
			<div class="col-sm-12 col-md-12">
				<p>${anuncio.descricao}</p>
			</div>
			
			<div class="col-sm-12 col-md-12">
				<c:forEach items="${anuncio.tblVeiculo.tblOpcionais}" var="opcionais" varStatus="cont">
				<p>${opcionais.descricao}</p>
				</c:forEach>
			</div>			
			
			<div class="col-sm-12 col-md-12">
				<h1><fmt:message key="vendas.catalogo.detalhe.box1.titulo"/></h1>
				<table class="table detalhes-da-oferta">
					<thead>
						<tr>
							<th><fmt:message key="vendas.catalogo.detalhe.table.cabecario.ano"/></th>
							<th><fmt:message key="vendas.catalogo.detalhe.table.cabecario.combustivel"/></th>
							<th><fmt:message key="vendas.catalogo.detalhe.table.cabecario.portas"/></th>
							<th><fmt:message key="vendas.catalogo.detalhe.table.cabecario.cor"/></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${anuncio.tblVeiculo.anoModelo}</td>
							<td>${anuncio.tblVeiculo.tblCombustivel.descricao}</td>
							<td>${anuncio.tblVeiculo.portas}</td>
							<td>${anuncio.tblVeiculo.tblCor.descricao}</td>
						</tr>
					</tbody>
					<thead>
						<tr>
							<th><fmt:message key="vendas.catalogo.detalhe.table.cabecario.modelo"/></th>
							<th><fmt:message key="vendas.catalogo.detalhe.table.cabecario.quilometragem"/></th>
							<th><fmt:message key="vendas.catalogo.detalhe.table.cabecario.cambio"/></th>
							<th><fmt:message key="vendas.catalogo.detalhe.table.cabecario.placa"/></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${anuncio.tblVeiculo.tblModelo.descricao}</td>
							<td><fmt:formatNumber type="number" value="${anuncio.tblVeiculo.quilometragem}"/></td>
							<td>${anuncio.tblVeiculo.tblCambio.descricao}</td>
							<td>${anuncio.tblVeiculo.placa}</td>
						</tr>
					</tbody>
				</table>
			</div>
		
			<div class="col-sm-12 col-md-12">
				<h1><fmt:message key="vendas.catalogo.detalhe.box2.titulo"/></h1>
				<table class="table detalhes-da-oferta">
					<thead>
						<tr>
							<th><fmt:message key="vendas.catalogo.detalhe.table.cabecario.estado"/></th>
							<th><fmt:message key="vendas.catalogo.detalhe.table.cabecario.municipio"/></th>
							<th><fmt:message key="vendas.catalogo.detalhe.table.cabecario.dtPublicacao"/></th>
							<th><fmt:message key="vendas.catalogo.detalhe.table.cabecario.codigo.anuncio"/></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${anuncio.tblUf.descricao}</td>
							<td>${anuncio.tblCidade.descricao}</td>
							<td><fmt:formatDate type="date" pattern="MM/yyyy" value="${anuncio.dtPublicacao.time}"/></td>
							<td>${anuncio.chave}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- TERMINA O CARD DO CARRO -->
		<sec:authorize var="isActive" access="isAuthenticated()" />
		<c:choose>
			<c:when test="${isActive}">
				<div class="col-md-6">
					<div class="col-sm-12 col-md-12">
						<h1><fmt:message key="vendas.catalogo.detalhe.mensagem.enviar.email"/></h1>
						<form class="form-horizontal">
							<div class="form-group">
								<label for="nome" class="col-sm-2 control-label"><fmt:message key="vendas.catalogo.detalhe.label.nome"/></label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="nome" placeholder="<fmt:message key="vendas.catalogo.detalhe.placeholder.nome"/>">
								</div>
							</div>
							<div class="form-group phone-area">
								<label for="telefone" class="col-sm-2 control-label"><fmt:message key="vendas.catalogo.detalhe.label.telefone"/></label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="telefone" placeholder="<fmt:message key="vendas.catalogo.detalhe.placeholder.telefone"/>">
								</div>
							</div>
							<div class="form-group">
								<label for="msg" class="col-sm-2 control-label"><fmt:message key="vendas.catalogo.detalhe.label.mensagem"/></label>
								<div class="col-sm-10">
									<textarea class="form-control" id="msg" placeholder="<fmt:message key="vendas.catalogo.detalhe.placeholder.mensagem"/>"></textarea>
								</div>
							</div>
							<button class="btn btn-primary btn-lg" style="float: right;" type="submit"><fmt:message key="vendas.catalogo.detalhe.btn.enviar"/></button>
						</form>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-md-6">
			        <!-- COMEÇA O CARD DO CARRO -->
			        <div class="col-sm-12 col-md-12">
				        <h1><fmt:message key="vendas.catalogo.detalhe.mensagem.logaout"/></h1>
				        <button type="button" class="btn btn-primary navbar-btn logincadastro" data-toggle="modal" data-target="#login"><fmt:message key="vendas.catalogo.detalhe.btn.conectar"/></button>
				    </div> 
		  		</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

