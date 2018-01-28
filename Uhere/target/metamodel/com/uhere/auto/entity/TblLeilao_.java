package com.uhere.auto.entity;

import com.uhere.auto.entity.enums.Status;
import com.uhere.auto.entity.enums.Uso;
import java.util.Calendar;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(TblLeilao.class)
public abstract class TblLeilao_ {

	public static volatile SingularAttribute<TblLeilao, TblModelo> tblModelo;
	public static volatile ListAttribute<TblLeilao, TblCambio> tblCambio;
	public static volatile SingularAttribute<TblLeilao, Calendar> dtValidade;
	public static volatile ListAttribute<TblLeilao, Integer> portas;
	public static volatile ListAttribute<TblLeilao, TblCombustivel> tblCombustivel;
	public static volatile SingularAttribute<TblLeilao, Calendar> dtPublicacao;
	public static volatile SingularAttribute<TblLeilao, Long> quilometragemMinimo;
	public static volatile ListAttribute<TblLeilao, TblCarroceria> tblCarroceria;
	public static volatile ListAttribute<TblLeilao, Uso> uso;
	public static volatile ListAttribute<TblLeilao, TblDocumentacao> tblDocumentacao;
	public static volatile SingularAttribute<TblLeilao, TblUsuario> tblUsuario;
	public static volatile SingularAttribute<TblLeilao, Boolean> troca;
	public static volatile ListAttribute<TblLeilao, Integer> placa;
	public static volatile ListAttribute<TblLeilao, TblNecessidade> tblNecessidade;
	public static volatile ListAttribute<TblLeilao, Boolean> blindagem;
	public static volatile SingularAttribute<TblLeilao, Long> anoModeloMaximo;
	public static volatile ListAttribute<TblLeilao, TblCor> tblCor;
	public static volatile ListAttribute<TblLeilao, TblCidade> tblCidade;
	public static volatile SingularAttribute<TblLeilao, String> chave;
	public static volatile ListAttribute<TblLeilao, TblOpcionais> tblOpcionais;
	public static volatile ListAttribute<TblLeilao, TblTipoAnuncio> tblTipoAnuncio;
	public static volatile SingularAttribute<TblLeilao, Long> quilometragemMaxima;
	public static volatile SingularAttribute<TblLeilao, Long> anoModeloMinimo;
	public static volatile SingularAttribute<TblLeilao, TblMarca> tblMarca;
	public static volatile SingularAttribute<TblLeilao, Status> status;
	public static volatile SingularAttribute<TblLeilao, TblUf> tblUf;

}

