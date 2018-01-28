package com.uhere.auto.repository;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.QueryHints;

import com.uhere.auto.entity.TblAnuncio;
import com.uhere.auto.entity.TblUsuario;
import com.uhere.auto.entity.TblVeiculo;
import com.uhere.auto.repository.custom.RepositoryTblAnuncioCustom;

public interface RepositoryTblAnuncio extends JpaRepository<TblAnuncio, String>, RepositoryTblAnuncioCustom{
	
	@Cacheable
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<TblAnuncio> findByTblUsuario(TblUsuario tblUsuario);
	
	@Cacheable
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public TblAnuncio findByTblVeiculo(TblVeiculo tblVeiculo);
		
	@Cacheable
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	@Override
	public TblAnuncio findOne(String chave) ;
	
	
}
