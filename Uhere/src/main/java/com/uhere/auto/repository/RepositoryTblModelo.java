package com.uhere.auto.repository;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.QueryHints;

import com.uhere.auto.entity.TblMarca;
import com.uhere.auto.entity.TblModelo;

public interface RepositoryTblModelo extends JpaRepository<TblModelo, Long>{
	
	@Cacheable
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	List<TblModelo> findByTblMarca(TblMarca tblMarca);
	
	@Cacheable
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	@Override
	public TblModelo findOne(Long chave) ;
}
