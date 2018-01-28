package com.uhere.auto.model.validator;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.uhere.auto.entity.TblUsuario;

@Component
public class ValidaTblUsuarioCadCompleto implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return TblUsuario.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		TblUsuario tblUsuario = (TblUsuario) target;
		
		//validar campo razao social
		if(tblUsuario.getRazaoSocial() == null) 
			errors.rejectValue("razaoSocial","mensagem.erro.nome.null");
		else if(tblUsuario.getRazaoSocial().trim().length() < 3) 
			errors.rejectValue("razaoSocial","mensagem.erro.nome.min");
		
		//validar campo telefone e celular
		if(tblUsuario.getTelefone() == null && tblUsuario.getCelular() == null) 
			errors.rejectValue("telefone","mensagem.erro.telefone.null");
		else if(!StringUtils.isNumeric(tblUsuario.getTelefone().toString().trim())) 
			errors.rejectValue("telefone","mensagem.erro.telefone.null");
		else if(tblUsuario.getCelular() != null && !StringUtils.isNumeric(tblUsuario.getCelular().toString().trim())) 
			errors.rejectValue("telefone","mensagem.erro.telefone.null");
		
		//validar campo cep
		if(tblUsuario.getCep() == null) 
			errors.rejectValue("cep","mensagem.erro.cep.invalido");
		else if(!StringUtils.isNumeric(tblUsuario.getCep().toString().trim()) || tblUsuario.getCep().toString().length() < 7)
			errors.rejectValue("cep","mensagem.erro.cep.invalido");
		
		//endereco
		if(tblUsuario.getEndereco() == null || tblUsuario.getEndereco().isEmpty() || tblUsuario.getCep().toString().length() < 4) 
			errors.rejectValue("endereco","mensagem.erro.endereco.invalido");
		
		//numero
		if(tblUsuario.getNumero() == null || tblUsuario.getNumero().isEmpty()) 
			errors.rejectValue("numero","mensagem.erro.numero.invalido");
		
		//bairro
		if(tblUsuario.getBairro() == null || tblUsuario.getBairro().isEmpty() || tblUsuario.getBairro().toString().length() < 4) 
			errors.rejectValue("bairro","mensagem.erro.bairro.invalido");
		
		//uf
		if(tblUsuario.getTblUf() == null)
			errors.rejectValue("uf","mensagem.erro.uf.invalido");
		else if(tblUsuario.getTblUf().getChave().isEmpty())
			errors.rejectValue("uf","mensagem.erro.uf.invalido");
		
		//cidade
		if(tblUsuario.getTblCidade() == null)
			errors.rejectValue("uf","mensagem.erro.cidade.invalido");
		else if(tblUsuario.getTblCidade() == null)
			errors.rejectValue("uf","mensagem.erro.cidade.invalido");
		
	}
}
