package com.uhere.auto.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(TblModelo.class)
public abstract class TblModelo_ {

	public static volatile SingularAttribute<TblModelo, Long> chave;
	public static volatile SingularAttribute<TblModelo, String> descricao;
	public static volatile SingularAttribute<TblModelo, TblMarca> tblMarca;

}

