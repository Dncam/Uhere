package com.uhere.auto.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uhere.auto.entity.TblAnuncio;
import com.uhere.auto.entity.bean.BPesquisaAvancada;
import com.uhere.auto.model.UhereModel;
import com.uhere.auto.model.validator.ValidaTblAnuncioCadastrar;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="/anuncio")
public class ControllerAnuncio {
	
	@Autowired
	private UhereModel uhereModel;
	
    @Inject
    private ValidaTblAnuncioCadastrar validaTblAnuncioCadastrar;
    
       
    @InitBinder("formCadastrarAnuncio")
    public void initBinderCadastrar(WebDataBinder binder) {
        binder.addValidators(validaTblAnuncioCadastrar);
    }
	
	@RequestMapping(value = "/pesquisa/busca/simples", method = RequestMethod.GET)
	public String pesquisar(Model model,@RequestParam(defaultValue="%") String descricao ) {
		model.addAttribute("listMarcas", uhereModel.getListMarca());
		model.addAttribute("listMinYear", uhereModel.getListAno());
		model.addAttribute("listMaxYear", uhereModel.getListAno());
		model.addAttribute("listAnuncios", uhereModel.getListAnuncio(descricao));
		return "list.vehicles";
	}
	
	@RequestMapping(value = "/pesquisa/busca/avancada", method = RequestMethod.POST)
	public String pesquisaAvancada(Model model,@ModelAttribute(name="bPesquisaAvancada") BPesquisaAvancada bPesquisaAvancada,BindingResult bindingResult ) {
		model.addAttribute("listMarcas", uhereModel.getListMarca());
		model.addAttribute("listModelos", uhereModel.getListModelo(bPesquisaAvancada != null ? bPesquisaAvancada.getTblMarca() : null));
		model.addAttribute("listMinYear", uhereModel.getListAno());
		model.addAttribute("listMaxYear", uhereModel.getListAno());
		model.addAttribute("listAnuncios", uhereModel.getListAnuncio(bPesquisaAvancada));
		model.addAttribute("bPesquisaAvancada", bPesquisaAvancada);
		return "list.vehicles";
	}

	@RequestMapping(value = "/pesquisa/tela/modal", method = RequestMethod.POST)
	public String modalPesquisaAvancada(Model model) {
		model.addAttribute("listMarcas", uhereModel.getListMarca());
		model.addAttribute("listCambios", uhereModel.getListCambio());
		model.addAttribute("listCombustiveis", uhereModel.getListCombustivel());
		model.addAttribute("listOpcionais", uhereModel.getListOpcionais());
		model.addAttribute("listCor", uhereModel.getListCor());
		model.addAttribute("listDocumentacoes", uhereModel.getListDocumentacao());
		model.addAttribute("listCarroceria", uhereModel.getListCarroceria());
		model.addAttribute("listNecessidade", uhereModel.getListNecessidade());
		model.addAttribute("listTipoAnuncio", uhereModel.getListTipoAnuncio());
		model.addAttribute("listMinYear", uhereModel.getListAno());
		model.addAttribute("listMaxYear", uhereModel.getListAno());
		return "modal.pesquisa.avancada";
	}
	
	@RequestMapping(value = "/pesquisa/catalogo/detalhe", method = RequestMethod.GET)
	public String resultadoDetalhe(Model model,@RequestParam(name="anuncio") String chave) {
		model.addAttribute("anuncio", uhereModel.getAnuncio(chave));
		return "details";
	}
	
	@RequestMapping(value = "/meus/anuncios", method = RequestMethod.GET)
	public String meusAnuncios(Model model) {
		Iterable<TblAnuncio> anuncioList = uhereModel.getMeusAnuncios(SecurityContextHolder.getContext().getAuthentication().getName());
		if(anuncioList == null) {
			return "redirect:/tela/mensagem?titulo=home.menu.superior.meus.anuncios.login&msg=mensagem.anuncios.inexistente&isModal=false";
		}else {
			model.addAttribute("anuncioList",anuncioList);
			return "meus.anuncios";
		}
	}
	
	@RequestMapping(value = "/tela/cadastrar", method = {RequestMethod.GET,RequestMethod.POST})
	public String tela(Model model,HttpServletRequest request,@RequestAttribute(name="formCadastrarAnuncio",required=false) TblAnuncio tblAnuncio) {
		if(request.getSession().getAttribute("alterar") == null || !(Boolean)request.getSession().getAttribute("alterar")) {
			request.getSession().setAttribute("alterar", false);
			if(uhereModel.validaNAnunciosbyUsuario(SecurityContextHolder.getContext().getAuthentication().getName()))
				return "redirect:/tela/mensagem?titulo=mensagem.erro&msg=vendas.criar.anuncio.mensagem.erro.excedido&isModal=false";
		}
		model.addAttribute("listMarcas", uhereModel.getListMarca());
		model.addAttribute("listCambios", uhereModel.getListCambio());
		model.addAttribute("listCombustiveis", uhereModel.getListCombustivel());
		model.addAttribute("listOpcionais", uhereModel.getListOpcionais());
		model.addAttribute("listCor", uhereModel.getListCor());
		model.addAttribute("listDocumentacoes", uhereModel.getListDocumentacao());
		model.addAttribute("listCarroceria", uhereModel.getListCarroceria());
		model.addAttribute("listNecessidade", uhereModel.getListNecessidade());
		model.addAttribute("listTipoAnuncio", uhereModel.getListTipoAnuncio());
		model.addAttribute("listAnoFab", uhereModel.getListAno());
		model.addAttribute("listAnoMod", uhereModel.getListAno());
		model.addAttribute("listEstado",uhereModel.getListUf());
		return "cadastrar.anuncios";
	}
	
	@RequestMapping(value = "/cadastrar", method = RequestMethod.POST)
	public String cadastrar(Model model,@Validated @ModelAttribute(name="formCadastrarAnuncio") TblAnuncio tblAnuncio,BindingResult bindingResult,HttpServletRequest request) {
		if (bindingResult.hasErrors()) {
			if(tblAnuncio.getTblUf() != null)
				request.setAttribute("listCidade",uhereModel.getListCidade(tblAnuncio.getTblUf()));
			if(tblAnuncio.getTblVeiculo().getTblMarca().getChave() != null)
				request.setAttribute("listModelo",uhereModel.getListModelo(tblAnuncio.getTblVeiculo().getTblMarca()));
			return "forward:/anuncio/tela/cadastrar";
        }
		if(!(Boolean)request.getSession().getAttribute("alterar"))
			uhereModel.salvarAnuncio(tblAnuncio, request);
		else
			uhereModel.atualizarAnuncio(tblAnuncio, request);
		request.getSession().removeAttribute("imagensValidas");
		request.getSession().removeAttribute("alterar");
		return "redirect:/tela/mensagem?titulo=mensagem.sucesso&msg=vendas.criar.anuncio.mensagem.sucesso&isModal=false";
	}
	
	@RequestMapping(value = "/tela/alterar/{chave}", method = RequestMethod.GET)
	public String alterar(@PathVariable String chave,HttpServletRequest request) {
		TblAnuncio tblAnuncio = uhereModel.getAnuncio(chave);
		if(tblAnuncio == null)
			return "redirect:/tela/mensagem?titulo=mensagem.erro&msg=vendas.alterar.anuncio.mensagem.erro.anuncio.null&isModal=false";
		if(!tblAnuncio.getTblUsuario().getEmail().equals(SecurityContextHolder.getContext().getAuthentication().getName()))
			return "redirect:/tela/mensagem?titulo=mensagem.erro&msg=vendas.alterar.anuncio.mensagem.erro.anuncio.falso&isModal=false";
		request.setAttribute("formCadastrarAnuncio",tblAnuncio);
		request.setAttribute("listCidade",uhereModel.getListCidade(tblAnuncio.getTblUf()));
		request.setAttribute("listModelo",uhereModel.getListModelo(tblAnuncio.getTblVeiculo().getTblMarca()));
		request.getSession().setAttribute("imagensValidas", tblAnuncio.getTblVeiculo().getFotos());
		request.getSession().setAttribute("alterar", true);
		return "forward:/anuncio/tela/cadastrar";
	}
	
}




