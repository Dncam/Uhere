package com.uhere.auto.entity.enums.convert;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import com.uhere.auto.entity.enums.Uso;

@Converter
public class ConverterUso implements AttributeConverter<Uso, Character> {

	
	@Override
	public Character convertToDatabaseColumn(Uso attribute) {
		switch (attribute) {
		case NOVO:
			return 'N';
		case USADO:
			return 'U';
		default:
			throw new IllegalArgumentException("Unknown" + attribute);
		}
	}

	@Override
	public Uso convertToEntityAttribute(Character dbData) {
		switch (dbData) {
		case 'N':
			return Uso.NOVO;
		case 'U':
			return Uso.USADO;
		default:
			throw new IllegalArgumentException("Unknown" + dbData);
		}
	}

}
