<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<%@ taglib prefix="ucti" uri="/WEB-INF/tag/ConvertToImage.tld"%>
<%@ taglib prefix="ufd" uri="/WEB-INF/tag/findFieldValue.tld"%>

<input type="hidden" value="<c:url value="/estrutura/cidades" />" id="l_getcidades" />
<input type="hidden" value="<c:url value="/estrutura/modelos" />" id="l_getmodelos" />

<section id="minhas-vendas-area" class="leilao-area">
	<div class="col-sm-12 col-md-12 faixa-localizadora">
		<div class="container">
			<h2 style="margin: 0px;">
				<fmt:message key="vendas.criar.anuncio.titulo" />
			</h2>
			<p>
				<fmt:message key="vendas.criar.anuncio.subtitulo" />
			</p>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="modal-body">
				<spring:hasBindErrors name="formCadastrarAnuncio">           
	            <c:forEach var="error" items="${errors.allErrors}">
	            	<font color="red">
	            		<spring:message message="${error}"/>
						<br/>
					</font>
				</c:forEach>
				</spring:hasBindErrors>
				<form method="post" action="<c:url value="/anuncio/cadastrar/"/>" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-4 col-sm-12">
							<p>
								<fmt:message key="vendas.criar.anuncio.tab1.titulo" />
							</p>
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingZero">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseZero"
												aria-expanded="false" aria-controls="collapseZero">
												<fmt:message key="vendas.criar.anuncio.tab1.link.renavam" />
											</a>
										</h4>
									</div>
									<div id="collapseZero" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingZero">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12">
													<label for="renavam" class="control-label"><fmt:message key="vendas.criar.anuncio.tab1.label.renavam" /></label> 
													<input class="numericField" ${alterar ? 'readonly' : ' '} id="renavam" name="tblVeiculo.renavam" type="text" placeholder="Ex.: 1000" value="${formCadastrarAnuncio.tblVeiculo.renavam}">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary" id="id_location">
									<div class="panel-heading" role="tab" id="headingOne">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
												aria-expanded="false" aria-controls="collapseOne"> 
												<fmt:message key="vendas.criar.anuncio.tab1.link.localizacao" />
											</a>
										</h4>
										<span class="icon-check" id="icon-check"></span>
									</div>
									<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<select id="estado" name="tblUf.chave" class="form-control" >
								                      	<option disabled selected><fmt:message key="vendas.criar.anuncio.tab1.placeholder.estado" /></option>
								                      	<c:forEach items="${listEstado}" var="uf">
															<option value="${uf.chave}" label="${uf.descricao}" ${formCadastrarAnuncio.tblUf.chave == uf.chave  ? 'selected' : ' '}/>
														</c:forEach>
								                    </select>
												</div>
											</div><br>
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<select id="cidade" name="tblCidade.chave" class="form-control" >
								                      	<option  disabled selected><fmt:message key="vendas.criar.anuncio.tab1.placeholder.cidade" /></option>
								                      	<c:forEach items="${listCidade}" var="cidade">
															<option value="${cidade.chave}" label="${cidade.descricao}" ${formCadastrarAnuncio.tblCidade.chave == cidade.chave  ? 'selected' : ' '}/>
														</c:forEach>
								                    </select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary" id="id_new_or_used">
									<div class="panel-heading" role="tab" id="headingTwo">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"
												aria-expanded="false" aria-controls="collapseTwo"> 
												<fmt:message key="vendas.criar.anuncio.tab1.link.novoUsado" />
											</a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="radio-inline"> 
														<input name="tblVeiculo.uso" type="radio" id="novo" value="NOVO" ${formCadastrarAnuncio.tblVeiculo.uso == 'NOVO' || formCadastrarAnuncio.tblVeiculo.uso == null ? 'checked' : ' ' }><fmt:message key="vendas.criar.anuncio.tab1.radio.novo" />
													</label> 
													<label class="radio-inline"> 
														<input name="tblVeiculo.uso" type="radio" id="usado" value="USADO" ${formCadastrarAnuncio.tblVeiculo.uso == 'USADO' ? 'checked' : ' ' }><fmt:message key="vendas.criar.anuncio.tab1.radio.usado" />
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
	
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingThree">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree"
												aria-expanded="false" aria-controls="collapseThree">
												<fmt:message key="vendas.criar.anuncio.tab1.link.modelo.marca.ano" /> </a>
										</h4>
									</div>
									<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12 marcas">
													<c:if test="${alterar}">
														<input type="hidden" name="tblVeiculo.tblMarca.chave" value="${formCadastrarAnuncio.tblVeiculo.tblMarca.chave}">
													</c:if>
													<select id="marca" name="tblVeiculo.tblMarca.chave" class="form-control" ${alterar ? 'disabled' : ' '}>
														<option value="0" disabled selected><fmt:message key="vendas.criar.anuncio.tab1.combobox.marca" /></option>
														<c:forEach items="${listMarcas}" var="marca">
															<option value="${marca.chave}" label="${marca.descricao}" ${formCadastrarAnuncio.tblVeiculo.tblMarca.chave == marca.chave  ? 'selected' : ' '}/>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<c:if test="${alterar}">
														<input type="hidden" name="tblVeiculo.tblModelo.chave" value="${formCadastrarAnuncio.tblVeiculo.tblModelo.chave}">
													</c:if>
													<select name="tblVeiculo.tblModelo.chave" class="form-control" id="id_modelo" ${alterar ? 'disabled' : ' '}>
														<option value="0" disabled selected><fmt:message key="vendas.criar.anuncio.tab1.combobox.modelo" /></option>
														<c:forEach items="${listModelo}" var="modelo">
															<option value="${modelo.chave}" label="${modelo.descricao}" ${formCadastrarAnuncio.tblVeiculo.tblModelo.chave == modelo.chave  ? 'selected' : ' '}/>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<c:if test="${alterar}">
														<input type="hidden" name="tblVeiculo.anoFabricacao" value="${formCadastrarAnuncio.tblVeiculo.anoFabricacao}">
													</c:if>
													<select name="tblVeiculo.anoFabricacao" class="form-control"  ${alterar ? 'disabled' : ' '}>
														<option value="" disabled selected><fmt:message key="vendas.criar.anuncio.tab1.combobox.ano.fabricacao" /></option>
														<c:forEach items="${listAnoFab}" var="vAnoFab">
															<option value="${vAnoFab}" label="${vAnoFab}" ${formCadastrarAnuncio.tblVeiculo.anoFabricacao == vAnoFab  ? 'selected' : ' '}/>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<c:if test="${alterar}">
														<input type="hidden" name="tblVeiculo.anoModelo" value="${formCadastrarAnuncio.tblVeiculo.anoModelo}">
													</c:if>
													<select name="tblVeiculo.anoModelo" class="form-control" ${alterar ? 'disabled' : ' '}>
														<option value="" disabled selected><fmt:message key="vendas.criar.anuncio.tab1.combobox.ano.modelo" /></option>
														<c:forEach items="${listAnoMod}" var="vAnoMod">
															<option value="${vAnoMod}" label="${vAnoMod}" ${formCadastrarAnuncio.tblVeiculo.anoModelo == vAnoMod  ? 'selected' : ' '}/>
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
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour"
												aria-expanded="false" aria-controls="collapseFour">
												<fmt:message key="vendas.criar.anuncio.tab1.link.valor.venda" />
											</a>
										</h4>
									</div>
									<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12">
													<label for="precoInicial" class="control-label"><fmt:message key="vendas.criar.anuncio.tab1.label.valor" /> :</label> 
													<input class="numericField" id="precoInicial" name="precoInicial" type="text" placeholder="Ex.: 1.000" value="<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${formCadastrarAnuncio.precoInicial}"/>">
												</div>
												<div class="col-sm-12">
													<label for="precoFinal" class="control-label"><fmt:message key="vendas.criar.anuncio.tab1.label.valor.minimo" /> :</label> 
													<input class="numericField" id="precoFinal" name="precoFinal" type="text" placeholder="Ex.: 600.000" value="<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${formCadastrarAnuncio.precoFinal}"/>">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingFive">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive"
												aria-expanded="false" aria-controls="collapseFive">
												<fmt:message key="vendas.criar.anuncio.tab1.link.quilometragem" /> 
											</a>
										</h4>
									</div>
									<div id="collapseFive" class="panel-collapse collapse"
										role="tabpanel" aria-labelledby="headingFive">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12">
													<label><fmt:message key="vendas.criar.anuncio.tab1.label.quilometragem" /> :</label> 
													<input class="numericField" name="tblVeiculo.quilometragem" type="text" placeholder="Ex.: 0" value="${formCadastrarAnuncio.tblVeiculo.quilometragem}">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingSix">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix"
												aria-expanded="false" aria-controls="collapseSix"> 
												<fmt:message key="vendas.criar.anuncio.tab1.link.placa" />
											</a>
										</h4>
									</div>
									<div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.placa" value="1" ${formCadastrarAnuncio.tblVeiculo.placa == 1 || formCadastrarAnuncio.tblVeiculo.placa == null ? 'checked' : ' ' }> 1
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.placa" value="2" ${formCadastrarAnuncio.tblVeiculo.placa == 2 ? 'checked' : ' ' }> 2
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.placa" value="3" ${formCadastrarAnuncio.tblVeiculo.placa == 3 ? 'checked' : ' ' }> 3
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.placa" value="4" ${formCadastrarAnuncio.tblVeiculo.placa == 4 ? 'checked' : ' ' }> 4
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.placa" value="5" ${formCadastrarAnuncio.tblVeiculo.placa == 5 ? 'checked' : ' ' }> 5
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.placa" value="6" ${formCadastrarAnuncio.tblVeiculo.placa == 6 ? 'checked' : ' ' }> 6
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.placa" value="7" ${formCadastrarAnuncio.tblVeiculo.placa == 7 ? 'checked' : ' ' }> 7
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.placa" value="8" ${formCadastrarAnuncio.tblVeiculo.placa == 8 ? 'checked' : ' ' }> 8
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.placa" value="9" ${formCadastrarAnuncio.tblVeiculo.placa == 9 ? 'checked' : ' ' }> 9
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.placa" value="0" ${formCadastrarAnuncio.tblVeiculo.placa == 0 ? 'checked' : ' ' }> 0
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-12">
							<p><fmt:message key="vendas.criar.anuncio.tab2.titulo" /></p>
							<div class="panel-group" id="accordionTwo" role="tablist" aria-multiselectable="true">
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingSeven">
										<h4 class="panel-title">
											<a role="button" data-toggle="collapse"	data-parent="#accordionTwo" href="#collapseSeven"
												aria-expanded="false" aria-controls="collapseSeven">
												<fmt:message key="vendas.criar.anuncio.tab2.link.cambio" />
											 </a>
										</h4>
									</div>
									<div id="collapseSeven" class="panel-collapse collapse"	role="tabpanel" aria-labelledby="headingSeven">
										<div class="panel-body">
											<div class="form-group">
												<c:forEach items="${listCambios}" var="cambio" varStatus="cont">
													<div class="col-sm-12 col-xs-12">
														<label class="checkbox-inline"> 
															<input type="radio" name="tblVeiculo.tblCambio.chave" value="${cambio.chave}" ${formCadastrarAnuncio.tblVeiculo.tblCambio.chave == cambio.chave  ? 'checked' : ' '}> 
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
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseEight"
												aria-expanded="false" aria-controls="collapseEight">
												<fmt:message key="vendas.criar.anuncio.tab2.link.combustivel" /> 
											</a>
										</h4>
									</div>
									<div id="collapseEight" class="panel-collapse collapse"	role="tabpanel" aria-labelledby="headingEight">
										<div class="panel-body">
											<div class="form-group">
												<c:forEach items="${listCombustiveis}" var="combustivel" varStatus="cont">
													<div class="col-sm-12 col-xs-12">
														<label class="checkbox-inline"> 
															<input type="radio" name="tblVeiculo.tblCombustivel.chave" value="${combustivel.chave}" ${formCadastrarAnuncio.tblVeiculo.tblCombustivel.chave == combustivel.chave  ? 'checked' : ' '}>
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
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseNine"
												aria-expanded="false" aria-controls="collapseNine">
												<fmt:message key="vendas.criar.anuncio.tab2.link.opcionais" />
											</a>
										</h4>
									</div>
									<div id="collapseNine" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingNine">
										<div class="panel-body">
											<c:forEach items="${listOpcionais}" var="opcionais" varStatus="cont">
												<div class="form-group">
													<div class="col-sm-12 col-xs-12">
														<label class="checkbox-inline">
															<ufd:contains var="check" field="chave" keyFind="${opcionais.chave}" arrayFind="${formCadastrarAnuncio.tblVeiculo.tblOpcionais}"/>
															<input type="checkbox" name="tblVeiculo.tblOpcionais[${cont.index}].chave" value="${opcionais.chave}" ${check == true ? 'checked' : ' '}> 
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
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseTen"
												aria-expanded="false" aria-controls="collapseTen">
												<fmt:message key="vendas.criar.anuncio.tab2.link.portas" />
											</a>
										</h4>
									</div>
									<div id="collapseTen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTen">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input	type="radio" name="tblVeiculo.portas" value="2" ${formCadastrarAnuncio.tblVeiculo.portas == 2 ? 'checked' : ' ' }> 2
													</label>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input	type="radio" name="tblVeiculo.portas" value="3" ${formCadastrarAnuncio.tblVeiculo.portas == 3 ? 'checked' : ' ' }> 3
													</label>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.portas" value="4" ${formCadastrarAnuncio.tblVeiculo.portas == 4 || formCadastrarAnuncio.tblVeiculo.portas == null ? 'checked' : ' ' }> 4
													</label>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.portas" value="5" ${formCadastrarAnuncio.tblVeiculo.portas == 5 ? 'checked' : ' ' }> 5
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingEleven">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseEleven"
												aria-expanded="false" aria-controls="collapseEleven">
												<fmt:message key="vendas.criar.anuncio.tab2.link.cor" />
											</a>
										</h4>
									</div>
									<div id="collapseEleven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEleven">
										<div class="panel-body">
											<c:forEach items="${listCor}" var="cor" varStatus="cont">
												<div class="form-group">
													<div class="col-sm-12 col-xs-12">
														<label class="checkbox-inline"> 
															<input type="radio" name="tblVeiculo.tblCor.chave" value="${cor.chave}" ${formCadastrarAnuncio.tblVeiculo.tblCor.chave == cor.chave ? 'checked' : ' ' }> 
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
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseTwelve"
												aria-expanded="false" aria-controls="collapseTwelve">
												<fmt:message key="vendas.criar.anuncio.tab2.link.blindagem" />
											</a>
										</h4>
									</div>
									<div id="collapseTwelve" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwelve">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.blindagem" value="1" ${formCadastrarAnuncio.tblVeiculo.blindagem == true ? 'checked' : ' ' }> <fmt:message key="vendas.criar.anuncio.tab2.radio.blindagem.sim" />
													</label>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
														<input type="radio" name="tblVeiculo.blindagem" value="0" ${formCadastrarAnuncio.tblVeiculo.blindagem == false || formCadastrarAnuncio.tblVeiculo.blindagem == null ? 'checked' : ' ' }> <fmt:message key="vendas.criar.anuncio.tab2.radio.blindagem.nao" />
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingThirteen">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseThirteen"
												aria-expanded="false" aria-controls="collapseThirteen">
												<fmt:message key="vendas.criar.anuncio.tab2.link.documentacao" />
											</a>
										</h4>
									</div>
									<div id="collapseThirteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThirteen">
										<div class="panel-body">
											<c:forEach items="${listDocumentacoes}" var="documentacao" varStatus="cont">
												<div class="form-group">
													<div class="col-sm-12 col-xs-12">
														<label class="checkbox-inline"> 
															<input type="radio" name="tblVeiculo.tblDocumentacao.chave" value="${documentacao.chave}" ${formCadastrarAnuncio.tblVeiculo.tblDocumentacao.chave == documentacao.chave ? 'checked' : ' ' }> 
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
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseFourteen"
												aria-expanded="false" aria-controls="collapseFourteen">
												<fmt:message key="vendas.criar.anuncio.tab2.link.carroceria" /> 
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
															<input type="radio" name="tblVeiculo.tblCarroceria.chave" value="${carroceria.chave}" ${formCadastrarAnuncio.tblVeiculo.tblCarroceria.chave == carroceria.chave ? 'checked' : ' ' }> 
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
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseFiveteen"
												aria-expanded="false" aria-controls="collapseFiveteen">
												<fmt:message key="vendas.criar.anuncio.tab2.link.necessidade" /> 
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
															<input type="radio" name="tblVeiculo.tblNecessidade.chave" value="${necessidade.chave }" ${formCadastrarAnuncio.tblVeiculo.tblNecessidade.chave == necessidade.chave ? 'checked' : ' ' }> 
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
							<p><fmt:message key="vendas.criar.anuncio.tab3.titulo" /> </p>
							<div class="panel-group" id="accordionSixteen" role="tablist" aria-multiselectable="true">
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingSixteen">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionSixteen" href="#collapseSixteen"
												aria-expanded="false" aria-controls="collapseSixteen">
												<fmt:message key="vendas.criar.anuncio.tab3.link.negociacao" />
											</a>
										</h4>
									</div>
									<div id="collapseSixteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSixteen">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
													<input type="checkbox" name="troca"	value="1" ${formCadastrarAnuncio.troca == true ? 'checked' : ' '}><fmt:message key="vendas.criar.anuncio.tab3.checkbox.troca" />
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingSeventeen">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionSeventeen" href="#collapseSeventeen"
												aria-expanded="false" aria-controls="collapseSeventeen">
												<fmt:message key="vendas.criar.anuncio.tab3.link.leilao" />
											</a>
										</h4>
									</div>
									<div id="collapseSeventeen" class="panel-collapse collapse"	role="tabpanel" aria-labelledby="headingSeventeen">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline"> 
													<input type="checkbox" name="leilao" value="1" ${formCadastrarAnuncio.leilao == true || formCadastrarAnuncio.leilao == null ? 'checked' : ' '}><fmt:message key="vendas.criar.anuncio.tab3.checkbox.leilao" />
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingHeighteen">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionHeighteen" href="#collapseHeighteen"
												aria-expanded="false" aria-controls="collapseHeighteen">
												<fmt:message key="vendas.criar.anuncio.tab3.link.adicionais" />
											</a>
										</h4>
									</div>
									<div id="collapseHeighteen" class="panel-collapse collapse"	role="tabpanel" aria-labelledby="headingHeighteen">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<textarea rows="5" cols="40" name="descricao" placeholder="<fmt:message key="vendas.criar.anuncio.tab3.placeholder.adicionais" />">${not empty fn:trim(formCadastrarAnuncio.descricao) ? formCadastrarAnuncio.descricao : ''}</textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-12 col-sm-12">
								<fieldset>
									<legend><fmt:message key="vendas.criar.anuncio.tab3.imagem" /></legend>
								</fieldset>
								<div class="image-upload">
								    <label for="file-input1">
								        <img src="<c:choose><c:when test="${formCadastrarAnuncio.tblVeiculo.fotos[0] != null && fn:length(formCadastrarAnuncio.tblVeiculo.fotos[0]) > 0}">data:image/jpeg;base64,<ucti:image vImagem="${formCadastrarAnuncio.tblVeiculo.fotos[0]}"/></c:when><c:otherwise>http://s3.postimg.org/mjzvuzi5b/uploader_image.png</c:otherwise></c:choose>" id="img1" />
								    </label>
								    <label for="file-input2">
								        <img src="<c:choose><c:when test="${formCadastrarAnuncio.tblVeiculo.fotos[1] != null && fn:length(formCadastrarAnuncio.tblVeiculo.fotos[1]) > 0}">data:image/jpeg;base64,<ucti:image vImagem="${formCadastrarAnuncio.tblVeiculo.fotos[1]}"/></c:when><c:otherwise>http://s3.postimg.org/mjzvuzi5b/uploader_image.png</c:otherwise></c:choose>" id="img2" />
								    </label>
								    <label for="file-input3">
								        <img src="<c:choose><c:when test="${formCadastrarAnuncio.tblVeiculo.fotos[2] != null && fn:length(formCadastrarAnuncio.tblVeiculo.fotos[2]) > 0}">data:image/jpeg;base64,<ucti:image vImagem="${formCadastrarAnuncio.tblVeiculo.fotos[2]}"/></c:when><c:otherwise>http://s3.postimg.org/mjzvuzi5b/uploader_image.png</c:otherwise></c:choose>" id="img3" />
								    </label>
								    <label for="file-input4">
								        <img src="<c:choose><c:when test="${formCadastrarAnuncio.tblVeiculo.fotos[3] != null && fn:length(formCadastrarAnuncio.tblVeiculo.fotos[3]) > 0}">data:image/jpeg;base64,<ucti:image vImagem="${formCadastrarAnuncio.tblVeiculo.fotos[3]}"/></c:when><c:otherwise>http://s3.postimg.org/mjzvuzi5b/uploader_image.png</c:otherwise></c:choose>" id="img4" />
								    </label>
								    <input id="file-input1" type="file" accept="image/jpeg" name="0" />
								    <input id="file-input2" type="file" accept="image/jpeg" name="1" />
								    <input id="file-input3" type="file" accept="image/jpeg" name="2" />
								    <input id="file-input4" type="file" accept="image/jpeg" name="3" />							    									
								</div>
							</div>
						</div>
	
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary"><fmt:message key="vendas.criar.anuncio.btn" /></button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<style>
<!--
.image-upload > input
{
    display: none;
}

.image-upload img
{
    width: 80px;
    height:80px;
    cursor: pointer;
    border: 1px solid #fbab2e;
}
-->
</style>
<script type="text/javascript">
$( document ).ready(function() {
	carregarImagem($('#file-input1'));
});
</script>
