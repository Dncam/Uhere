package com.uhere.auto.repository;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.uhere.auto.entity.TblVeiculo;

public interface RepositoryTblVeiculo extends JpaRepository<TblVeiculo, Long>{
	
	@Cacheable
	@Override
	public TblVeiculo findOne(Long renavam);
	
}
