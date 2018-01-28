<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<c:url value="/" var="l_principal" />
<section id="minhas-vendas-area" class="leilao-area">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 compras-area">
        <div class="jumbotron sem-nada">
          <h1><fmt:message key="${titulo}" /></h1>
          <p><fmt:message key="${mensagem}" /></p>
          <button type="button" class="btn btn-primary btn-lg" data-toggle="modal">
         <fmt:message key="mensagem.botao.voltar" />
        </button>
        </div>
      </div>
    </div>
  </div>
</section>
<script type="text/javascript">
	$(document).ready(function(){
		$(".btn").click(function(event){
			window.location = '${l_principal}';
		});
	});
</script>
