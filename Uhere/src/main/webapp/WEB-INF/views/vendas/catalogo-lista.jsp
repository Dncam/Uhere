<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="cti" uri="/WEB-INF/tag/ConvertToImage.tld"%>

<div class="col-md-5 col-md-offset-2">
  <div class="col-sm-12 col-md-12">
  </div>
  <c:forEach items="${listAnuncios}" var="anuncio">
	<c:url var="detalhes" value="/anuncio/pesquisa/catalogo/detalhe">
		<c:param name="anuncio" value="${anuncio.chave}"></c:param>
	</c:url>
	<div class="col-sm-12 col-md-12">
	  <div class="thumbnail">
	    <p class="faixa-tipo-de-leilao compra">${anuncio.tblVeiculo.tblMarca.descricao}</p>
	    <c:forEach items="${anuncio.tblVeiculo.fotos}" var="foto" end="0">
	    	<img src="data:image/jpeg;base64,<cti:image vImagem="${foto.value}" />" alt="carro" width="400" height="400">
	    </c:forEach>
	    <div class="caption">
	      <h3><c:out value="${anuncio.tblVeiculo.tblMarca.descricao}" /></h3>
	      <p><c:out value="${anuncio.tblVeiculo.tblModelo.descricao}" /></p> 
	      <table class="table">
	        <tr>
	          <td><p class="icon-valor"><fmt:formatNumber type="currency"  value="${anuncio.precoInicial}"/></p></td>
	          <td><p class="icon-cor"><c:out value="${anuncio.tblVeiculo.tblCor.descricao}" /></p></td>
	        </tr>
	        <tr>
	          <td><p class="icon-cambio"><c:out value="${anuncio.tblVeiculo.tblCambio.descricao}" /></p></td>
	          <td><p class="icon-ano-fabrica"><c:out value="${anuncio.tblVeiculo.anoFabricacao}" /></p></td>
	        </tr>
	      </table>
	      <a href="${detalhes}" class="btn btn-primary" role="button"><fmt:message key="pesquisa.resultado.ver"/></a>
	    </div>
	  </div>
	</div>
  </c:forEach>
</div>