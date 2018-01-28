<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;" pageEncoding="ISO-8859-1"%>

<!-- Nav tabs -->
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" <c:if test="${tab == 0}">class="active"</c:if>>
              <a href="#home" aria-controls="home" role="tab" data-toggle="tab"><fmt:message key="usuario.login.tab.titulo" /></a>
            </li>
            
            <li role="presentation" <c:if test="${tab == 1}">class="active"</c:if>>
              <a href="#profile1" aria-controls="profile1" role="tab" data-toggle="tab"><fmt:message key="usuario.esqueceu.senha.tab.titulo" /></a>
            </li>
            
            <li role="presentation" <c:if test="${tab == 2}">class="active"</c:if>>
              <a href="#profile2" aria-controls="profile2" role="tab" data-toggle="tab"><fmt:message key="usuario.basico.cadastro.tab.titulo" /></a>
            </li>
          </ul>
		<!-- LOGIN TAB -->
          <!-- Tab panes -->
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane <c:if test="${tab == 0}">active</c:if>" id="home">
              <div class="modal-header">
                <h4 class="modal-title"><fmt:message key="usuario.login.tab.subtitulo" /></h4>
              </div>
            	<c:if test="${not empty error}">
				      <font color="red">
				        <fmt:message key="${msg}"/>.
				      </font>
				</c:if>
              <div class="modal-body">
               <form class="form-horizontal" id="form-modal1" method="post" action="<c:url value='/login' />">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"><fmt:message key="usuario.login.tab.label.email" /></label>
                  <div class="col-sm-10">
                    <input type="email" name="username" class="form-control" id="inputEmail3" placeholder="<fmt:message key="usuario.login.tab.placeholder.email" />">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label"><fmt:message key="usuario.login.tab.lable.senha" /></label>
                  <div class="col-sm-10">
                    <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="<fmt:message key="usuario.login.tab.placeholder.senha" />">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                  	<button type="submit" class="btn btn-primary"><fmt:message key="usuario.login.tab.btn.login" /></button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          
          <!-- ESQUECEU SENHA TAB -->
          <!-- Tab panes -->
            <div role="tabpanel" class="tab-pane <c:if test="${tab == 1}">active</c:if>" id="profile1">
              <div class="modal-header">
                <h4 class="modal-title"><fmt:message key="usuario.esqueceu.senha.tab.subtitulo" /></h4>
              </div>
              	<spring:hasBindErrors name="formReenvioSenha">           
		            <c:forEach var="error" items="${errors.allErrors}">
		            	<font color="red">
		            		<spring:message message="${error}"/>
							<br/>
						</font>
					</c:forEach>
				</spring:hasBindErrors>
              <div class="modal-body">
               <form class="form-horizontal" id="form-modal1" method="post" action="<c:url value='/login/modificar/senha' />">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label"><fmt:message key="usuario.esqueceu.senha.tab.label.email" /></label>
                  <div class="col-sm-10">
                    <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="<fmt:message key="usuario.esqueceu.senha.tab.placeholder.email" />">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                  	<button type="submit" class="btn btn-primary"><fmt:message key="usuario.esqueceu.senha.tab.btn.enviar" /></button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          
          <!-- Cadastro TAB -->
          <div role="tabpanel" class="tab-pane <c:if test="${tab == 2}">active</c:if>" id="profile2">
            <div class="modal-header">
              <h4 class="modal-title"><fmt:message key="usuario.basico.cadastro.tab.subtitulo" /></h4>
            </div>
            <spring:hasBindErrors name="formCadastroSimples">           
	            <c:forEach var="error" items="${errors.allErrors}">
	            	<font color="red">
	            		<spring:message message="${error}"/>
						<br/>
					</font>
				</c:forEach>
			</spring:hasBindErrors>
            <div class="modal-body">
             <form class="form-horizontal" id="form-modal2" action="<c:url value="/cliente/cadastro/simples" />" method="POST">
              <div class="form-group">
                <label for="nome" class="col-sm-2 control-label"><fmt:message key="usuario.basico.cadastro.tab.label.cpf" /></label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="cpfCnpj" name="cpfCnpj" value="${formCadastroSimples.cpfCnpj}" placeholder="<fmt:message key="usuario.basico.cadastro.tab.placeholder.cpf" />">
                </div>
              </div>
              <div class="form-group">
                <label for="nome" class="col-sm-2 control-label"><fmt:message key="usuario.basico.cadastro.tab.label.nome" /></label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="nome" name="razaoSocial" value="${formCadastroSimples.razaoSocial}" placeholder="<fmt:message key="usuario.basico.cadastro.tab.placeholder.nome" />">
                </div>
              </div>
              <div class="form-group">
                <label for="endereco" class="col-sm-2 control-label"><fmt:message key="usuario.basico.cadastro.tab.label.email" /></label>
                <div class="col-sm-10">
                  <input type="email" class="form-control" id="email" name="email" value="${formCadastroSimples.email}" placeholder="<fmt:message key="usuario.basico.cadastro.tab.placeholder.email" />">
                </div>
              </div>
              <div class="form-group phone-area">
                <label for="cpf/cnpj" class="col-sm-2 control-label"><fmt:message key="usuario.basico.cadastro.tab.label.telefone" /></label>
                <div class="col-sm-5">
                  <input type="phone" class="form-control" id="telefone" name="telefone" value="${formCadastroSimples.telefone}" placeholder="<fmt:message key="usuario.basico.cadastro.tab.placeholder.telefone" />">
                </div>
                <div class="col-sm-5 ">
                  <input type="phone" class="form-control" id="celular" name="celular" value="${formCadastroSimples.celular}" placeholder="<fmt:message key="usuario.basico.cadastro.tab.placeholder.celular" />">
                </div>
              </div>
              <div class="form-group">
                <label for="passWord" class="col-sm-2 control-label"><fmt:message key="usuario.basico.cadastro.tab.label.senha" /></label>
                <div class="col-sm-10">
                  <input type="password" class="form-control" id="password" name="senha" placeholder="<fmt:message key="usuario.basico.cadastro.tab.placeholder.senha" />">
                </div>
              </div>
              <div class="form-group">
                <div class="Password">
                  <label for="cpf/cnpj" class="col-sm-2 control-label"><fmt:message key="usuario.basico.cadastro.tab.label.senha.confirmar" /></label>
                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="passwordConfirme" name="confirmarSenha" placeholder="<fmt:message key="usuario.basico.cadastro.tab.placeholder.senha.confirmar" />">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-primary"><fmt:message key="usuario.basico.cadastro.tab.btn.salvar" /></button>
                </div>
              </div>
            </form>

          </div>
        </div>
      </div>
<script type="text/javascript" src="<c:url value="/resources/js/jUhereAuto.js"/>"></script>
