package com.uhere.auto.entity.enums.convert;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import com.uhere.auto.entity.enums.Status;

@Converter
public class ConverterStatus implements AttributeConverter<Status, Character> {

	@Override
	public Character convertToDatabaseColumn(Status attribute) {
		switch (attribute) {
		case VENDIDO:
			return 'V';
		case ATIVO:
			return 'A';
		case INDISPONIVEL:
			return 'I';
		case VALIDACAO:
			return 'E';
		default:
			throw new IllegalArgumentException("Unknown" + attribute);
		}
	}

	@Override
	public Status convertToEntityAttribute(Character dbData) {
		switch (dbData) {
		case 'V':
			return Status.VENDIDO;
		case 'A':
			return Status.ATIVO;
		case 'I':
			return Status.INDISPONIVEL;
		case 'E':
			return Status.VALIDACAO;
		default:
			throw new IllegalArgumentException("Unknown" + dbData);
		}
	}

}
