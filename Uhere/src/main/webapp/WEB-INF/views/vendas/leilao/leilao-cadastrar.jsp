<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<spring:url value="/estrutura/cidades" var="url_cidade" />
<spring:url value="/estrutura/modelos" var="url_modelo" />
<spring:url value="/leilao" var="url_post" />
<input type="hidden" value="${url_cidade}" id="l_getcidades" />
<input type="hidden" value="${url_modelo}" id="l_getmodelos" />

<div class="col-sm-12 col-md-12 faixa-localizadora">
	<div class="container">
		<div class="row">
			<h2 style="margin: 0px;">
				<spring:message code="vendas.criar.leilao.titulo" />
			</h2>
			<p>
				<spring:message code="vendas.criar.leilao.subtitulo" />
			</p>
		</div>
	</div>
</div>
<div class="container container-fluid">
	<div class="row">
		<div class="col-md-12 col-sm-12">
			<form:form method="POST" action="${url_post}" commandName="formCadastrarLeilao">
				<fieldset class="scheduler-border col-md-6 col-sm-6">
					<legend class="scheduler-border">
						<spring:message code="vendas.criar.leilao.tab1.titulo" />
					</legend>
					<div class="control-group col-sm-12 coml-md-12">
						<label class="control-label input-label" for="startTime">
							<spring:message code="vendas.criar.leilao.tab1.label.marca" />
						</label>
						<div class="controls bootstrap-timepicker">
							<form:select id="marca" cssClass="form-control" path="tblMarca" multiple="single">
								<spring:message code="vendas.criar.leilao.tab1.combobox.marca" var="lb_msg" />
								<form:option value="0" selected="selected" disabled="disabled" label="${lb_msg}" />
								<form:options items="${listMarcas}" itemValue="chave" itemLabel="descricao" />
							</form:select>
						</div>
					</div>
				</fieldset>
				<fieldset class="scheduler-border col-md-6 col-sm-6">
					<legend class="scheduler-border">
						<spring:message code="vendas.criar.leilao.tab2.titulo" />
					</legend>
					<div class="control-group col-sm-12 coml-md-12">
						<label class="control-label input-label" for="startTime">
							<spring:message code="vendas.criar.leilao.tab2.label.modelo" />
						</label>
						<div class="controls bootstrap-timepicker">
							<form:select id="id_modelo" cssClass="form-control" path="tblModelo" multiple="single">
								<spring:message code="vendas.criar.leilao.tab2.combobox.modelo" var="lb_msg" />
								<form:option value="0" selected="selected" disabled="disabled" label="${lb_msg}" />
								<form:options items="${listModelo}" itemValue="chave" itemLabel="descricao" />
							</form:select>
						</div>
					</div>
				</fieldset>
				<fieldset class="scheduler-border col-md-12 col-sm-12" style="margin-top: 40px;">
					<legend class="scheduler-border">
						<spring:message code="vendas.criar.leilao.tab3.titulo" />
					</legend>
					<div class="control-group col-sm-12 coml-md-12">
						<!-- marca -->
						<div class="col-md-4 col-sm-12">
							<p>
								<spring:message code="vendas.criar.leilao.tab3.box1.titulo" />
							</p>
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<div class="panel panel-primary" id="id_location">
									<div class="panel-heading" role="tab" id="headingOne">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
												<spring:message code="vendas.criar.leilao.tab3.box1.link.localizacao" />
											</a>
										</h4>
										<span class="icon-check" id="icon-check"></span>
									</div>
									<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<form:select id="estado" cssClass="form-control" path="tblUf" multiple="single">
														<spring:message code="vendas.criar.leilao.tab3.box1.placeholder.estado" var="lb_msg" />
														<form:option value="0" selected="selected" disabled="disabled" label="${lb_msg}" />
														<form:options items="${listEstado}" itemValue="chave" itemLabel="descricao" />
													</form:select>
												</div>
											</div>
											<br>
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<form:select id="cidade" cssClass="form-control" path="tblCidade" multiple="single">
														<spring:message code="vendas.criar.leilao.tab3.box1.placeholder.cidade" var="lb_msg" />
														<form:option value="0" selected="selected" disabled="disabled" label="${lb_msg}" />
														<form:options items="${listCidade}" itemValue="chave" itemLabel="descricao" />
													</form:select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary" id="id_new_or_used">
									<div class="panel-heading" role="tab" id="headingTwo">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
												<spring:message code="vendas.criar.leilao.tab3.box1.link.novoUsado" />
											</a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<spring:message code="vendas.criar.leilao.tab3.box1.radio.novo" var="lb_msg" />
														<form:checkbox path="uso" id="novo" value="NOVO" label="${lb_msg}" />
													</label>
													<label class="checkbox-inline">
														<spring:message code="vendas.criar.leilao.tab3.box1.radio.usado" var="lb_msg" />
														<form:checkbox path="uso" id="usado" value="USADO" label="${lb_msg}" />
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingFour">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
												<spring:message code="vendas.criar.leilao.tab3.box1.link.ano" />
											</a>
										</h4>
									</div>
									<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<form:select cssClass="form-control" path="anoModeloMinimo" multiple="single">
														<spring:message code="vendas.criar.leilao.tab3.box1.combobox.ano.modelo.minimo" var="lb_msg" />
														<form:option value="0" selected="selected" disabled="disabled" label="${lb_msg}" />
														<form:options items="${listAnoMod}" />
													</form:select>
												</div>
											</div>
											<br>
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<form:select cssClass="form-control" path="anoModeloMaximo" multiple="single">
														<spring:message code="vendas.criar.leilao.tab3.box1.combobox.ano.modelo.maximo" var="lb_msg" />
														<form:option value="0" selected="selected" disabled="disabled" label="${lb_msg}" />
														<form:options items="${listAnoMod}" />
													</form:select>
												</div>
											</div>
										</div>
									</div>
								</div>							
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingFive">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
												<spring:message code="vendas.criar.leilao.tab3.box1.link.quilometragem" />
											</a>
										</h4>
									</div>
									<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="control-label">
														<spring:message code="vendas.criar.leilao.tab3.box1.label.quilometragem.minimo" />:&nbsp;
													</label>
													<fmt:formatNumber type="number" maxFractionDigits="2" value="${formCadastrarLeilao.quilometragemMinimo}" var="v_valor" />
													<form:input class="numericField" id="quilometragemMinimo" path="quilometragemMinimo" placeholder="Ex.: 1.000" value="${v_valor}" />
												</div>
											</div>
											<br>
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="control-label">
														<spring:message code="vendas.criar.leilao.tab3.box1.label.quilometragem.maximo" />:
													</label>
													<fmt:formatNumber type="number" maxFractionDigits="2" value="${formCadastrarLeilao.quilometragemMaxima}" var="v_valor" />
													<form:input class="numericField" id="quilometragemMaxima" path="quilometragemMaxima" placeholder="Ex.: 600.000" value="${v_valor}" />
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingSix">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
												<spring:message code="vendas.criar.leilao.tab3.box1.link.placa" />
											</a>
										</h4>
									</div>
									<div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="placa" value="1" label="1" />
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="placa" value="2" label="2" />
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="placa" value="3" label="3" />
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="placa" value="4" label="4" />
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="placa" value="5" label="5" />
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="placa" value="6" label="6" />
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="placa" value="7" label="7" />
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="placa" value="8" label="8" />
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="placa" value="9" label="9" />
													</label>
												</div>
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="placa" value="0" label="0" />
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-12">
							<p>
								<spring:message code="vendas.criar.leilao.tab3.box2.titulo" />
							</p>
							<div class="panel-group" id="accordionTwo" role="tablist" aria-multiselectable="true">
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingSeven">
										<h4 class="panel-title">
											<a role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
												<spring:message code="vendas.criar.leilao.tab3.box2.link.cambio" />
											</a>
										</h4>
									</div>
									<div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkboxes items="${listCambios}" path="tblCambio" itemLabel="descricao" itemValue="chave" delimiter="<br/>"/>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingEight">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
												<spring:message code="vendas.criar.leilao.tab3.box2.link.combustivel" />
											</a>
										</h4>
									</div>
									<div id="collapseEight" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEight">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkboxes items="${listCombustiveis}" path="tblCombustivel" itemLabel="descricao" itemValue="chave" delimiter="<br/>"/>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingNine">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
												<spring:message code="vendas.criar.leilao.tab3.box2.link.opcionais" />
											</a>
										</h4>
									</div>
									<div id="collapseNine" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingNine">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkboxes items="${listOpcionais}" path="tblOpcionais" itemLabel="descricao" itemValue="chave" delimiter="<br/>"/>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingTen">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
												<spring:message code="vendas.criar.leilao.tab3.box2.link.portas" />
											</a>
										</h4>
									</div>
									<div id="collapseTen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTen">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="portas" value="2" label="2" />
													</label>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="portas" value="3" label="3" />
													</label>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="portas" value="4" label="4" />
													</label>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkbox path="portas" value="5" label="5" />
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingEleven">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
												<spring:message code="vendas.criar.leilao.tab3.box2.link.cor" />
											</a>
										</h4>
									</div>
									<div id="collapseEleven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEleven">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkboxes items="${listCor}" path="tblCor" itemLabel="descricao" itemValue="chave" delimiter="<br/>"/>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingTwelve">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseTwelve" aria-expanded="false" aria-controls="collapseTwelve">
												<spring:message code="vendas.criar.leilao.tab3.box2.link.blindagem" />
											</a>
										</h4>
									</div>
									<div id="collapseTwelve" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwelve">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<spring:message code="vendas.criar.leilao.tab3.box2.radio.blindagem.sim" var="lb_msg" />
														<form:checkbox path="blindagem" value="1" label="${lb_msg}" />
													</label>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<spring:message code="vendas.criar.leilao.tab3.box2.radio.blindagem.nao" var="lb_msg" />
														<form:checkbox path="blindagem" value="0" label="${lb_msg}" />
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingThirteen">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseThirteen" aria-expanded="false" aria-controls="collapseThirteen">
												<spring:message code="vendas.criar.leilao.tab3.box2.link.documentacao" />
											</a>
										</h4>
									</div>
									<div id="collapseThirteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThirteen">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkboxes items="${listDocumentacoes}" path="tblDocumentacao" itemLabel="descricao" itemValue="chave" delimiter="<br/>"/>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingFourteen">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseFourteen" aria-expanded="false" aria-controls="collapseFourteen">
												<spring:message code="vendas.criar.leilao.tab3.box2.link.carroceria" />
											</a>
										</h4>
									</div>
									<div id="collapseFourteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFourteen">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkboxes items="${listCarroceria}" path="tblCarroceria" itemLabel="descricao" itemValue="chave" delimiter="<br/>"/>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingFiveteen">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionTwo" href="#collapseFiveteen" aria-expanded="false" aria-controls="collapseFiveteen">
												<spring:message code="vendas.criar.leilao.tab3.box2.link.necessidade" />
											</a>
										</h4>
									</div>
									<div id="collapseFiveteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFiveteen">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkboxes items="${listNecessidade}" path="tblNecessidade" itemLabel="descricao" itemValue="chave" delimiter="<br/>"/>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-12">
							<p>
								<spring:message code="vendas.criar.leilao.tab3.box3.titulo" />
							</p>
							<div class="panel-group" id="accordionSixteen" role="tablist" aria-multiselectable="true">
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingSixteen">
										<h4 class="panel-title">
											<a role="button" data-toggle="collapse" data-parent="#accordionSixteen" href="#collapseSixteen" aria-expanded="false" aria-controls="collapseSixteen">
												<spring:message code="vendas.criar.leilao.tab3.box3.link.tipo.anunciante" />
											</a>
										</h4>
									</div>
									<div id="collapseSixteen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSixteen">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<form:checkboxes items="${listTipoAnuncio}" path="tblTipoAnuncio" itemLabel="descricao" itemValue="chave" delimiter="<br/>"/>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-primary">
									<div class="panel-heading" role="tab" id="headingSeventeen">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordionSeventeen" href="#collapseSeventeen" aria-expanded="false" aria-controls="collapseSeventeen">
												<spring:message code="vendas.criar.leilao.tab3.box3.link.negociacao" />
											</a>
										</h4>
									</div>
									<div id="collapseSeventeen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeventeen">
										<div class="panel-body">
											<div class="form-group">
												<div class="col-sm-12 col-xs-12">
													<label class="checkbox-inline">
														<spring:message code="vendas.criar.leilao.tab3.box3.checkbox.troca" var="lb_msg"/>
														<form:checkbox path="troca" value="1" label="${lb_msg}"/>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
				<div class="col-md-12 col-sm-12" style="margin: 40px 0px;">
					<button class="btn btn-primary" type="submit" style="float: right; font-size: 22px;">
						<fmt:message key="vendas.criar.leilao.btn" />
					</button>
				</div>
			</form:form>
		</div>
	</div>
	<!-- Controls -->
</div>
<script>
	$('.carousel').carousel({
		interval : false
	});
</script>
<script type="text/javascript" src="js/scripts.js"></script>