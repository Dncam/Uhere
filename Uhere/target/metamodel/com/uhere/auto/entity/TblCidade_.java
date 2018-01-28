package com.uhere.auto.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(TblCidade.class)
public abstract class TblCidade_ {

	public static volatile SingularAttribute<TblCidade, Long> chave;
	public static volatile SingularAttribute<TblCidade, String> descricao;
	public static volatile SingularAttribute<TblCidade, TblUf> tblUf;

}

