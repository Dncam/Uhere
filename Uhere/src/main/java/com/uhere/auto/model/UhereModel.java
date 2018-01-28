package com.uhere.auto.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.uhere.auto.entity.TblTipoAnuncio;
import com.uhere.auto.entity.TblUf;
import com.uhere.auto.entity.TblUsuario;
import com.uhere.auto.entity.TblVeiculo;
import com.uhere.auto.entity.bean.BPesquisaAvancada;

public interface UhereModel {
	public List<TblMarca> getListMarca();
	public List<TblUf> getListUf();
	public List<TblModelo> getListModelo(TblMarca tblMarca);
	public List<TblCidade> getListCidade(TblUf tblUf);
	public List<TblCambio> getListCambio();
	public List<TblCombustivel> getListCombustivel();
	public List<TblOpcionais> getListOpcionais();
	public List<TblCor> getListCor();
	public List<TblDocumentacao> getListDocumentacao();
	public List<TblCarroceria> getListCarroceria();
	public List<TblNecessidade> getListNecessidade();
	public List<TblTipoAnuncio> getListTipoAnuncio();
	public List<Long> getListAno();
	public void salvarUsuario(TblUsuario usuario,HttpServletRequest request);
	public void completarCadastro(TblUsuario tblUsuario);
	public void reenviarEmailConfirmacao(TblUsuario tblUsuario,HttpServletRequest request);
	public void recuperarSenha(TblUsuario tblUsuario,HttpServletRequest request);
	public void modificarSenha(TblUsuario tblUsuario);
	public void confirmaRegistro(TblUsuario tblUsuario);
	public List<TblAnuncio> getMeusAnuncios(String email);
	public List<TblAnuncio> getListAnuncio(String descricao);
	public List<TblAnuncio> getListAnuncio(BPesquisaAvancada bPesquisaAvancada);
	public void salvarAnuncio(TblAnuncio tblAnuncio,HttpServletRequest request);
	public void atualizarAnuncio(TblAnuncio tblAnuncio,HttpServletRequest request);
	public boolean validaNAnunciosbyUsuario(String email);
	public TblUsuario getTblUsuario(TblUsuario usuario);
	public TblAnuncio getAnuncio(String chave);
	public TblVeiculo getVeiculo(Long renavam);
}
