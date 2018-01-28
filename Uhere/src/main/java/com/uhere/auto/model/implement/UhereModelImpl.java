package com.uhere.auto.model.implement;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.function.Predicate;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uhere.auto.entity.TblAnuncio;
import com.uhere.auto.entity.TblCambio;
import com.uhere.auto.entity.TblCarroceria;
import com.uhere.auto.entity.TblCidade;
import com.uhere.auto.entity.TblCombustivel;
import com.uhere.auto.entity.TblCor;
import com.uhere.auto.entity.TblDocumentacao;
import com.uhere.auto.entity.TblMarca;
import com.uhere.auto.entity.TblModelo;
import com.uhere.auto.entity.TblNecessidade;
import com.uhere.auto.entity.TblOpcionais;
import com.uhere.auto.entity.TblPermissoes;
import com.uhere.auto.entity.TblTipoAnuncio;
import com.uhere.auto.entity.TblUf;
import com.uhere.auto.entity.TblUsuario;
import com.uhere.auto.entity.TblVeiculo;
import com.uhere.auto.entity.bean.BPesquisaAvancada;
import com.uhere.auto.entity.enums.Status;
import com.uhere.auto.model.UhereModel;
import com.uhere.auto.repository.RepositoryTblAnuncio;
import com.uhere.auto.repository.RepositoryTblCambio;
import com.uhere.auto.repository.RepositoryTblCarroceria;
import com.uhere.auto.repository.RepositoryTblCidade;
import com.uhere.auto.repository.RepositoryTblCombustivel;
import com.uhere.auto.repository.RepositoryTblCor;
import com.uhere.auto.repository.RepositoryTblDocumentacao;
import com.uhere.auto.repository.RepositoryTblMarca;
import com.uhere.auto.repository.RepositoryTblModelo;
import com.uhere.auto.repository.RepositoryTblNecessidade;
import com.uhere.auto.repository.RepositoryTblOpcionais;
import com.uhere.auto.repository.RepositoryTblTipoAnuncio;
import com.uhere.auto.repository.RepositoryTblUf;
import com.uhere.auto.repository.RepositoryTblUsuario;
import com.uhere.auto.repository.RepositoryTblVeiculo;

@Service
public class UhereModelImpl implements UhereModel {

	@Autowired
	private RepositoryTblMarca repositoryTblMarca;
	
	@Autowired
	private RepositoryTblModelo repositoryTblModelo;
	
	@Autowired
	private RepositoryTblCambio repositoryTblCambio;
	
	@Autowired
	private RepositoryTblCombustivel repositoryTblCombustivel;
	
	@Autowired
	private RepositoryTblCor repositoryTblCor;
	
	@Autowired
	private RepositoryTblOpcionais repositoryTblOpcionais;
	
	@Autowired
	private RepositoryTblDocumentacao repositoryTblDocumentacao;
	
	@Autowired
	private RepositoryTblCarroceria repositoryTblCarroceria ;
	
	@Autowired
	private RepositoryTblTipoAnuncio repositoryTblTipoAnuncio;
	
	@Autowired
	private RepositoryTblNecessidade repositoryTblNecessidade;
	
	@Autowired
	private RepositoryTblVeiculo repositoryTblVeiculo;
	
	@Autowired
	private RepositoryTblUf repositoryTblUf;
	
	@Autowired
	private RepositoryTblCidade repositoryTblCidade;
	
	@Autowired
	private RepositoryTblUsuario repositoryTblUsuario;
	
	@Autowired
	private RepositoryTblAnuncio repositoryTblAnuncio;
	
    @Autowired
    private MessageSource messages;
	
	@Override
	@Transactional(readOnly=true)
	public List<TblMarca> getListMarca(){
		List<TblMarca> marcas = repositoryTblMarca.findAll();
		return marcas;
	}

	@Override
	@Transactional(readOnly=true)
	public List<TblModelo> getListModelo(TblMarca tblMarca) {
		List<TblModelo> modelos = null ;
			if(tblMarca != null)
				modelos = repositoryTblModelo.findByTblMarca(tblMarca);
		return modelos;
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<TblCambio> getListCambio() {
		List<TblCambio> cambios = repositoryTblCambio.findAll();
		return cambios;
	}

	@Override
	@Transactional(readOnly=true)
	public List<TblCombustivel> getListCombustivel() {
		List<TblCombustivel> combustivels = repositoryTblCombustivel.findAll();
		return combustivels;
	}

	@Override
	@Transactional(readOnly=true)
	public List<TblOpcionais> getListOpcionais() {
		List<TblOpcionais> opcionais = repositoryTblOpcionais.findAll();
		return opcionais;
	}

	@Override
	@Transactional(readOnly=true)
	public List<TblCor> getListCor() {
		List<TblCor> cores = repositoryTblCor.findAll();
		return cores;
	}

	@Override
	@Transactional(readOnly=true)
	public List<TblDocumentacao> getListDocumentacao() {
		List<TblDocumentacao> documentacoes = repositoryTblDocumentacao.findAll();
		return documentacoes;
	}

	@Override
	@Transactional(readOnly=true)
	public List<TblCarroceria> getListCarroceria() {
		List<TblCarroceria> carrocerias = repositoryTblCarroceria.findAll();
		return carrocerias;
	}

	@Override
	@Transactional(readOnly=true)
	public List<TblNecessidade> getListNecessidade() {
		List<TblNecessidade> necessidades = repositoryTblNecessidade.findAll();
		return necessidades;
	}

	@Override
	@Transactional(readOnly=true)
	public List<TblTipoAnuncio> getListTipoAnuncio() {
		List<TblTipoAnuncio> tipoAnuncios = repositoryTblTipoAnuncio.findAll();
		return tipoAnuncios;
	}

	@Override
	@Transactional(readOnly=true)
	public List<Long> getListAno() {
		List<Long> anos = repositoryTblAnuncio.getAnos();
		return anos;
	}

	@Override
	@Transactional(readOnly=true)
	public List<TblUf> getListUf() {
		List<TblUf> ufs = repositoryTblUf.findAll();
		return ufs;
	}

	@Override
	@Transactional(readOnly=true)
	public List<TblCidade> getListCidade(TblUf tblUf) {
		List<TblCidade> cidades = null ;
		if(tblUf != null)
			cidades = repositoryTblCidade.findByTblUf(tblUf);
		return cidades;
	}
	
	//busca os dados de usuarios já cadastrados na base de dados
	@Override
	@Transactional(readOnly=true)
	public TblUsuario getTblUsuario(TblUsuario tblUsuario) {
		if(tblUsuario.getCpfCnpj() != null)
			return repositoryTblUsuario.findByCpfCnpj(tblUsuario.getCpfCnpj());
		else if(tblUsuario.getEmail() != null)
			return repositoryTblUsuario.findByEmail(tblUsuario.getEmail());
		return null;
	}
	
	//salva o usuario e envia o email
	@Override
	@Transactional(readOnly=false)
	public void salvarUsuario(TblUsuario tblUsuario,HttpServletRequest request) {
        //add token para validação
  		Calendar expirar = Calendar.getInstance();
  		expirar.add(Calendar.DAY_OF_MONTH,+1);
  		tblUsuario.setDataExpirar(expirar);
  		tblUsuario.setToken(UUID.randomUUID().toString());
  		//set ativacao do usuario
  		tblUsuario.setAtivo(false);
  		tblUsuario.setSenha(new BCryptPasswordEncoder().encode(tblUsuario.getSenha()));
  		//adiciona os tipos de acessos
  		List<TblPermissoes> setPermissao = new ArrayList<TblPermissoes>();
		TblPermissoes permissao = new TblPermissoes();
		if (tblUsuario.getCpfCnpj().toString().length() == 14 ) 
			permissao.setChave('C') ;
		else
			permissao.setChave('U');
		setPermissao.add(permissao);
		tblUsuario.setTblPermissoes(setPermissao);
		tblUsuario.setnAnuncios(1);
		//salva o usuario na base
		repositoryTblUsuario.save(tblUsuario);
		// envia um email para confirmação
		String url = request.getScheme() + "://" ;
		url += request.getServerName() + ":";
		url += request.getServerPort() ;
		url += request.getContextPath();
		url += "/cliente/cadastro/confirma";
        String urlConfirm = url + "?usuario="+tblUsuario.getEmail()+"&token=" + tblUsuario.getToken();
        String msg = messages.getMessage("usuario.basico.cadastro.mensagem.corpo.email", null, request.getLocale()) ;
        String subject = messages.getMessage("usuario.basico.cadastro.mensagem.corpo.titulo", null, request.getLocale()) ;
        new UhereUtils().sendEmail(urlConfirm, msg, subject, tblUsuario);
	}

	//completa o cadastro de clientes
	@Override
	@Transactional(readOnly=false)
	public void completarCadastro(TblUsuario tblUsuario) {
		TblUsuario tblUsuarioAux = getTblUsuario(tblUsuario);
		tblUsuario.setCpfCnpj(tblUsuarioAux.getCpfCnpj());
		tblUsuario.setEmail(tblUsuarioAux.getEmail());
		tblUsuario.setSenha(tblUsuarioAux.getSenha());
		tblUsuario.setAtivo(tblUsuarioAux.getAtivo());
		tblUsuario.setTblPermissoes(tblUsuarioAux.getTblPermissoes());
		tblUsuario.setnAnuncios(tblUsuarioAux.getnAnuncios());
		repositoryTblUsuario.save(tblUsuario);
	}
	
	//salva o usuario já validado
	@Override
	@Transactional(readOnly=false)
	public void confirmaRegistro(TblUsuario tblUsuario) {
		tblUsuario.setAtivo(true);
		tblUsuario.setToken(null);
		tblUsuario.setDataExpirar(null);
		repositoryTblUsuario.save(tblUsuario);
	}

	//update com envio de email para confirmação
	@Override
	@Transactional(readOnly=false)
	public void reenviarEmailConfirmacao(TblUsuario tblUsuario,HttpServletRequest request) {
        //add token para validação
  		Calendar expirar = Calendar.getInstance();
  		expirar.add(Calendar.DAY_OF_MONTH,+1);
  		tblUsuario.setDataExpirar(expirar);
  		tblUsuario.setToken(UUID.randomUUID().toString());
  		//set ativacao do usuario
  		tblUsuario.setAtivo(false);
		//salva o usuario na base
  		repositoryTblUsuario.save(tblUsuario);
		// envia um email para confirmação
		String url = request.getScheme() + "://" ;
		url += request.getServerName() + ":";
		url += request.getServerPort() ;
		url += request.getContextPath();
		url += "/cliente/cadastro/confirma";
        String urlConfirm = url + "?usuario="+tblUsuario.getEmail()+"&token=" + tblUsuario.getToken();   
        String msg = messages.getMessage("mensagem.email.registrar", null, request.getLocale()) ;
        String subject = messages.getMessage("usuario.basico.cadastro.mensagem.corpo.titulo", null, request.getLocale()) ;
        new UhereUtils().sendEmail(urlConfirm, msg, subject, tblUsuario);
	}

	//cria um email generico e reenvia um email
	@Override
	@Transactional(readOnly=false)
	public void recuperarSenha(TblUsuario tblUsuario,HttpServletRequest request) {
		String tempSenha = RandomStringUtils.randomAlphanumeric(5);
		tblUsuario = getTblUsuario(tblUsuario);
		tblUsuario.setSenha(tempSenha);
		tblUsuario.setSenha(new BCryptPasswordEncoder().encode(tblUsuario.getSenha()));
		repositoryTblUsuario.save(tblUsuario);
		// envia um email para confirmação
        String msg = messages.getMessage("usuario.esqueceu.senha.mensagem.corpo.email", null, request.getLocale()) ;
        msg+= " " + tempSenha;
        String subject = messages.getMessage("usuario.esqueceu.senha.mensagem.titulo.email", null, request.getLocale()) ;
        new UhereUtils().sendEmail(null, msg, subject, tblUsuario);
	}
	
	//salva nova senha do usuario
	@Override
	@Transactional(readOnly=false)
	public void modificarSenha(TblUsuario tblUsuario) {
		TblUsuario tblUsuarioAux = getTblUsuario(tblUsuario);
		tblUsuarioAux.setSenha(new BCryptPasswordEncoder().encode(tblUsuario.getSenha()));
		repositoryTblUsuario.save(tblUsuarioAux);
	}

	@Override
	@Transactional(readOnly=true)
	public List<TblAnuncio> getMeusAnuncios(String email) {
		TblUsuario tblUsuario = repositoryTblUsuario.findByEmail(email);
		List<TblAnuncio> anuncioList = repositoryTblAnuncio.findByTblUsuario(tblUsuario);
		return anuncioList;
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<TblAnuncio> getListAnuncio(String descricao) {
		String[] descricoes = descricao.split(",");
		List<TblAnuncio> anuncios = repositoryTblAnuncio.findCustomByDescricaoSplit(descricoes);
		return anuncios;
	}

	@Override
	@Transactional(readOnly=true)
	public List<TblAnuncio> getListAnuncio(BPesquisaAvancada bPesquisaAvancada) {
		List<TblAnuncio> anuncios = repositoryTblAnuncio.findCustomByBPesquisaAvancada(bPesquisaAvancada);
		return anuncios;
	}

	@Override
	@Transactional(readOnly=true)
	public TblAnuncio getAnuncio(String chave) {
		TblAnuncio tblAnuncio = repositoryTblAnuncio.findOne(chave);
		return tblAnuncio;
	}
	
	@Override
	@Transactional(readOnly=true)
	public TblVeiculo getVeiculo(Long renavam) {
		TblVeiculo tblVeiculo = repositoryTblVeiculo.findOne(renavam);
		return tblVeiculo;
	}

	@Override
	@Transactional(readOnly=false)
	public void salvarAnuncio(TblAnuncio tblAnuncio, HttpServletRequest request) {
		tblAnuncio.setDtPublicacao(Calendar.getInstance());
		Calendar validade = Calendar.getInstance();
		validade.add(Calendar.MONTH, 1);
		tblAnuncio.setValidade(validade);
		tblAnuncio.setTblTipoAnuncio(new TblTipoAnuncio(1L));
		tblAnuncio.setStatus(Status.VALIDACAO);
		String descricaoVeiculo = repositoryTblMarca.findOne(tblAnuncio.getTblVeiculo().getTblMarca().getChave()).getDescricao();
		descricaoVeiculo += " " + repositoryTblModelo.findOne(tblAnuncio.getTblVeiculo().getTblModelo().getChave()).getDescricao();
		descricaoVeiculo += " " + repositoryTblCambio.findOne(tblAnuncio.getTblVeiculo().getTblCambio().getChave()).getDescricao();
		descricaoVeiculo += " " + repositoryTblCor.findOne(tblAnuncio.getTblVeiculo().getTblCor().getChave()).getDescricao();
		descricaoVeiculo += " " + repositoryTblCombustivel.findOne(tblAnuncio.getTblVeiculo().getTblCombustivel().getChave()).getDescricao();
		descricaoVeiculo += " " + tblAnuncio.getTblVeiculo().getAnoFabricacao();
		tblAnuncio.getTblVeiculo().setDescricao(descricaoVeiculo);
		tblAnuncio.setTblUsuario(getTblUsuario(new TblUsuario(SecurityContextHolder.getContext().getAuthentication().getName())));
		//codifica as imagens
		Map<Long,byte[]> fotosMap = new HashMap<Long,byte[]>();
		for(int cont = 0 ; cont < 4; cont++)
			if(UhereUtils.isBase64(tblAnuncio.getTblVeiculo().getFotos().get(cont +0L)))
				fotosMap.put(cont +0L, tblAnuncio.getTblVeiculo().getFotos().get(cont +0L));
			else
				fotosMap.put(cont +0L,Base64.getEncoder().encode(UhereUtils.redimensionaImage(tblAnuncio.getTblVeiculo().getFotos().get(cont +0L))));
		tblAnuncio.getTblVeiculo().setFotos(fotosMap);
		//retira os campos vazios do opcionais
		if(tblAnuncio.getTblVeiculo().getTblOpcionais() != null) {
			Predicate<TblOpcionais> tbPredicate = op-> op.getChave() == 0;
			tblAnuncio.getTblVeiculo().getTblOpcionais().removeIf(tbPredicate);
		}
		repositoryTblVeiculo.save(tblAnuncio.getTblVeiculo());
		repositoryTblAnuncio.save(tblAnuncio);
	}

	@Override
	@Transactional(readOnly=false)
	public void atualizarAnuncio(TblAnuncio tblAnuncio, HttpServletRequest request) {
		TblAnuncio tblAnuncio2 = repositoryTblAnuncio.findByTblVeiculo(tblAnuncio.getTblVeiculo());
		tblAnuncio.setChave(tblAnuncio2.getChave());
		tblAnuncio.setTblUsuario(tblAnuncio2.getTblUsuario());
		tblAnuncio.setTblTipoAnuncio(tblAnuncio2.getTblTipoAnuncio());
		tblAnuncio.setValidade(tblAnuncio2.getValidade());
		tblAnuncio.setDtPublicacao(tblAnuncio2.getDtPublicacao());
		tblAnuncio.setStatus(tblAnuncio2.getStatus());
		tblAnuncio.getTblVeiculo().setTblMarca(tblAnuncio2.getTblVeiculo().getTblMarca());
		tblAnuncio.getTblVeiculo().setTblModelo(tblAnuncio2.getTblVeiculo().getTblModelo());
		tblAnuncio.getTblVeiculo().setAnoFabricacao(tblAnuncio2.getTblVeiculo().getAnoFabricacao());
		tblAnuncio.getTblVeiculo().setAnoModelo(tblAnuncio2.getTblVeiculo().getAnoModelo());
		String descricaoVeiculo = repositoryTblMarca.findOne(tblAnuncio.getTblVeiculo().getTblMarca().getChave()).getDescricao();
		descricaoVeiculo += " " + repositoryTblModelo.findOne(tblAnuncio.getTblVeiculo().getTblModelo().getChave()).getDescricao();
		descricaoVeiculo += " " + repositoryTblCambio.findOne(tblAnuncio.getTblVeiculo().getTblCambio().getChave()).getDescricao();
		descricaoVeiculo += " " + repositoryTblCor.findOne(tblAnuncio.getTblVeiculo().getTblCor().getChave()).getDescricao();
		descricaoVeiculo += " " + repositoryTblCombustivel.findOne(tblAnuncio.getTblVeiculo().getTblCombustivel().getChave()).getDescricao();
		descricaoVeiculo += " " + tblAnuncio.getTblVeiculo().getAnoFabricacao();
		tblAnuncio.getTblVeiculo().setDescricao(descricaoVeiculo);
		
		//codifica as imagens
		Map<Long,byte[]> fotosMap = new HashMap<Long,byte[]>();
		for(int cont = 0 ; cont < 4; cont++)
			if(UhereUtils.isBase64(tblAnuncio.getTblVeiculo().getFotos().get(cont +0L)))
				fotosMap.put(cont +0L, tblAnuncio.getTblVeiculo().getFotos().get(cont +0L));
			else
				fotosMap.put(cont +0L,Base64.getEncoder().encode(UhereUtils.redimensionaImage(tblAnuncio.getTblVeiculo().getFotos().get(cont +0L))));
		tblAnuncio.getTblVeiculo().setFotos(fotosMap);
		//retira os campos vazios do opcionais
		if(tblAnuncio.getTblVeiculo().getTblOpcionais() != null) {
			Predicate<TblOpcionais> tbPredicate = op-> op.getChave() == 0;
			tblAnuncio.getTblVeiculo().getTblOpcionais().removeIf(tbPredicate);
		}
		repositoryTblVeiculo.save(tblAnuncio.getTblVeiculo());
		repositoryTblAnuncio.save(tblAnuncio);
	}
	
	
	@Override
	@Transactional(readOnly=true)
	public boolean validaNAnunciosbyUsuario(String email) {
		return repositoryTblAnuncio.countByTblUsuario(email);
	}
}
