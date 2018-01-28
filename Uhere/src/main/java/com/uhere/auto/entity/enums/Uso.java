package com.uhere.auto.entity.enums;

public enum Uso {

	NOVO('N'),USADO('U');
	
	private final char uso;
	
	Uso(char uso) {
		this.uso = uso;
	}
	
	public char getUso() {
		return this.uso;
	}
	
}