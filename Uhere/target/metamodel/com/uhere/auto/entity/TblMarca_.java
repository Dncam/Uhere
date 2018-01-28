package com.uhere.auto.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(TblMarca.class)
public abstract class TblMarca_ {

	public static volatile SingularAttribute<TblMarca, Long> chave;
	public static volatile SingularAttribute<TblMarca, byte[]> logo;
	public static volatile ListAttribute<TblMarca, TblModelo> tblModelos;
	public static volatile SingularAttribute<TblMarca, String> descricao;

}

