package com.uhere.auto.model.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.uhere.auto.entity.TblUsuario;
import com.uhere.auto.model.UhereModel;

@Component
public class ValidaTblUsuarioCadSimples implements Validator {

	private final int[] pesoCPF = { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };
	private final int[] pesoCNPJ = { 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };
	
	@Autowired
	private UhereModel estruturaServ;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return TblUsuario.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		TblUsuario tblUsuario = (TblUsuario) target;
		
		//validar campo cnpj
		if(tblUsuario.getCpfCnpj() == null) {
			errors.rejectValue("cpfCnpj","mensagem.erro.cnpj.cpf.null");
		}else if(!StringUtils.isNumeric(tblUsuario.getCpfCnpj().toString().trim())) {
			errors.rejectValue("cpfCnpj","mensagem.erro.cnpj.cpf.divergente");
		}else if(estruturaServ.getTblUsuario(tblUsuario) != null) {
			errors.rejectValue("cpfCnpj","mensagem.erro.usuario.cadastrado");
		}else if(tblUsuario.getCpfCnpj().toString().length() == 14) {
			if(!isValidCNPJ(tblUsuario.getCpfCnpj().toString())) {
				errors.rejectValue("cpfCnpj","mensagem.erro.cnpj.divergente");
			}
		}else if(tblUsuario.getCpfCnpj().toString().length() == 11) {
			if(!isValidCPF(tblUsuario.getCpfCnpj().toString())) {
				errors.rejectValue("cpfCnpj","mensagem.erro.cpf.divergente");
			}
		}else {
			errors.rejectValue("cpfCnpj","mensagem.erro.cnpj.cpf.divergente");
		}
		
		//validar campo razao social
		if(tblUsuario.getRazaoSocial() == null) {
			errors.rejectValue("razaoSocial","mensagem.erro.nome.null");
		}else if(tblUsuario.getRazaoSocial().trim().length() < 3) {
			errors.rejectValue("razaoSocial","mensagem.erro.nome.min");
		}
		
		//validar campo email
		if(tblUsuario.getEmail() == null || tblUsuario.getEmail().trim().length() == 0) {
			errors.rejectValue("email","mensagem.erro.email.null");
		}else if(!isValidEmail(tblUsuario.getEmail())) {
			errors.rejectValue("email","mensagem.erro.email.divergente");
		}
		
		//validar campo telefone e celular
		if(tblUsuario.getTelefone() == null && tblUsuario.getCelular() == null) {
			errors.rejectValue("telefone","mensagem.erro.telefone.null");
		}else if(!StringUtils.isNumeric(tblUsuario.getTelefone().toString().trim())) {
			errors.rejectValue("telefone","mensagem.erro.telefone.null");
		}else if(tblUsuario.getCelular() != null && !StringUtils.isNumeric(tblUsuario.getCelular().toString().trim())) {
			errors.rejectValue("telefone","mensagem.erro.telefone.null");
		}
		
		//validar campo senha
		if(tblUsuario.getSenha() == null || tblUsuario.getSenha().trim().length() < 4) {
			errors.rejectValue("senha","mensagem.erro.senha.null");
		}else if(tblUsuario.getConfirmarSenha() == null || !tblUsuario.getSenha().equals(tblUsuario.getConfirmarSenha())) {
			errors.rejectValue("senha","mensagem.erro.confirmarSenha.null");
		}
	}
	
	private int calcularDigito(String str, int[] peso) {
		int soma = 0;
		for (int indice = str.length() - 1, digito; indice >= 0; indice--) {
			digito = Integer.parseInt(str.substring(indice, indice + 1));
			soma += digito * peso[peso.length - str.length() + indice];
		}
		soma = 11 - soma % 11;
		return soma > 9 ? 0 : soma;
	}

	private boolean isValidCPF(String cpf) {
		if ((cpf == null) || (cpf.length() != 11))
			return false;

		Integer digito1 = calcularDigito(cpf.substring(0, 9), pesoCPF);
		Integer digito2 = calcularDigito(cpf.substring(0, 9) + digito1, pesoCPF);
		return cpf.equals(cpf.substring(0, 9) + digito1.toString() + digito2.toString());
	}

	private boolean isValidCNPJ(String cnpj) {
		if ((cnpj == null) || (cnpj.length() != 14))
			return false;

		Integer digito1 = calcularDigito(cnpj.substring(0, 12), pesoCNPJ);
		Integer digito2 = calcularDigito(cnpj.substring(0, 12) + digito1, pesoCNPJ);
		return cnpj.equals(cnpj.substring(0, 12) + digito1.toString() + digito2.toString());
	}
	
	private boolean isValidEmail(String email)
    {
        boolean isEmailIdValid = false;
        if (email != null && email.length() > 0) {
            String expression = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{2,4}$";
            Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
            Matcher matcher = pattern.matcher(email);
            if (matcher.matches()) {
                isEmailIdValid = true;
            }
        }
        return isEmailIdValid;
    }

}
