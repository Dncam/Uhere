<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url var="l_pesquisar" value="/anuncio/pesquisa/busca/avancada" />
<input type="hidden" value="<c:url value="/estrutura/modelos" />" id="l_getmodelos" />
<div class="col-md-2 filtro ui-widget-content" id="draggable">
        <span class="ico-filtro"></span>
        <h2><fmt:message key="vendas.pesquisa.lateral.titulo" /></h2>
        <form class="form-horizontal" action="${l_pesquisar}" method="POST">
          <div class="form-group">
            <div class="col-sm-12">
              <div class="novo-usado-area">
                <label class="radio-inline">
                  <input type="radio" name="uso" id="novo" value="1" ${bPesquisaAvancada.uso == 'NOVO' ? 'checked' : ''} ><fmt:message	key="vendas.pesquisa.lateral.radio.novo" />
                </label>
                <label class="radio-inline">
                  <input type="radio" name="uso" id="usado" value="0" ${bPesquisaAvancada.uso == 'USADO' ? 'checked' : ''}><fmt:message key="vendas.pesquisa.lateral.radio.usado" />
                </label>
              </div>
              <select name="tblMarca.chave" class="form-control" id="marca">
               	<option value="%" disabled selected><fmt:message key="vendas.pesquisa.lateral.combobox.marca" /></option>
                <c:forEach items="${listMarcas}" var="marca">
					<option value="${marca.chave}" label="${marca.descricao}" ${bPesquisaAvancada.tblMarca.chave == marca.chave ? 'selected' : ''} />
				</c:forEach>
              </select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-12">
              <select name="tblModelo.chave" class="form-control" id="id_modelo">
               <option value="%" disabled selected><fmt:message key="vendas.pesquisa.lateral.combobox.modelo" /></option>
				<c:forEach items="${listModelos}" var="modelo">
					<option value="${modelo.chave}" label="${modelo.descricao}" ${bPesquisaAvancada.tblModelo.chave == modelo.chave ? 'selected' : ''} />
				</c:forEach>
             </select>
           </div>
         </div>
        <div class="form-group">
          <div class="col-sm-12">
           <select name="anoMinimo" class="form-control">
            <option value="" disabled selected><fmt:message key="vendas.pesquisa.lateral.combobox.ano.minimo" /></option>
			<c:forEach items="${listMinYear}" var="vMinYear">
				<option value="${vMinYear}" label="${vMinYear}" ${bPesquisaAvancada.anoMinimo == vMinYear ? 'selected' : ''}/>
			</c:forEach>
          </select>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-12">
         <select name="anoMaximo" class="form-control">
			<option value="" disabled selected><fmt:message key="vendas.pesquisa.lateral.combobox.ano.maximo" /></option>
			<c:forEach items="${listMaxYear}" var="vMaxYear">
				<option value="${vMaxYear}" label="${vMaxYear}" ${bPesquisaAvancada.anoMaximo == vMaxYear ? 'selected' : ''}/>
			</c:forEach>
        </select>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-0 col-sm-12">
        <input type="Text" class="form-control" name="precoMinimo" value="<fmt:formatNumber value="${bPesquisaAvancada.precoMinimo}" type="number" maxFractionDigits = "2" minFractionDigits = "2" groupingUsed="true"/>" placeholder="<fmt:message key="vendas.pesquisa.lateral.placeholder.preco.minimo" />">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-0 col-sm-12">
        <input type="Text" class="form-control" name="precoMaximo" value="<fmt:formatNumber value="${bPesquisaAvancada.precoMaximo}" type="number" maxFractionDigits = "2" minFractionDigits = "2" groupingUsed="true"/>" placeholder="<fmt:message key="vendas.pesquisa.lateral.placeholder.preco.maximo" />">
      </div>
    </div>
	<button type="submit" class="btn btn-primary">
		<fmt:message key="vendas.pesquisa.lateral.btn.pesquisar" />
	</button>
  </form>
</div>