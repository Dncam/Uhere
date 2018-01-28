package com.uhere.auto.model.validator;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.uhere.auto.entity.TblAnuncio;
import com.uhere.auto.model.UhereModel;

@Component
public class ValidaTblAnuncioCadastrar implements Validator {

	@Autowired
	private UhereModel UhereModel;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return TblAnuncio.class.isAssignableFrom(clazz);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void validate(Object target, Errors errors) {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		request.getParameterMap();
		TblAnuncio tblAnuncio = (TblAnuncio) target;
		if(!(Boolean)request.getSession().getAttribute("alterar"))
			if(tblAnuncio.getTblVeiculo().getRenavam() == null)
				errors.rejectValue("tblVeiculo.renavam","vendas.criar.anuncio.mensagem.erro.renavam.null");
			else {
				if(!validadorRenavam(tblAnuncio.getTblVeiculo().getRenavam()))
					errors.rejectValue("tblVeiculo.renavam","vendas.criar.anuncio.mensagem.erro.renavam.invalido");
				if(UhereModel.getVeiculo(tblAnuncio.getTblVeiculo().getRenavam()) != null)
					errors.rejectValue("tblVeiculo.renavam","vendas.criar.anuncio.mensagem.erro.renavam.existente");
			}
		if(tblAnuncio.getTblUf() == null || tblAnuncio.getTblUf().getChave() == null || tblAnuncio.getTblUf().getChave().isEmpty())
			errors.rejectValue("tblUf","vendas.criar.anuncio.mensagem.erro.uf.null");
		if(tblAnuncio.getTblCidade() == null || tblAnuncio.getTblCidade().getChave() == null)
			errors.rejectValue("tblCidade","vendas.criar.anuncio.mensagem.erro.cidade.null");
		if(tblAnuncio.getTblVeiculo().getTblMarca() == null || tblAnuncio.getTblVeiculo().getTblMarca().getChave() == null)
			errors.rejectValue("tblVeiculo.tblMarca.chave","vendas.criar.anuncio.mensagem.erro.marca.null");
		if(tblAnuncio.getTblVeiculo().getTblModelo() == null || tblAnuncio.getTblVeiculo().getTblModelo().getChave() == null)
			errors.rejectValue("tblVeiculo.tblModelo.chave","vendas.criar.anuncio.mensagem.erro.modelo.null");
		if(tblAnuncio.getTblVeiculo().getAnoFabricacao() == null)
			errors.rejectValue("tblVeiculo.anoFabricacao","vendas.criar.anuncio.mensagem.erro.ano.fabricacao.null");
		if(tblAnuncio.getTblVeiculo().getAnoModelo() == null)
			errors.rejectValue("tblVeiculo.anoModelo","vendas.criar.anuncio.mensagem.erro.ano.modelo.null");
		if(tblAnuncio.getPrecoInicial() == null)
			errors.rejectValue("precoInicial","vendas.criar.anuncio.mensagem.erro.preco.inicial.null");
		if(tblAnuncio.getPrecoFinal() == null)
			errors.rejectValue("precoFinal","vendas.criar.anuncio.mensagem.erro.preco.final.null");
		if(tblAnuncio.getPrecoInicial() != null && tblAnuncio.getPrecoFinal() != null)
			if(tblAnuncio.getPrecoInicial().doubleValue() <= tblAnuncio.getPrecoFinal().doubleValue())
				errors.rejectValue("precoInicial","vendas.criar.anuncio.mensagem.erro.preco.inicial.invalido");
		if(tblAnuncio.getTblVeiculo().getQuilometragem() == null)
			errors.rejectValue("tblVeiculo.quilometragem","vendas.criar.anuncio.mensagem.erro.quilometragem.null");
		if(tblAnuncio.getTblVeiculo().getTblCambio() == null || tblAnuncio.getTblVeiculo().getTblCambio().getChave() == null)
			errors.rejectValue("tblVeiculo.tblCambio.chave","vendas.criar.anuncio.mensagem.erro.cambio.null");
		if(tblAnuncio.getTblVeiculo().getTblCombustivel() == null || tblAnuncio.getTblVeiculo().getTblCombustivel().getChave() == null)
			errors.rejectValue("tblVeiculo.tblCombustivel.chave","vendas.criar.anuncio.mensagem.erro.combustivel.null");
		if(tblAnuncio.getTblVeiculo().getTblCor() == null || tblAnuncio.getTblVeiculo().getTblCor().getChave() == null)
			errors.rejectValue("tblVeiculo.tblCor.chave","vendas.criar.anuncio.mensagem.erro.cor.null");
		if(tblAnuncio.getTblVeiculo().getTblDocumentacao() == null || tblAnuncio.getTblVeiculo().getTblDocumentacao().getChave() == null)
			errors.rejectValue("tblVeiculo.tblDocumentacao.chave","vendas.criar.anuncio.mensagem.erro.documentacao.null");
		if(tblAnuncio.getTblVeiculo().getTblCarroceria() == null || tblAnuncio.getTblVeiculo().getTblCarroceria().getChave() == null)
			errors.rejectValue("tblVeiculo.tblCarroceria.chave","vendas.criar.anuncio.mensagem.erro.carroceria.null");
		if(tblAnuncio.getTblVeiculo().getTblNecessidade() == null || tblAnuncio.getTblVeiculo().getTblNecessidade().getChave() == null)
			errors.rejectValue("tblVeiculo.tblNecessidade.chave","vendas.criar.anuncio.mensagem.erro.necessidade.null");
		
		Map<Long,MultipartFile> arquivos = (Map<Long, MultipartFile>) request.getAttribute("arquivos");
		tblAnuncio.getTblVeiculo().setFotos(request.getSession().getAttribute("imagensValidas") == null ?
				new LinkedHashMap<Long,byte[]>() : (Map<Long, byte[]>) request.getSession().getAttribute("imagensValidas"));				
		for(Long key : arquivos.keySet())
		{
			if(arquivos.get(key).getSize() == 0 && tblAnuncio.getTblVeiculo().getFotos().get(key) != null && tblAnuncio.getTblVeiculo().getFotos().get(key).length > 0)
				continue;
			
			boolean erro = false;
			Double sizeMB = Double.parseDouble(String.valueOf(arquivos.get(key).getSize())) / 1024 / 1024 ;				
			if(sizeMB > 1.0)
				errors.rejectValue("tblVeiculo.fotos","vendas.criar.anuncio.mensagem.erro.fotos.tamanho",new Object[]{key},null);
			
			byte[] imageByte = null ;
			try {
				imageByte = arquivos.get(key).getBytes();
				BufferedImage imagem = ImageIO.read(new ByteArrayInputStream(imageByte));
				if(imagem == null) {
					errors.rejectValue("tblVeiculo.fotos","vendas.criar.anuncio.mensagem.erro.fotos.invalida",new Object[]{key},null);
					erro = true;
				}else if(imagem.getHeight() < 483 || imagem.getWidth() < 700) {
					errors.rejectValue("tblVeiculo.fotos","vendas.criar.anuncio.mensagem.erro.fotos.invalida",new Object[]{key},null);
					erro = true;
				}
				imagem = null ;
			} catch (IOException e) {
				errors.rejectValue("tblVeiculo.fotos","vendas.criar.anuncio.mensagem.erro.fotos.invalida",new Object[]{key},null);
				erro = true;
			}
			if(!erro) 
				tblAnuncio.getTblVeiculo().getFotos().put(key, imageByte);
		}
		request.getSession().setAttribute("imagensValidas", tblAnuncio.getTblVeiculo().getFotos());
		arquivos = null ;
	}
	
	private boolean validadorRenavam(Long renavam) {
		String strRenavam = renavam.toString();
		 // Completa com zeros a esquerda se for no padrao antigo de 9 digitos
		 if(strRenavam.matches("^([0-9]{9})$"))
			 strRenavam = "00" + strRenavam;
		 
		 // Valida se possui 11 digitos pos formatacao
		 if(!strRenavam.matches("[0-9]{11}")){
			 return false;
		 }

		 // Remove o digito (11 posicao)
		 String renavamSemDigito = strRenavam.substring(0, 10);
		 
		 // Inverte os caracteres (reverso)
		 String renavamReversoSemDigito = new StringBuffer(renavamSemDigito).reverse().toString();
		 int soma = 0;
		 
		 // Multiplica as strings reversas do renavam pelos numeros multiplicadores
		 // para apenas os primeiros 8 digitos de um total de 10
		 // Exemplo: renavam reverso sem digito = 69488936
		 // 6, 9, 4, 8, 8, 9, 3, 6
		 // * * * * * * * *
		 // 2, 3, 4, 5, 6, 7, 8, 9 (numeros multiplicadores - sempre os mesmos [fixo])
		 // 12 + 27 + 16 + 40 + 48 + 63 + 24 + 54
		 // soma = 284
		 for (int i = 0; i < 8; i++) {
			 Integer algarismo = Integer.parseInt(renavamReversoSemDigito.substring(i, i + 1));
			 Integer multiplicador = i + 2;
			 soma += algarismo * multiplicador;
		 }
		  
		 // Multiplica os dois ultimos digitos e soma
		 soma += Character.getNumericValue(renavamReversoSemDigito.charAt(8)) * 2;
		 soma += Character.getNumericValue(renavamReversoSemDigito.charAt(9)) * 3;
		 
		 // mod11 = 284 % 11 = 9 (resto da divisao por 11)
		 int mod11 = soma % 11;
		 
		 // Faz-se a conta 11 (valor fixo) - mod11 = 11 - 9 = 2
		 int ultimoDigitoCalculado = 11 - mod11;
		 
		 // ultimoDigito = Caso o valor calculado anteriormente seja 10 ou 11, transformo ele em 0
		 // caso contrario, eh o proprio numero
		 ultimoDigitoCalculado = (ultimoDigitoCalculado >= 10 ? 0 : ultimoDigitoCalculado);
		 
		 // Pego o ultimo digito do renavam original (para confrontar com o calculado)
		 int digitoRealInformado = Integer.valueOf(strRenavam.substring(strRenavam.length()-1, strRenavam.length()));
		 
		 // Comparo os digitos calculado e informado
		 if(ultimoDigitoCalculado == digitoRealInformado)
			 return true;
		 
		 return false;
	}
}
