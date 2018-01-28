package com.uhere.auto.model.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.uhere.auto.entity.TblUsuario;

@Component
public class ValidaTblUsuarioSenha implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return TblUsuario.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		TblUsuario tblUsuario = (TblUsuario) target;		
		//validar campo senha
		if(tblUsuario.getSenha() == null || tblUsuario.getSenha().trim().length() < 4) {
			errors.rejectValue("senha","mensagem.erro.senha.null");
		}else if(tblUsuario.getConfirmarSenha() == null || !tblUsuario.getSenha().equals(tblUsuario.getConfirmarSenha())) {
			errors.rejectValue("senha","mensagem.erro.confirmarSenha.null");
		}
	}
}
