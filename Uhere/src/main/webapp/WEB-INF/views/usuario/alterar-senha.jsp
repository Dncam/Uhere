<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

    <section id="minhas-vendas-area" class="leilao-area">
      <div class="col-sm-12 col-md-12 faixa-localizadora">
        <div class="container">
          <h2 style="margin:0px;"><fmt:message key="usuario.alterar.senha.titulo" /></h2>
          <p><fmt:message key="usuario.alterar.senha.subtitulo" /></p>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-12">
          <spring:hasBindErrors name="formAlterarSenha">           
	            <c:forEach var="error" items="${errors.allErrors}">
	            	<font color="red">
	            		<spring:message message="${error}"/>
						<br/>
					</font>
				</c:forEach>
			</spring:hasBindErrors>
            <form class="form-horizontal" action="<c:url value="/cliente/cadastro/senha" />" method="post">
              <div class="col-sm-12 col-md-6">
                <div class="form-group">
                  <label style="text-align: left;" for="novasenha" class="col-sm-12 control-label"><fmt:message key="usuario.alterar.senha.label.senha" /></label>
                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="novasenha" name="senha" placeholder="<fmt:message key="usuario.alterar.senha.placeholder.senha" />">
                  </div>
                </div>
              </div>
              <div class="col-sm-12 col-md-6">
                <div class="form-group">
                  <label style="text-align: left;" for="confirmanovasenha" class="col-sm-12 control-label"><fmt:message key="usuario.alterar.senha.label.senha.confirmar" /></label>
                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="confirmanovasenha" name="confirmarSenha" placeholder="<fmt:message key="usuario.alterar.senha.placeholder.senha.confirmar" />">
                  </div>
                </div>
              </div>
              <div class="col-sm-12 col-md-12" style="margin-top:30px;">
                <div class="form-group">
                  <div class="col-sm-10">
                    <button style="width:100%; max-width: 300px; padding:12px;" type="submit" class="btn btn-primary"><fmt:message key="usuario.alterar.senha.btn.salvar" /></button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div><!-- row-->
      </div>
    </section>
