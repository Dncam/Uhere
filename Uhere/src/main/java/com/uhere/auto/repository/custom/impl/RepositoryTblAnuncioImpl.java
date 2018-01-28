package com.uhere.auto.repository.custom.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.hibernate.type.LongType;

import com.uhere.auto.entity.TblAnuncio;
import com.uhere.auto.entity.TblAnuncio_;
import com.uhere.auto.entity.TblCidade_;
import com.uhere.auto.entity.TblMarca_;
import com.uhere.auto.entity.TblModelo_;
import com.uhere.auto.entity.TblOpcionais;
import com.uhere.auto.entity.TblUsuario_;
import com.uhere.auto.entity.TblVeiculo;
import com.uhere.auto.entity.TblVeiculo_;
import com.uhere.auto.entity.bean.BPesquisaAvancada;
import com.uhere.auto.entity.enums.Status;
import com.uhere.auto.repository.custom.RepositoryTblAnuncioCustom;

public class RepositoryTblAnuncioImpl implements RepositoryTblAnuncioCustom{

	@PersistenceContext 
	private EntityManager em;
	
	@Override
	public List<TblAnuncio> findCustomByDescricaoSplit(String[] descricao) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<TblAnuncio> query = cb.createQuery(TblAnuncio.class);
		Root<TblAnuncio> pRoot = query.from(TblAnuncio.class);
		query.select(pRoot);
		query.distinct(true);
		List<Predicate> listCondition = new ArrayList<Predicate>();
		for(String conditionStr : descricao)
			listCondition.add(cb.like(cb.upper(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.descricao)),"%" + conditionStr.trim().toUpperCase() + "%"));
		listCondition.add(cb.equal(pRoot.get(TblAnuncio_.status),Status.ATIVO));
		query.where(cb.and(listCondition.toArray(new Predicate[]{})));
		return em.createQuery(query).setHint("org.hibernate.cacheable", true).getResultList();
	}

	//@Override
	public List<TblAnuncio> findCustomByBPesquisaAvancada(BPesquisaAvancada bPesquisaAvancada) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<TblAnuncio> query = cb.createQuery(TblAnuncio.class);
		Root<TblAnuncio> pRoot = query.from(TblAnuncio.class);
		query.select(pRoot);
		query.distinct(true);
		List<Predicate> listCondition = new ArrayList<Predicate>();
		if(bPesquisaAvancada.getLocalizacao() != null && !bPesquisaAvancada.getLocalizacao().trim().isEmpty())
			listCondition.add(cb.like(cb.upper(pRoot.get(TblAnuncio_.tblUsuario).get(TblUsuario_.tblCidade).get(TblCidade_.descricao)), bPesquisaAvancada.getLocalizacao().toUpperCase()));
		if(bPesquisaAvancada.getUso() != null)
			listCondition.add(cb.equal(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.uso), bPesquisaAvancada.getUso()));
		if(bPesquisaAvancada.getTblMarca() != null)
			if(bPesquisaAvancada.getTblMarca().getChave() != 0)
				listCondition.add(cb.equal(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.tblMarca).get(TblMarca_.chave), bPesquisaAvancada.getTblMarca().getChave()));
		if(bPesquisaAvancada.getTblModelo() != null)
			if(bPesquisaAvancada.getTblModelo().getChave() != 0)	
				listCondition.add(cb.equal(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.tblModelo).get(TblModelo_.chave), bPesquisaAvancada.getTblModelo().getChave()));
		if(bPesquisaAvancada.getAnoMinimo() != null && bPesquisaAvancada.getAnoMaximo() != null)
			listCondition.add(cb.between(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.anoFabricacao), bPesquisaAvancada.getAnoMinimo(), bPesquisaAvancada.getAnoMaximo()));
		else if(bPesquisaAvancada.getAnoMinimo() != null)
			listCondition.add(cb.ge(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.anoFabricacao), bPesquisaAvancada.getAnoMinimo()));
		else if(bPesquisaAvancada.getAnoMaximo() != null)
			listCondition.add(cb.le(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.anoFabricacao), bPesquisaAvancada.getAnoMaximo()));
		if(bPesquisaAvancada.getPrecoMinimo() != null && bPesquisaAvancada.getPrecoMaximo() != null)
			listCondition.add(cb.between(pRoot.get(TblAnuncio_.precoInicial), bPesquisaAvancada.getPrecoMinimo(), bPesquisaAvancada.getPrecoMaximo()));
		else if(bPesquisaAvancada.getPrecoMinimo() != null)
			listCondition.add(cb.ge(pRoot.get(TblAnuncio_.precoInicial), bPesquisaAvancada.getPrecoMinimo()));
		else if(bPesquisaAvancada.getPrecoMaximo() != null)
			listCondition.add(cb.le(pRoot.get(TblAnuncio_.precoInicial), bPesquisaAvancada.getPrecoMaximo()));
		if(bPesquisaAvancada.getQuilometragemMinima() != null && bPesquisaAvancada.getQuilometragemMaxima() != null)
			listCondition.add(cb.between(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.quilometragem), bPesquisaAvancada.getQuilometragemMinima(), bPesquisaAvancada.getQuilometragemMaxima()));
		else if(bPesquisaAvancada.getQuilometragemMinima() != null)
			listCondition.add(cb.ge(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.quilometragem), bPesquisaAvancada.getQuilometragemMinima()));
		else if(bPesquisaAvancada.getQuilometragemMaxima() != null)
			listCondition.add(cb.le(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.quilometragem), bPesquisaAvancada.getQuilometragemMaxima()));
		if(bPesquisaAvancada.getPlaca() != null) {
			List<String> listPlacas = new ArrayList<String>();
			for(String placasList : bPesquisaAvancada.getPlaca())
				for(String placaFinal : placasList.split(";"))
					listPlacas.add(placaFinal);
			listCondition.add(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.placa).in(listPlacas));
		}
		if(bPesquisaAvancada.getTblCambio() != null)
			listCondition.add(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.tblCambio).in(bPesquisaAvancada.getTblCambio()));
		if(bPesquisaAvancada.getTblCombustivel() != null)
			listCondition.add(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.tblCombustivel).in(bPesquisaAvancada.getTblCombustivel()));
		if(bPesquisaAvancada.getTblOpcionais() != null) {
			Join<TblVeiculo, TblOpcionais> jOpcionais = pRoot.join(TblAnuncio_.tblVeiculo).join(TblVeiculo_.tblOpcionais);
			listCondition.add(jOpcionais.in(bPesquisaAvancada.getTblOpcionais()));
		}
		if(bPesquisaAvancada.getNumPortas() != null)
			listCondition.add(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.portas).in(bPesquisaAvancada.getNumPortas()));
		if(bPesquisaAvancada.getTblCor() != null)
			listCondition.add(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.tblCor).in(bPesquisaAvancada.getTblCor()));
		if(bPesquisaAvancada.getBlindagem() != null)
			listCondition.add(cb.equal(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.blindagem), bPesquisaAvancada.getBlindagem()));
		if(bPesquisaAvancada.getTblDocumentacao() != null)
			listCondition.add(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.tblDocumentacao).in(bPesquisaAvancada.getTblDocumentacao()));
		if(bPesquisaAvancada.getTblCarroceria() != null)
			listCondition.add(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.tblCarroceria).in(bPesquisaAvancada.getTblCarroceria()));		
		if(bPesquisaAvancada.getTblNecessidade() != null)
			listCondition.add(pRoot.get(TblAnuncio_.tblVeiculo).get(TblVeiculo_.tblNecessidade).in(bPesquisaAvancada.getTblNecessidade()));
		if(bPesquisaAvancada.getTblTipoAnuncio() != null)
			listCondition.add(pRoot.get(TblAnuncio_.tblTipoAnuncio).in(bPesquisaAvancada.getTblTipoAnuncio()));
		if(bPesquisaAvancada.getTroca() != null)
			listCondition.add(cb.equal(pRoot.get(TblAnuncio_.troca), bPesquisaAvancada.getTroca()));
		listCondition.add(cb.equal(pRoot.get(TblAnuncio_.status),Status.ATIVO));
		query.where(cb.and(listCondition.toArray(new Predicate[]{})));
		return em.createQuery(query).setHint("org.hibernate.cacheable", true).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Long> getAnos() {
		Session session = (Session) em.getDelegate();
		@SuppressWarnings("deprecation")
		Query<Long> q  = (Query<Long>) session.createNativeQuery(
				"select ((year(now()) - 60) + (t*10+u+1)) as ano from "+
				"(select 0 t union select 1 union select 2 union select 3 union select 4 union "+
				"select 5 union select 6 union select 7 union select 8 union select 9) A, "+
				"(select 0 u union select 1 union select 2 union select 3 union select 4 union "+
				"select 5 union select 6 union select 7 union select 8 union select 9) B "+
				"where ((year(now()) - 60) + (t*10+u+1)) <= year(now()) order by ano ").addScalar("ano",LongType.INSTANCE);
		return q.setHint("org.hibernate.cacheable", true).getResultList();
	}
	
	@Override
	public Boolean countByTblUsuario(String email) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Boolean> query = cb.createQuery(Boolean.class);
		Root<TblAnuncio> pRoot = query.from(TblAnuncio.class);
		query.multiselect(
					cb.selectCase()
						.when(cb.gt(cb.count(pRoot.get(TblAnuncio_.chave)), pRoot.get(TblAnuncio_.tblUsuario).get(TblUsuario_.nAnuncios)),true)
						.otherwise(false));
		query.where(cb.equal(pRoot.get(TblAnuncio_.tblUsuario).get(TblUsuario_.email),email));
		return  em.createQuery(query).setHint("org.hibernate.cacheable", true).getSingleResult();
	}
	
	public void setEntityManager(EntityManager em) {
		this.em = em;
	}

}
