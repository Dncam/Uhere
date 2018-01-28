package com.uhere.auto.model.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.uhere.auto.entity.TblLeilao;

@Component
public class ValidaTblLeilaoCadastrar implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return TblLeilao.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		TblLeilao tblLeilao = (TblLeilao) target;
		if(tblLeilao.getTblMarca() == null || tblLeilao.getTblMarca().getChave() == null)
			errors.rejectValue("tblMarca","vendas.criar.leilao.mensagem.erro.marca.null");
		if(tblLeilao.getTblModelo() == null || tblLeilao.getTblModelo().getChave() == null)
			errors.rejectValue("tblModelo","vendas.criar.leilao.mensagem.erro.modelo.null");
		if(tblLeilao.getAnoModeloMinimo() != null && tblLeilao.getAnoModeloMaximo() != null)
			if(tblLeilao.getAnoModeloMaximo() < tblLeilao.getAnoModeloMinimo())
				errors.rejectValue("anoModeloMinimo","vendas.criar.leilao.mensagem.erro.anoMaximo.invalido");
		if(tblLeilao.getQuilometragemMinimo() != null && tblLeilao.getQuilometragemMaxima() != null)
			if(tblLeilao.getQuilometragemMaxima() < tblLeilao.getQuilometragemMinimo())
				errors.rejectValue("quilometragemMinimo","vendas.criar.leilao.mensagem.erro.QuilometragemMaxima.invalido");
	}
}
