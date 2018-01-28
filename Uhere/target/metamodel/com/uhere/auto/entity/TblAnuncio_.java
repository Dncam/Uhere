package com.uhere.auto.entity;

import com.uhere.auto.entity.enums.Status;
import java.math.BigDecimal;
import java.util.Calendar;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(TblAnuncio.class)
public abstract class TblAnuncio_ {

	public static volatile SingularAttribute<TblAnuncio, TblCidade> tblCidade;
	public static volatile SingularAttribute<TblAnuncio, Boolean> leilao;
	public static volatile SingularAttribute<TblAnuncio, String> chave;
	public static volatile SingularAttribute<TblAnuncio, Calendar> dtPublicacao;
	public static volatile SingularAttribute<TblAnuncio, String> descricao;
	public static volatile SingularAttribute<TblAnuncio, Calendar> validade;
	public static volatile SingularAttribute<TblAnuncio, TblVeiculo> tblVeiculo;
	public static volatile SingularAttribute<TblAnuncio, BigDecimal> precoInicial;
	public static volatile SingularAttribute<TblAnuncio, TblTipoAnuncio> tblTipoAnuncio;
	public static volatile SingularAttribute<TblAnuncio, TblUsuario> tblUsuario;
	public static volatile SingularAttribute<TblAnuncio, BigDecimal> precoFinal;
	public static volatile SingularAttribute<TblAnuncio, Boolean> troca;
	public static volatile SingularAttribute<TblAnuncio, Status> status;
	public static volatile SingularAttribute<TblAnuncio, TblUf> tblUf;

}

