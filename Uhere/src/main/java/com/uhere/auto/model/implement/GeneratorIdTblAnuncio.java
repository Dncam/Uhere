package com.uhere.auto.model.implement;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.lang.RandomStringUtils;
import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;
import org.springframework.stereotype.Component;

@Component
public class GeneratorIdTblAnuncio implements IdentifierGenerator{

	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object arg1) throws HibernateException {
		String newId = "";
		Connection connection = session.connection();
        Statement statement;
		try {
			statement = connection.createStatement();
	        while(true)
	        {
	        	newId = RandomStringUtils.randomAlphanumeric(10);
	        	ResultSet rs=statement.executeQuery("select count(chave) as chave from uherebd.TBL_ANUNCIO where chave = '" + newId + "'");
	        	rs.next();
	        		if(rs.getInt(1) == 0)
	        			break;
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newId;
	}
}
