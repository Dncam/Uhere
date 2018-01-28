package com.uhere.auto.entity.enums;

public enum Status {

	VENDIDO('V'),ATIVO('A'),INDISPONIVEL('I'),VALIDACAO('E');
	
	private final char status;
	
	Status(char status) {
		this.status = status;
	}
	
	public char getStatus() {
		return this.status;
	}
	
}