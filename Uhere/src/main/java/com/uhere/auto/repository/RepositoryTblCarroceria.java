package com.uhere.auto.repository;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.QueryHints;

import com.uhere.auto.entity.TblCarroceria;

public interface RepositoryTblCarroceria extends JpaRepository<TblCarroceria, Long>{
	
	@Cacheable
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	@Override
	public List<TblCarroceria> findAll();
	
	@Cacheable
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	@Override
	public TblCarroceria findOne(Long chave) ;
	
}
