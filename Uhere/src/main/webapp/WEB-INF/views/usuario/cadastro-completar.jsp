<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<input type="hidden" value="<c:url value="/estrutura/cidades" />" id="l_getcidades" />

    <section id="minhas-vendas-area" class="leilao-area">
      <div class="col-sm-12 col-md-12 faixa-localizadora">
        <div class="container">
          <h2 style="margin:0px;"><fmt:message key="usuario.completar.cadastro.titulo" /></h2>
          <p><fmt:message key="usuario.completar.cadastro.subtitulo" /></p>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-12">
           <spring:hasBindErrors name="formCadastroCompleto">           
	            <c:forEach var="error" items="${errors.allErrors}">
	            	<font color="red">
	            		<spring:message message="${error}"/>
						<br/>
					</font>
				</c:forEach>
			</spring:hasBindErrors>
            <form class="form-horizontal" id="formCadastroCompleto" method="post" action="<c:url value="/cliente/cadastro/completo" />">
              <div class="col-sm-12 col-md-6">
              <div class="form-group">
                  <label style="text-align: left;" class="col-sm-12 control-label"><fmt:message key="usuario.completar.cadastro.label.cpf" /></label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control"  readonly="readonly" name="cpfCnpj" value="${formCadastroCompleto.cpfCnpj}">
                  </div>
                </div>      
                <div class="form-group">
                  <label style="text-align: left;" class="col-sm-12 control-label"><fmt:message key="usuario.completar.cadastro.label.email" /></label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" readonly="readonly" name="email" value="${formCadastroCompleto.email}">
                  </div>
                </div>
                <div class="form-group">
                  <label style="text-align: left;" class="col-sm-12 control-label"><fmt:message key="usuario.completar.cadastro.label.nome" /></label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="razaoSocial" value="${formCadastroCompleto.razaoSocial}" placeholder="<fmt:message key="usuario.completar.cadastro.placeholder.nome" />" >
                  </div>
                </div>
                <div class="form-group">
                  <label style="text-align: left;" class="col-sm-12 control-label"><fmt:message key="usuario.completar.cadastro.label.telefone" /></label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="telefone" value="${formCadastroCompleto.telefone}" placeholder="<fmt:message key="usuario.completar.cadastro.placeholder.telefone" />">
                  </div>
                </div>
                <div class="form-group">
                  <label style="text-align: left;" class="col-sm-12 control-label"><fmt:message key="usuario.completar.cadastro.label.celular" /></label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="celular" value="${formCadastroCompleto.celular}" placeholder="<fmt:message key="usuario.completar.cadastro.placeholder.celular" />">
                  </div>
                </div>
                <div class="form-group">
                  <label style="text-align: left;" class="col-sm-12 control-label"><fmt:message key="usuario.completar.cadastro.label.cep" /></label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="cep" value="${formCadastroCompleto.cep}" placeholder="<fmt:message key="usuario.completar.cadastro.placeholder.cep" />">
                  </div>
                </div>
               </div>
               <div class="col-sm-12 col-md-6">      
                <div class="form-group">
                  <label style="text-align: left;" class="col-sm-12 control-label"><fmt:message key="usuario.completar.cadastro.label.endereco" /></label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="endereco" value="${formCadastroCompleto.endereco}" placeholder="<fmt:message key="usuario.completar.cadastro.placeholder.endereco" />">
                  </div>
                </div>        
                <div class="form-group">
                  <label style="text-align: left;" class="col-sm-12 control-label"><fmt:message key="usuario.completar.cadastro.label.numero" /></label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="numero" value="${formCadastroCompleto.numero}" placeholder="<fmt:message key="usuario.completar.cadastro.placeholder.numero" />">
                  </div>
                </div>         
                <div class="form-group">
                  <label style="text-align: left;" class="col-sm-12 control-label"><fmt:message key="usuario.completar.cadastro.label.bairro" /></label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="bairro" value="${formCadastroCompleto.bairro}" placeholder="<fmt:message key="usuario.completar.cadastro.placeholder.bairro" />">
                  </div>
                </div>
                <div class="form-group">
                  <label style="text-align: left;" class="col-sm-12 control-label"><fmt:message key="usuario.completar.cadastro.label.complemento" /></label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="complemento" value="${formCadastroCompleto.complemento}" placeholder="<fmt:message key="usuario.completar.cadastro.placeholder.complemento" />">
                  </div>
                </div>
                <div class="form-group">
                  <label style="text-align: left;" for="cidade" class="col-sm-12 control-label"><fmt:message key="usuario.completar.cadastro.combobox.estado" /></label>
                  <div class="col-sm-10">
                    <select id="estado" name="tblUf.chave" class="form-control" >
                      	<option disabled="disabled"><fmt:message key="usuario.completar.cadastro.placeholder.estado" /></option>
                      	<c:forEach items="${listEstado}" var="uf">
							<option value="${uf.chave}" label="${uf.descricao}" ${formCadastroCompleto.tblUf.chave == uf.chave ? 'selected' : ' '} />
						</c:forEach>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <div class="Password">
                    <label style="text-align: left;" for="cidade" class="col-sm-12 control-label"><fmt:message key="usuario.completar.cadastro.combobox.cidade" /></label>
                    <div class="col-sm-10">
                      <select id="cidade" name="tblCidade.chave" class="form-control">
                        <option disabled="disabled"><fmt:message key="usuario.completar.cadastro.placeholder.cidade" /></option>
                        <c:forEach items="${listCidade}" var="cidade">
							<option value="${cidade.chave}" label="${cidade.descricao}" ${formCadastroCompleto.tblCidade.chave == cidade.chave ? 'selected' : ' '} />
						</c:forEach>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-12 col-md-12" style="margin-top:30px;">
                <div class="form-group">
                  <div class="col-sm-10">
                    <button style="width:100%; max-width: 300px; padding:12px;" type="submit" class="btn btn-primary"><fmt:message key="usuario.completar.cadastro.btn.salvar" /></button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div><!-- row-->
      </div>
    </section>