package com.uhere.auto.repository;

import javax.persistence.QueryHint;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.QueryHints;

import com.uhere.auto.entity.TblUsuario;

public interface RepositoryTblUsuario extends JpaRepository<TblUsuario, Long>{
	
	@Cacheable
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public TblUsuario findByCpfCnpj(Long cpfCnpj);
	
	@Cacheable
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public TblUsuario findByEmail(String email);
	
}
