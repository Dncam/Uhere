<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="col-md-4 onde-area">
        <h3>Onde</h3>
        <img src="<c:url value="/resources/img/uhere-logo-white.png"/>" alt="Logo Uhere">
        <p>125 Park Avenue, 25th Floor – New York, NY 10017</p>
        <p>Phone: +1 (646) 583-0360</p>
        <p>Email: contact@uhere.com</p>
        <p>Copyright 2016 Predifit. All Rights Reserved</p>
        <a href="#">Política de Privacidade</a>
      </div>

      <div class="col-md-4">
        <h3><fmt:message key="home.apresentacao.siga"/></h3>
        <a href="#" class="ico-facebook"></a>
        <a href="#" class="ico-insta"></a>
      </div>

      <div class="col-md-4">
        <form>
          <h3><fmt:message key="home.apresentacao.recado"/></h3>
          <div class="form-group">
            <label for="nome-contato"><fmt:message key="home.apresentacao.recado.nome"/></label>
            <input type="email" class="form-control" id="nome-contato" placeholder="<fmt:message key="home.apresentacao.recado.nome"/>">
          </div>
          <div class="form-group">
            <label for="email-contato"><fmt:message key="home.apresentacao.recado.email"/></label>
            <input type="email" class="form-control" id="email-contato" placeholder="<fmt:message key="home.apresentacao.recado.email"/>">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1"><fmt:message key="home.apresentacao.recado.mensagem"/></label>
            <textarea class="form-control" rows="4" placeholder="<fmt:message key="home.apresentacao.recado.mensagem"/>"></textarea>
          </div>
          <button type="submit" class="btn btn-primary"><fmt:message key="home.apresentacao.recado.enviar"/></button>
        </form>

      </div>

    </div>
  </div>

</footer>