<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 compras-area">
    <div class="jumbotron sem-nada">
      <h1><fmt:message key="mensagem.sucesso" /></h1>
      <p><fmt:message key="${mensagem}" /></p>
      <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-dismiss="modal">
     <fmt:message key="mensagem.botao.voltar" />
    </button>
    </div>
  </div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".btn").click(function(event){
			window.location.reload();
		});
	});
</script>
