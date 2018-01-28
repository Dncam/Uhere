package com.uhere.auto.model.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.uhere.auto.entity.TblUsuario;
import com.uhere.auto.model.UhereModel;

@Component
public class ValidaTblUsuarioReenvioSenha implements Validator {
	
	@Autowired
	private UhereModel estruturaServ;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return TblUsuario.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		TblUsuario tblUsuario = (TblUsuario) target;		
		//validar campo senha
		if(tblUsuario.getEmail() == null || tblUsuario.getEmail().trim().isEmpty()) {
			errors.rejectValue("email","mensagem.erro.email.null");
		}else if(estruturaServ.getTblUsuario(tblUsuario) == null) {
			errors.rejectValue("email","mensagem.erro.login.usuario");
		}else if(estruturaServ.getTblUsuario(tblUsuario).getAtivo() == false) {
			errors.rejectValue("email","mensagem.erro.login.disabilitado");
		}
	}
}
