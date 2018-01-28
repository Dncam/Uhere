<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- URL -->
<c:url var="l_pesquisar" value="/anuncio/pesquisa/busca/avancada" />
<input type="hidden" value="<c:url value="/estrutura/modelos" />" id="l_getmodelos" />

<!-- MODAL PESQUISA AVANÇADA -->
<form action="${l_pesquisar}" method="POST" >
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h3 class="modal-title"><fmt:message key="home.pequisa.avancada.pesquisa" />
		</h3>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="col-md-4 col-sm-12">
				<p>
					<fmt:message key="home.pequisa.avancada.dados.veiculo" />
				</p>
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-primary" id="id_location">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseOne"
									aria-expanded="false" aria-controls="collapseOne"> 
									<fmt:message key="home.pequisa.avancada.localizacao" />
								</a>
							</h4>
							<span class="icon-check" id="icon-check"></span>
						</div>
						<div id="collapseOne" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<div class="form-group">
									<div class="col-sm-12 col-xs-12">
										<input name="localizacao" type="text" placeholder="<fmt:message key="home.pequisa.avancada.localizacao.exemplo"/>">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-primary" id="id_new_or_used">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo"> 
									<fmt:message key="home.pequisa.avancada.novo.usado" />
								</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
								<div class="form-group">
									<div class="col-sm-12 col-xs-12">
										<label class="radio-inline"> <input name="uso" type="radio" id="novo" value="NOVO"><fmt:message	key="home.pequisa.avancada.novo" /></label> 
										<label class="radio-inline"> <input name="uso" type="radio" id="usado" value="USADO"><fmt:message	key="home.pequisa.avancada.usado" /></label>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree"> <fmt:message key="home.pequisa.avancada.selecione.veiculo" />
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">

								<div class="form-group">
									<div class="col-sm-12 col-xs-12 marcas">
										<select id="marca" name="tblMarca.chave" class="form-control">
											<option value="0"><fmt:message key="home.pequisa.avancada.marca" /></option>
											<c:forEach items="${listMarcas}" var="marca">
												<option value="${marca.chave}" label="${marca.descricao}" />
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<select name="tblModelo.chave" class="form-control" id="id_modelo">
											<option value="0" disabled selected><fmt:message key="home.pequisa.avancada.modelo" /></option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-12">
										<select name="anoMinimo" class="form-control">
											<option value="" disabled selected><fmt:message key="home.pequisa.avancada.ano_minimo" /></option>
											<c:forEach items="${listMinYear}" var="vMinYear">
												<option value="${vMinYear}" label="${vMinYear}" />
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-12">
										<select name="anoMaximo" class="form-control">
											<option value="" disabled selected><fmt:message	key="home.pequisa.avancada.ano_maximo" /></option>
											<c:forEach items="${listMaxYear}" var="vMaxYear">
												<option value="${vMaxYear}" label="${vMaxYear}" />
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingFour">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour"> 
									<fmt:message key="home.pequisa.avancada.preco" />
								</a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingFour">
							<div class="panel-body">

								<div class="form-group">
									<div class="col-sm-12">
										<label><fmt:message key="home.pequisa.avancada.preco.minimo" /></label> <input name="precoMinimo" type="text" placeholder="Ex.: 1.000">
									</div>
									<div class="col-sm-12">
										<label><fmt:message	key="home.pequisa.avancada.preco.maximo" /></label> <input name="precoMaximo" type="text" placeholder="Ex.: 600.000">
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingFive">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseFive"
									aria-expanded="false" aria-controls="collapseFive"> <fmt:message key="home.pequisa.avancada.quilometragem" />
								</a>
							</h4>
						</div>
						<div id="collapseFive" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingFive">
							<div class="panel-body">
								<div class="form-group">
									<div class="col-sm-12">
										<label>
											<fmt:message key="home.pequisa.avancada.quilometragem.maximo" />
										</label> 
										<input name="quilometragemMinima" type="text" placeholder="Ex.: 0">
									</div>
									<div class="col-sm-12">
										<label>
											<fmt:message key="home.pequisa.avancada.quilometragem.minimo" />
										</label> 
										<input name="quilometragemMaxima" type="text" placeholder="Ex.: 30.000">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingSix">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseSix"
									aria-expanded="false" aria-controls="collapseSix"> <fmt:message key="home.pequisa.avancada.final.placa" />
								</a>
							</h4>
						</div>

						<div id="collapseSix" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingSix">
							<div class="panel-body">

								<div class="form-group">
									<div class="col-sm-12 col-xs-12">
										<label class="checkbox-inline"> 
											<input type="checkbox" name="placa" id="1-e-2" value="1;2">
											<fmt:message key="home.pequisa.avancada.final.placa.1e2" />
										</label>
									</div>
									<div class="col-sm-12 col-xs-12">
										<label class="checkbox-inline"> 
											<input type="checkbox" name="placa" id="3-e-4" value="3;4"> 
											<fmt:message key="home.pequisa.avancada.final.placa.3e4" />
										</label>
									</div>
									<div class="col-sm-12 col-xs-12">
										<label class="checkbox-inline"> 
											<input type="checkbox" name="placa" id="5-e-6" value="5;6"> 
											<fmt:message key="home.pequisa.avancada.final.placa.5e6" />
										</label>
									</div>
									<div class="col-sm-12 col-xs-12">
										<label class="checkbox-inline"> 
											<input type="checkbox" name="placa" id="7-e-8" value="7;8">
											<fmt:message key="home.pequisa.avancada.final.placa.7e8" />
										</label>
									</div>
									<div class="col-sm-12 col-xs-12">
										<label class="checkbox-inline"> 
											<input type="checkbox" name="placa" id="9-e-0" value="9;0"> 
											<fmt:message key="home.pequisa.avancada.final.placa.9e0" />
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-12">

				<p><fmt:message key="home.pequisa.avancada.caracteristicas.veiculo"/></p>
				<div class="panel-group" id="accordionTwo" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingSeven">
							<h4 class="panel-title">
								<a role="button" data-toggle="collapse"
									data-parent="#accordionTwo" href="#collapseSeven"
									aria-expanded="false" aria-controls="collapseSeven"> <fmt:message
										key="home.pequisa.avancada.cambio" />
								</a>
							</h4>
						</div>
						<div id="collapseSeven" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingSeven">
							<div class="panel-body">
								<div class="form-group">
									<c:forEach items="${listCambios}" var="cambio" varStatus="cont">
										<div class="col-sm-12 col-xs-12">
											<label class="checkbox-inline"> 
												<input type="checkbox" name="tblCambio[${cont.index}].chave" id="1-e-2" value="${cambio.chave}"> 
												<c:out value="${cambio.descricao}" />
											</label>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingEight">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordionTwo" href="#collapseEight"
									aria-expanded="false" aria-controls="collapseEight"> 
									<fmt:message key="home.pequisa.avancada.combustivel" />
								</a>
							</h4>
						</div>
						<div id="collapseEight" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingEight">
							<div class="panel-body">
								<div class="form-group">
									<c:forEach items="${listCombustiveis}" var="combustivel" varStatus="cont">
										<div class="col-sm-12 col-xs-12">
											<label class="checkbox-inline"> 
												<input type="checkbox" name="tblCombustivel[${cont.index}].chave" id="1-e-2" value="${combustivel.chave}">
												<c:out value="${combustivel.descricao}" />
											</label>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingNine">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordionTwo" href="#collapseNine"
									aria-expanded="false" aria-controls="collapseNine"> 
									<fmt:message key="home.pequisa.avancada.opcionais" />
								</a>
							</h4>
						</div>
						<div id="collapseNine" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingNine">
							<div class="panel-body">
								<c:forEach items="${listOpcionais}" var="opcionais" varStatus="cont">
									<div class="form-group">
										<div class="col-sm-12 col-xs-12">
											<label class="checkbox-inline"> 
												<input type="checkbox" name="tblOpcionais[${cont.index}].chave" id="1-e-2" value="${opcionais.chave}"> 
												<c:out value="${opcionais.descricao}" />
											</label>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingTen">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordionTwo" href="#collapseTen"
									aria-expanded="false" aria-controls="collapseTen"> 
									<fmt:message key="home.pequisa.avancada.numero.portas" />
								</a>
							</h4>
						</div>
						<div id="collapseTen" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingTen">
							<div class="panel-body">
								<div class="form-group">
									<div class="col-sm-12 col-xs-12">
										<label class="checkbox-inline"> 
											<input type="checkbox" name="numPortas" id="1-e-2" value="2">2
										</label>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12 col-xs-12">
										<label class="checkbox-inline"> 
											<input type="checkbox" name="numPortas" id="1-e-2" value="3">3
										</label>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12 col-xs-12">
										<label class="checkbox-inline"> 
											<input type="checkbox" name="numPortas" id="1-e-2" value="4">4
										</label>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12 col-xs-12">
										<label class="checkbox-inline"> 
											<input type="checkbox" name="numPortas" id="1-e-2" value="5">5
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingEleven">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordionTwo" href="#collapseEleven"
									aria-expanded="false" aria-controls="collapseEleven"> <fmt:message
										key="home.pequisa.avancada.cor" />
								</a>
							</h4>
						</div>
						<div id="collapseEleven" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingEleven">
							<div class="panel-body">
								<c:forEach items="${listCor}" var="cor" varStatus="cont">
									<div class="form-group">
										<div class="col-sm-12 col-xs-12">
											<label class="checkbox-inline"> 
												<input type="checkbox" name="tblCor[${cont.index}].chave" id="1-e-2" value="${cor.chave}"> 
												<c:out value="${cor.descricao}" />
											</label>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingTwelve">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordionTwo" href="#collapseTwelve"
									aria-expanded="false" aria-controls="collapseTwelve">
									<fmt:message key="home.pequisa.avancada.blindagem" />
								</a>
							</h4>
						</div>
						<div id="collapseTwelve" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwelve">
							<div class="panel-body">
								<div class="form-group">
									<div class="col-sm-12 col-xs-12">
										<label class="radio-inline"> 
											<input name="blindagem" type="radio" id="novo" value="0">
											<fmt:message key="home.pequisa.avancada.blindagem.nao" />
										</label> 
										<label class="radio-inline"> 
											<input name="blindagem" type="radio" id="novo" value="1">
											<fmt:message key="home.pequisa.avancada.blindagem.sim" />
										</label> 
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingThirteen">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordionTwo" href="#collapseThirteen"
									aria-expanded="false" aria-controls="collapseThirteen"> 
									<fmt:message key="home.pequisa.avancada.documentacao" />
								</a>
							</h4>
						</div>
						<div id="collapseThirteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThirteen">
							<div class="panel-body">
								<c:forEach items="${listDocumentacoes}" var="documentacao" varStatus="cont">
									<div class="form-group">
										<div class="col-sm-12 col-xs-12">
											<label class="checkbox-inline"> 
												<input type="checkbox" name="tblDocumentacao[${cont.index}].chave" id="1-e-2" value="${documentacao.chave}"> 
												<c:out value="${documentacao.descricao}" />
											</label>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingFourteen">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordionTwo" href="#collapseFourteen"
									aria-expanded="false" aria-controls="collapseFourteen"> 
									<fmt:message key="home.pequisa.avancada.carroceria" />
								</a>
							</h4>
						</div>
						<div id="collapseFourteen" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingFourteen">
							<div class="panel-body">
								<c:forEach items="${listCarroceria}" var="carroceria" varStatus="cont">
									<div class="form-group">
										<div class="col-sm-12 col-xs-12">
											<label class="checkbox-inline"> 
												<input type="checkbox" name="tblCarroceria[${cont.index}].chave" id="1-e-2" value="${carroceria.chave}"> 
												<c:out value="${carroceria.descricao}" />
											</label>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingFiveteen">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordionTwo" href="#collapseFiveteen"
									aria-expanded="false" aria-controls="collapseFiveteen"> 
									<fmt:message key="home.pequisa.avancada.necessidade" />
								</a>
							</h4>
						</div>
						<div id="collapseFiveteen" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingFiveteen">
							<div class="panel-body">
								<c:forEach items="${listNecessidade}" var="necessidade" varStatus="cont">
									<div class="form-group">
										<div class="col-sm-12 col-xs-12">
											<label class="checkbox-inline"> 
												<input type="checkbox" name="tblNecessidade[${cont.index}].chave" id="1-e-2" value="${necessidade.chave }"> 
												<c:out value="${necessidade.descricao}" />
											</label>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-12">
				<p>
					<fmt:message key="home.pequisa.avancada.anunciante" />
				</p>
				<div class="panel-group" id="accordionSixteen" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingSixteen">
							<h4 class="panel-title">
								<a role="button" data-toggle="collapse"
									data-parent="#accordionSixteen" href="#collapseSixteen"
									aria-expanded="false" aria-controls="collapseSixteen"> <fmt:message
										key="home.pequisa.avancada.tipo.anuncio" />
								</a>
							</h4>
						</div>
						<div id="collapseSixteen" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingSixteen">
							<div class="panel-body">
								<c:forEach items="${listTipoAnuncio}" var="tipoAnuncio" varStatus="cont">
									<div class="form-group">
										<div class="col-sm-12 col-xs-12">
											<label class="checkbox-inline"> 
												<input type="checkbox" name="tblTipoAnuncio[${cont.index}].chave" id="1-e-2" value="${tipoAnuncio.chave}" checked> 
												<c:out value="${tipoAnuncio.descricao}" />
											</label>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading" role="tab" id="headingSeventeen">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordionSeventeen" href="#collapseSeventeen"
									aria-expanded="false" aria-controls="collapseSeventeen">
									<fmt:message key="home.pequisa.avancada.negociacao" />
								</a>
							</h4>
						</div>
						<div id="collapseSeventeen" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingSeventeen">
							<div class="panel-body">
								<div class="form-group">
									<div class="col-sm-12 col-xs-12">
										<label class="checkbox-inline"> 
											<input type="checkbox" name="bPesquisaAvancada.troca" id="1-e-2" value="1"> 
											<fmt:message key="home.pequisa.avancada.negociacao.troca" />
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary">
			<fmt:message key="home.pequisa.avancada.pesquisar" />
		</button>
	</div>
</form>
<script type="text/javascript" src="<c:url value="/resources/js/jUhereAuto.js"/>"></script>
<!-- FINAL DA PESQUISA AVANÃ‡ADA -->