<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="cti" uri="/WEB-INF/tag/ConvertToImage.tld"%>
<section id="minhas-vendas-area" class="leilao-area">
	<div class="col-sm-12 col-md-12 faixa-localizadora">
		<div class="container">
			<h2 style="margin: 0px;">
				<fmt:message key="vendas.meus.anuncios.titulo" />
			</h2>
			<p>
				<fmt:message key="vendas.meus.anuncios.subtitulo" />
			</p>
		</div>
	</div>
	<div class="container">
		<c:forEach items="${anuncioList}" var="anuncio" varStatus="cont">
			<c:if test="${((cont.count - 1) % 4) == 0 }">
				<div class="row">
			</c:if>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<p class="faixa-tipo-de-leilao compra"><fmt:message key="vendas.meus.anuncios.tabela.titulo" /></p>
						<c:forEach items="${anuncio.tblVeiculo.fotos}" var="foto" end="0">
	    					<img src="data:image/jpeg;base64,<cti:image vImagem="${foto.value}" />" alt="carro">
	    				</c:forEach>
						<div class="caption">
							<h3><c:out value="${anuncio.tblVeiculo.tblModelo.descricao}" /></h3>
							<p><c:out value="${anuncio.tblVeiculo.tblMarca.descricao}" /></p>
							<table class="table oferta-resumida">
								<thead>
									<tr>
										<th><fmt:message key="vendas.meus.anuncios.tabela.quantidade.leiloes" /></th>
										<th><fmt:message key="vendas.meus.anuncios.tabela.validade" /></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>3</td>
										<td><fmt:formatDate pattern="dd/MM" value="${anuncio.validade.time}"/></td>
									</tr>
								</tbody>
								<thead>
									<tr>
										<th><fmt:message key="vendas.meus.anuncios.tabela.ultimo.lance" /></th>
										<th><fmt:message key="vendas.meus.anuncios.tabela.status" /></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Há 30 min</td>
										<td>
											<c:choose>
												<c:when test="${anuncio.status == 'ATIVO'}">
													<fmt:message key="vendas.meus.anuncios.tabela.status.ativo" />
												</c:when>
												<c:when test="${anuncio.status == 'VENDIDO'}">
													<fmt:message key="vendas.meus.anuncios.tabela.status.vendido" />
												</c:when>
												<c:when test="${anuncio.status == 'VALIDACAO'}">
													<fmt:message key="vendas.meus.anuncios.tabela.status.validacao" />
												</c:when>
												<c:otherwise>
													<fmt:message key="vendas.meus.anuncios.tabela.status.inativo" />
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</tbody>
							</table>
							<p>
								<a href="<c:url value="/anuncio/tela/alterar/${anuncio.chave}" />" id="" class="btn btn-primary" role="button"><fmt:message key="vendas.meus.anuncios.tabela.btn.alterar" /></a>
							</p>
						</div>
					</div>
				</div>
			<c:if test="${((cont.count) % 4) == 0 }">
				</div>
			</c:if>
		</c:forEach>
		<c:if test="${(fn:length(anuncioList) % 4) != 0 }">
			</div>
		</c:if>
		<!-- row-->
	</div>
</section>
