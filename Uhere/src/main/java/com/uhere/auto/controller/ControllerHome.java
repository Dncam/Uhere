package com.uhere.auto.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ControllerHome {

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws IOException {
		return "main.template";
	}
	
	//mensagem de sucesso para completar cadastro
	@RequestMapping(value = "/tela/mensagem", method = {RequestMethod.GET,RequestMethod.POST })
	public String telaMensagem(Model model,@RequestParam(required=false) String titulo,@RequestParam(required=false) String msg, @RequestParam(required=false) Boolean isModal) {
		model.addAttribute("titulo",titulo);
		model.addAttribute("mensagem",msg);
		if (isModal)
			return "modal.mensagem";
		else
			return "mensagem.padrao";
	}
}
