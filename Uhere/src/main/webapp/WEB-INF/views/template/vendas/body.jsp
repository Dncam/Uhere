<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
    <section id="filtro-lateral">
      <div class="container">
        <div class="row">
        	<tiles:insertAttribute name="filter"/>
			<tiles:insertAttribute name="body-one"/>
        </div>
      </div>
    </section>

