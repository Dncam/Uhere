package com.uhere.auto.repository.custom;

import java.util.List;

import com.uhere.auto.entity.TblAnuncio;
import com.uhere.auto.entity.bean.BPesquisaAvancada;

public interface RepositoryTblAnuncioCustom {
	 public List<TblAnuncio> findCustomByDescricaoSplit(String[] descricao);
	 public List<TblAnuncio> findCustomByBPesquisaAvancada(BPesquisaAvancada bPesquisaAvancada);
	 public Boolean countByTblUsuario(String email);
	 public List<Long> getAnos();
}
