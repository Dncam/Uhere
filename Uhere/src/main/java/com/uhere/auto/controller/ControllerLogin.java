package com.uhere.auto.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.uhere.auto.entity.TblUsuario;
import com.uhere.auto.model.UhereModel;
import com.uhere.auto.model.validator.ValidaTblUsuarioReenvioSenha;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ControllerLogin {

	@Autowired
	private UhereModel uhereModel;
	
    @Inject
    private ValidaTblUsuarioReenvioSenha validaTblUsuarioReenvioSenha;
    
    @InitBinder("formReenvioSenha")
    public void initBinderSimples(WebDataBinder binder) {
        binder.addValidators(validaTblUsuarioReenvioSenha);
        
    }
	
	//realizar login
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String modalLogin(Model model, @RequestParam(required = false) String error,@RequestParam(required = false) String msg) {
		model.addAttribute("tab",0);
		if (error != null && !error.isEmpty()) {
			model.addAttribute("error", error);
			model.addAttribute("msg", msg);
		}
		return "modal.login";
	}

	//chama o logout
	@RequestMapping(value = "/login/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		return "forward:/";
	}
	
	//envia o email para modificar senha
	@RequestMapping(value = "/login/modificar/senha", method = RequestMethod.POST)
	public String salvarModificarSenha(Model model,@Validated @ModelAttribute(name="formReenvioSenha") TblUsuario tblUsuario,BindingResult bindingResult, HttpServletRequest request) {
		model.addAttribute("tab",1);
		if (bindingResult.hasErrors())
			return "modal.login";
		uhereModel.recuperarSenha(tblUsuario,request);
		return "forward:/tela/mensagem?titulo=mensagem.sucesso&msg=mensagem.reenvio.senha&isModal=true";
	}
}
