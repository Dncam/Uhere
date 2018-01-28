package com.uhere.auto.entity.bean;

import java.math.BigDecimal;
import java.util.List;

import com.uhere.auto.entity.TblCambio;
import com.uhere.auto.entity.TblCarroceria;
import com.uhere.auto.entity.TblCombustivel;
import com.uhere.auto.entity.TblCor;
import com.uhere.auto.entity.TblDocumentacao;
import com.uhere.auto.entity.TblMarca;
import com.uhere.auto.entity.TblModelo;
import com.uhere.auto.entity.TblNecessidade;
import com.uhere.auto.entity.TblOpcionais;
import com.uhere.auto.entity.TblTipoAnuncio;
import com.uhere.auto.entity.TblUf;
import com.uhere.auto.entity.enums.Uso;


public class BPesquisaAvancada{

	private String localizacao ;
	
	private Uso uso;
	
	private TblMarca tblMarca ;
	
	private TblModelo tblModelo;
	
	private Long anoMinimo ;
	
	private Long anoMaximo ;
	
	private BigDecimal precoMinimo ;
	
	private BigDecimal precoMaximo ;
	
	private Long quilometragemMinima;
	
	private Long quilometragemMaxima;
	
	private List<String> placa ;
	
	private List<TblCambio> tblCambio ;
	
	private List<TblCombustivel> tblCombustivel ;
	
	private List<TblOpcionais> tblOpcionais ;
	
	private List<Integer> numPortas ;
	
	private List<TblCor> tblCor;
	
	private Boolean blindagem ;
	
	private List<TblDocumentacao> tblDocumentacao ;
	
	private List<TblCarroceria> tblCarroceria;
	
	private List<TblNecessidade> tblNecessidade ;
	
	private List<TblTipoAnuncio> tblTipoAnuncio ;
	
	private TblUf tblUf ;
	
	private Boolean troca ;

	public String getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}

	public Uso getUso() {
		return uso;
	}

	public void setUso(Uso uso) {
		this.uso = uso;
	}

	public TblMarca getTblMarca() {
		return tblMarca;
	}

	public void setTblMarca(TblMarca tblMarca) {
		this.tblMarca = tblMarca;
	}

	public TblModelo getTblModelo() {
		return tblModelo;
	}

	public void setTblModelo(TblModelo tblModelo) {
		this.tblModelo = tblModelo;
	}

	public Long getAnoMinimo() {
		return anoMinimo;
	}

	public void setAnoMinimo(Long anoMinimo) {
		this.anoMinimo = anoMinimo;
	}

	public Long getAnoMaximo() {
		return anoMaximo;
	}

	public void setAnoMaximo(Long anoMaximo) {
		this.anoMaximo = anoMaximo;
	}

	public BigDecimal getPrecoMinimo() {
		return precoMinimo;
	}

	public void setPrecoMinimo(BigDecimal precoMinimo) {
		this.precoMinimo = precoMinimo;
	}

	public BigDecimal getPrecoMaximo() {
		return precoMaximo;
	}

	public void setPrecoMaximo(BigDecimal precoMaximo) {
		this.precoMaximo = precoMaximo;
	}

	public Long getQuilometragemMinima() {
		return quilometragemMinima;
	}

	public void setQuilometragemMinima(Long quilometragemMinima) {
		this.quilometragemMinima = quilometragemMinima;
	}

	public Long getQuilometragemMaxima() {
		return quilometragemMaxima;
	}

	public void setQuilometragemMaxima(Long quilometragemMaxima) {
		this.quilometragemMaxima = quilometragemMaxima;
	}

	public List<String> getPlaca() {
		return placa;
	}

	public void setPlaca(List<String> placa) {
		this.placa = placa;
	}

	public List<TblCambio> getTblCambio() {
		return tblCambio;
	}

	public void setTblCambio(List<TblCambio> tblCambio) {
		this.tblCambio = tblCambio;
	}

	public List<TblCombustivel> getTblCombustivel() {
		return tblCombustivel;
	}

	public void setTblCombustivel(List<TblCombustivel> tblCombustivel) {
		this.tblCombustivel = tblCombustivel;
	}

	public List<TblOpcionais> getTblOpcionais() {
		return tblOpcionais;
	}

	public void setTblOpcionais(List<TblOpcionais> tblOpcionais) {
		this.tblOpcionais = tblOpcionais;
	}

	public List<Integer> getNumPortas() {
		return numPortas;
	}

	public void setNumPortas(List<Integer> numPortas) {
		this.numPortas = numPortas;
	}

	public List<TblCor> getTblCor() {
		return tblCor;
	}

	public void setTblCor(List<TblCor> tblCor) {
		this.tblCor = tblCor;
	}

	public Boolean getBlindagem() {
		return blindagem;
	}

	public void setBlindagem(Boolean blindagem) {
		this.blindagem = blindagem;
	}

	public List<TblDocumentacao> getTblDocumentacao() {
		return tblDocumentacao;
	}

	public void setTblDocumentacao(List<TblDocumentacao> tblDocumentacao) {
		this.tblDocumentacao = tblDocumentacao;
	}

	public List<TblCarroceria> getTblCarroceria() {
		return tblCarroceria;
	}

	public void setTblCarroceria(List<TblCarroceria> tblCarroceria) {
		this.tblCarroceria = tblCarroceria;
	}

	public List<TblNecessidade> getTblNecessidade() {
		return tblNecessidade;
	}

	public void setTblNecessidade(List<TblNecessidade> tblNecessidade) {
		this.tblNecessidade = tblNecessidade;
	}

	public List<TblTipoAnuncio> getTblTipoAnuncio() {
		return tblTipoAnuncio;
	}

	public void setTblTipoAnuncio(List<TblTipoAnuncio> tblTipoAnuncio) {
		this.tblTipoAnuncio = tblTipoAnuncio;
	}

	public TblUf getTblUf() {
		return tblUf;
	}

	public void setTblUf(TblUf tblUf) {
		this.tblUf = tblUf;
	}

	public Boolean getTroca() {
		return troca;
	}

	public void setTroca(Boolean troca) {
		this.troca = troca;
	}
	
}
