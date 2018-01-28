<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<section id="minhas-vendas-area" class="leilao-area">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 compras-area">
        <div class="jumbotron sem-nada">
          <h1><fmt:message key="mensagem.erro" /></h1>
          <p><fmt:message key="${mensagem}"/></p>
	      <div class="container">
	        <div class="row">
	          <div class="col-sm-12 col-md-12">
	          <form class="form-horizontal" id="formReenviarRegistro" method="post" action="<c:url value="/cliente/reenviar/email" />">
	              <div class="form-group">
	               	<input type="text" class="form-control"  value="${usuario}" name="email" readonly="readonly" style="text-align: center;">
	               </div>      
	                <div class="form-group">
	                    <button style="width:100%; max-width: 300px; padding:12px;" type="submit" class="btn btn-primary"><fmt:message key="erro.registro.botao" /></button>
	                </div>
	              </form>
	          </div>
	         </div>
	        </div>
        </div>
      </div>
    </div>
  </div>
</section>