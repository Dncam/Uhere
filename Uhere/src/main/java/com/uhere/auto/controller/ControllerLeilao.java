package com.uhere.auto.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uhere.auto.entity.TblLeilao;
import com.uhere.auto.model.UhereModel;
import com.uhere.auto.model.validator.ValidaTblLeilaoCadastrar;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="/leilao")
public class ControllerLeilao {
	
	@Autowired
	private UhereModel uhereModel;
	
	
	@Inject
    private ValidaTblLeilaoCadastrar validaTblLeilaoCadastrar;
    
       
    @InitBinder("formCadastrarLeilao")
    public void initBinderCadastrar(WebDataBinder binder) {
        binder.addValidators(validaTblLeilaoCadastrar);
    }
	
	@RequestMapping(method = RequestMethod.GET)
	public String pesquisar(Model model) {
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
		model.addAttribute("formCadastrarLeilao",new TblLeilao());
		return "cadastrar.leilao";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String cadastrar(Model model,@Validated @ModelAttribute(name="formCadastrarLeilao") TblLeilao tblLeilao,BindingResult bindingResult,HttpServletRequest request) {
		if (bindingResult.hasErrors()) {
			return "cadastrar.leilao";
        }
		return "redirect:/tela/mensagem?titulo=mensagem.sucesso&msg=vendas.criar.anuncio.mensagem.sucesso&isModal=false";
	}

	
}




