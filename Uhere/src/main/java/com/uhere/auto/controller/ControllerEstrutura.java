package com.uhere.auto.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.common.collect.Lists;
import com.uhere.auto.entity.TblCidade;
import com.uhere.auto.entity.TblMarca;
import com.uhere.auto.entity.TblModelo;
import com.uhere.auto.entity.TblUf;
import com.uhere.auto.model.UhereModel;

/**
 * Handles requests for the application home page.
 */
@RestController
@RequestMapping(value="/estrutura")
public class ControllerEstrutura {

	@Autowired
	private UhereModel uhereModel;

	@RequestMapping(value = "/modelos/{chave}", method = RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<TblModelo>> getModelos(@PathVariable(name="chave",required=false) Long chave) {
		List<TblModelo> listModelos = Lists.newArrayList(uhereModel.getListModelo(new TblMarca(chave)));
		if(listModelos == null || listModelos.isEmpty())
			return new ResponseEntity<List<TblModelo>>(HttpStatus.NOT_FOUND);
		return new ResponseEntity<List<TblModelo>>(listModelos,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/cidades/{chave}", method = RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<TblCidade>> getCidades(@PathVariable(name="chave",required=false) String chave) {
		List<TblCidade> listCidades = Lists.newArrayList(uhereModel.getListCidade(new TblUf(chave)));
		if(listCidades == null || listCidades.isEmpty())
			return new ResponseEntity<List<TblCidade>>(HttpStatus.NOT_FOUND);
		return new ResponseEntity<List<TblCidade>>(listCidades,HttpStatus.OK);
	}
}