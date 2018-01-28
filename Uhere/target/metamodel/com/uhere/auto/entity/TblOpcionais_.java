package com.uhere.auto.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(TblOpcionais.class)
public abstract class TblOpcionais_ {

	public static volatile SingularAttribute<TblOpcionais, Long> chave;
	public static volatile ListAttribute<TblOpcionais, TblVeiculo> tblVeiculos;
	public static volatile SingularAttribute<TblOpcionais, String> descricao;

}

