<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>

<!-- URL -->
<c:url var="vPesquisaAvancada" value="/anuncio/pesquisa/tela/modal"/>
<c:url var="vPesquisar" value="/anuncio/pesquisa/busca/simples" />

<!-- SETA PARA O TOPO -->
<a href="#header" class="seta-para-topo ancora"></a>
<!-- FINAL DA SETA PARA O TOPO -->
<!-- CONTEUDO DO SITE -->
<header id="header">
  <div class="container col-xs-12">
    <div class="row">
      <div class="col-lg-8 col-lg-offset-2">
       <h1><fmt:message key="home.apresentacao.msg1"/><span> <fmt:message key="home.apresentacao.msg2"/> </span><fmt:message key="home.apresentacao.msg3"/></h1>
     </div>    
     <div class="col-lg-6 col-lg-offset-3">
      <div class="input-group">
	      <form action="${vPesquisar}" method="get" id="formPesquisaSimples">
	       	<input type="text" class="form-control barra-pesquisa" placeholder="<fmt:message key="home.pequisa.pesquisa"/>" name="descricao">
		  </form>
	       <span class="input-group-btn">
	         	<a href="#" class="btn btn-primary bt-pesquisar" aria-label="Left Align" id="btnPesquisaSimples" style="padding: 10px 20px 11px 20px;">
	          		<span class="glyphicon glyphicon glyphicon-search" aria-hidden="true"></span>
          		</a>
	       </span>
      </div><!-- /input-group -->
      <div class="col-lg-8 col-lg-offset-2" >
    	<a class="bt-pesq-avanca" href="${vPesquisaAvancada}" data-toggle="modal" data-target="#pesquisa-avancada"><fmt:message key="home.apresentacao.pesquisa.avancada"/></a>
      </div>
    </div><!-- /.col-lg-6 -->
  </div>
</div>
<a href="#como-funciona" class="seta ancora">
  <img src="<c:url value="/resources/img/seta-baixo.png"/>" alt="U-Here">
</a>
</header>

<section class="como-funciona" id="como-funciona">
  <div class="container">
    <div class="row">
      <div class="text_area_1 col-md-6">
        <h2><fmt:message key="home.apresentacao.msg4"/></h2>
        <h3>
          <fmt:message key="home.apresentacao.msg5"/>
        </h3>
      </div>
      <div class="col-md-6 col-sm-12 col-xs-12">
        <img src="<c:url value="/resources/img/primeiro-passo.svg"/>" alt="Primeiro Passo Uhere" class="passo_img_1">
      </div>
    </div>
  </div>
  <a href="#como-funciona-2" class="seta ancora">
    <img src="<c:url value="/resources/img/seta-baixo.png"/>" alt="U-Here">
  </a>
</section>

<section class="como-funciona cf-2" id="como-funciona-2">
  <div class="container">
    <div class="row">
      <div class="text_area_2 col-md-6">
        <h2><fmt:message key="home.apresentacao.msg6"/></h2>
        <h3>
          <fmt:message key="home.apresentacao.msg7"/>
        </h3>
      </div>
      <div class="col-md-6">
        <img src="<c:url value="/resources/img/segundo-passo.svg"/>" alt="Primeiro Passo Uhere" class="passo_img_2">
      </div>
    </div>
  </div>
  <a href="#como-funciona-3" class="seta ancora">
    <img src="<c:url value="/resources/img/seta-baixo.png"/>" alt="U-Here">
  </a>
</section>
<section class="como-funciona" id="como-funciona-3">
  <div class="container terceiro-passo-container">
    <div class="row">
      <div class="text_area_3 col-md-6">
        <h2><fmt:message key="home.apresentacao.msg8"/></h2>
        <h3>
          <fmt:message key="home.apresentacao.msg9"/>
        </h3>
      </div>
      <div class="col-md-6">
        <img src="<c:url value="/resources/img/terceiro-passo.svg"/>" alt="Primeiro Passo Uhere" class="passo_img_3">
      </div>
    </div>
  </div>
  <a href="#propaganda" class="seta ancora">
    <img src="<c:url value="/resources/img/seta-baixo.png"/>" alt="U-Here">
  </a>
</section>

<section class="propagandas" id="propaganda">
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-sm-6">
        <a href="">
          <div class="content-propaganda-area">
            <img src="<c:url value="/resources/img/carro-propaganda.jpg"/>" alt="">
            <div class="text-area">
              <h3>Chevrolet Carro XY 2015</h3>
              <p>Saiba Mais</p>
            </div>
          </div>
        </a>
      </div>
      <div class="col-md-4 col-sm-6">
        <a href="">
          <div class="content-propaganda-area">
            <img src="<c:url value="/resources/img/carro-propaganda.jpg"/>" alt="">
            <div class="text-area">
              <h3>Chevrolet Carro XY 2015</h3>
              <p>Saiba Mais</p>
            </div>
          </div>
        </a>
      </div>

      <div class="col-md-4 col-sm-6">
        <a href="">
          <div class="content-propaganda-area">
            <img src="<c:url value="/resources/img/carro-propaganda.jpg"/>" alt="">
            <div class="text-area">
              <h3>Chevrolet Carro XY 2015</h3>
              <p>Saiba Mais</p>
            </div>
          </div>
        </a>
      </div>
      <div class="col-md-4 col-sm-6">
        <a href="">
          <div class="content-propaganda-area">
            <img src="<c:url value="/resources/img/carro-propaganda.jpg"/>" alt="">
            <div class="text-area">
              <h3>Chevrolet Carro XY 2015</h3>
              <p>Saiba Mais</p>
            </div>
          </div>
        </a>
      </div>
      <div class="col-md-4 col-sm-6">
        <a href="">
          <div class="content-propaganda-area">
            <img src="<c:url value="/resources/img/carro-propaganda.jpg"/>" alt="">
            <div class="text-area">
              <h3>Chevrolet Carro XY 2015</h3>
              <p>Saiba Mais</p>
            </div>
          </div>
        </a>
      </div>
    </div>
  </div>
  <a href="#sobrenos" class="seta ancora">
    <img src="<c:url value="/resources/img/seta-baixo.png"/>" alt="U-Here">
  </a>
</section>

<section id="sobrenos" class="sobrenos">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <h2><fmt:message key="home.apresentacao.sobre"/></h2>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque feugiat dignissim dignissim. Ut rhoncus sem sit amet condimentum auctor. Integer fermentum leo tellus, at vestibulum leo convallis eget. Pellentesque id diam sagittis mi molestie interdum. Aenean placerat ipsum arcu, sed faucibus eros varius eu. Cras ac quam lectus. Donec id aliquet velit. Vestibulum ex urna, malesuada non convallis sed, eleifend blandit est. Etiam orci risus, pulvinar eget consequat vel, ullamcorper vehicula lectus. Ut scelerisque tellus nec nulla aliquet mattis.
        </p>
      </div>
      <div class="col-md-6">
        <div class="embed-responsive embed-responsive-16by9">
          <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/DMV0pAWzo6U"></iframe>
        </div>
      </div>
    </div>
  </div>
</section>

<section id="sobrenos">
  <div class="container">
    <div class="row">
      <div class="col-md-4 depoimento-area">
        <img src="http://www.criesuapersona.com.br/img/personas/persona12.jpg" alt="..." class="img-circle">
        <p>
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque feugiat dignissim dignissim. Ut rhoncus sem sit amet condimentum auctor.
        </p>
      </div>
      <div class="col-md-4 depoimento-area">
        <img src="https://cdn.productplan.com/wp-content/uploads/2016/06/Maddy-Kirsch-150x150.jpg" alt="..." class="img-circle">
        <p>
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque feugiat dignissim dignissim. Ut rhoncus sem sit amet condimentum auctor.
        </p>
      </div>
      <div class="col-md-4 depoimento-area">
        <img src="http://www.thepersonamusic.com/wp-content/uploads/2014/10/philip-sledge-the-persona-150x150.jpg" alt="..." class="img-circle">
        <p>
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque feugiat dignissim dignissim. Ut rhoncus sem sit amet condimentum auctor.
        </p>
      </div>
    </div>
  </div>
</section>



<!-- FINAL DO CONTEUDO DO SITE -->



