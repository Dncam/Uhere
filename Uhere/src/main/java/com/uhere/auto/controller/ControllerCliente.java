package com.uhere.auto.controller;

import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uhere.auto.entity.TblUsuario;
import com.uhere.auto.model.UhereModel;
import com.uhere.auto.model.validator.ValidaTblUsuarioCadCompleto;
import com.uhere.auto.model.validator.ValidaTblUsuarioCadSimples;
import com.uhere.auto.model.validator.ValidaTblUsuarioSenha;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="/cliente")
public class ControllerCliente {

	@Autowired
	private UhereModel uhereModel;

    @Inject
    private ValidaTblUsuarioCadCompleto validaTblUsuarioCadCompleto;

    @Inject
    private ValidaTblUsuarioCadSimples validaTblUsuarioCadSimples;
    
    @Inject
    private ValidaTblUsuarioSenha validaTblUsuarioSenha;   
    
    
    @InitBinder("formCadastroSimples")
    public void initBinderSimples(WebDataBinder binder) {
        binder.addValidators(validaTblUsuarioCadSimples);
        
    }
    
    @InitBinder("formCadastroCompleto")
    public void initBinderCompleto(WebDataBinder binder) {
        binder.addValidators(validaTblUsuarioCadCompleto);
        
    }
    
    @InitBinder("formAlterarSenha")
    public void initBinderSenha(WebDataBinder binder) {
        binder.addValidators(validaTblUsuarioSenha);
        
    }
    
	//salva o form com o cadastro simples/basico
	@RequestMapping(value = "/cadastro/simples", method = RequestMethod.POST)
	public String salvarCadastroSimples(Model model,@Validated @ModelAttribute(name="formCadastroSimples") TblUsuario tblUsuario,BindingResult bindingResult,HttpServletRequest request) {
		model.addAttribute("tab",2);
		if (bindingResult.hasErrors()) {
			return "modal.login";
        }
		uhereModel.salvarUsuario(tblUsuario,request);
		return "redirect:/tela/mensagem?titulo=mensagem.sucesso&msg=mensagem.sucesso.cadastro&isModal=true";
	}
	
	//tela para salvar e reenviar email de cadastro caso ocorra erro 
	@RequestMapping(value = "/reenviar/email", method = RequestMethod.POST)
	public String telaReenviarEmail(Model model,@ModelAttribute(name="tblUsuario") TblUsuario tblUsuario,HttpServletRequest request) {
		tblUsuario = uhereModel.getTblUsuario(tblUsuario);
		uhereModel.reenviarEmailConfirmacao(tblUsuario,request);
	    return "redirect:/tela/mensagem?titulo=mensagem.sucesso&msg=mensagem.reenvio.registro&isModal=false"; 
	}
	
	@RequestMapping(value = "/cadastro/confirma", method = RequestMethod.GET)
	public String confirmaRegistro(Model model,@RequestParam("usuario") String usuario, @RequestParam("token") String token) {
		TblUsuario tblUsuario = new TblUsuario();
		tblUsuario.setEmail(usuario);
		tblUsuario = uhereModel.getTblUsuario(tblUsuario);
	    if(tblUsuario.getAtivo())
	    	return "redirect:/";
	    	
		if(!tblUsuario.getToken().equals(token)) 
	    	return "redirect:/cliente/erro?msg="+"mensagem.erro.registro.token&usuario=" + tblUsuario.getEmail();
	    
	    if(tblUsuario.getDataExpirar().before(Calendar.getInstance())) 
	    	return "redirect:/cliente/erro?msg="+"mensagem.erro.registro.expirar&usuario=" + tblUsuario.getEmail();
	    
	    uhereModel.confirmaRegistro(tblUsuario);
	    return "redirect:/tela/mensagem?titulo=mensagem.sucesso&msg=mensagem.sucesso.registro&isModal=false"; 
	}

	@RequestMapping(value = "/erro", method = RequestMethod.GET )
	public String telaErroRegistro(Model model,@RequestParam String msg,@RequestParam("usuario") String usuario) {
		model.addAttribute("mensagem",msg);
		model.addAttribute("usuario",usuario);
		return "erro.registro";
	}

	//chama a tela de completar ou alterar cadastro
	@RequestMapping(value = "/tela/completar", method = RequestMethod.GET)
	public String telaCadastroCompleto(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		TblUsuario tblUsuario = new TblUsuario();
		tblUsuario.setEmail(auth.getName());
		tblUsuario = uhereModel.getTblUsuario(tblUsuario);
		model.addAttribute("formCadastroCompleto",tblUsuario);
		model.addAttribute("listEstado",uhereModel.getListUf());
		if(tblUsuario.getTblCidade() != null)
			model.addAttribute("listCidade",uhereModel.getListCidade(tblUsuario.getTblUf()));
		return "completar.cadastro";
	}
	
	//salva o form de cadastro completo
	@RequestMapping(value = "/cadastro/completo", method = RequestMethod.POST)
	public String salvarCadastroCompleto(Model model,@Validated @ModelAttribute(name="formCadastroCompleto") TblUsuario tblUsuario,BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("listEstado",uhereModel.getListUf());
			model.addAttribute("listCidade",uhereModel.getListCidade(tblUsuario.getTblUf()));
			return "completar.cadastro";
        }
		uhereModel.completarCadastro(tblUsuario);
		return "redirect:/tela/mensagem?titulo=mensagem.sucesso&msg=mensagem.sucesso.registro&isModal=false";
	}
	
	//chama a tela modificar senha
	@RequestMapping(value = "/tela/modificar/senha", method = RequestMethod.GET)
	public String telaModificarSenha(Model model) {
		return "modificar.senha";
	}
	
	//salva o form de modificar senha
	@RequestMapping(value = "/cadastro/senha", method = RequestMethod.POST)
	public String salvarModificarSenha(Model model,@Validated @ModelAttribute(name="formAlterarSenha") TblUsuario tblUsuario,BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return "modificar.senha";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		tblUsuario.setEmail(auth.getName());
		uhereModel.modificarSenha(tblUsuario);
		return "redirect:/tela/mensagem?titulo=mensagem.sucesso&msg=mensagem.sucesso.alterar.senha&isModal=false";
	}
	
}
