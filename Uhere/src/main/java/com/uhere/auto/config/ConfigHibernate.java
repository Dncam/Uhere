package com.uhere.auto.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
@ComponentScan({ "com.uhere.auto.config" })
@PropertySource(value = { "classpath:persistence.properties" })
@EnableJpaRepositories("com.uhere.auto.repository")
public class ConfigHibernate {
	
	@Autowired
	private Environment environment;

	 @Bean
	 public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
	     LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
	     entityManagerFactoryBean.setDataSource(dataSource());
	     entityManagerFactoryBean.setPersistenceProviderClass(HibernatePersistenceProvider.class);
	     entityManagerFactoryBean.setPackagesToScan(new String[] { "com.uhere.auto" });
	     entityManagerFactoryBean.setJpaProperties(hibernateProperties());
	     return entityManagerFactoryBean;
	 }
	
	
	@Bean
	public ComboPooledDataSource dataSource() {
	    ComboPooledDataSource dataSource = new ComboPooledDataSource();
	    try {
	        dataSource.setDriverClass(environment.getRequiredProperty("jdbc.driverClassName"));
	    } catch (PropertyVetoException pve){
	        System.out.println("Cannot load datasource driver (" + environment.getRequiredProperty("jdbc.driverClassName") +") : " + pve.getMessage());
	        return null;
	    }
	    dataSource.setJdbcUrl(environment.getRequiredProperty("jdbc.url"));
	    dataSource.setUser(environment.getRequiredProperty("jdbc.user"));
	    dataSource.setPassword(environment.getRequiredProperty("jdbc.pass"));
	    dataSource.setMinPoolSize(Integer.parseInt(environment.getRequiredProperty("c3p0.min_size")));
	    dataSource.setMaxPoolSize(Integer.parseInt(environment.getRequiredProperty("c3p0.max_size")));
	    dataSource.setMaxStatements(Integer.parseInt(environment.getRequiredProperty("c3p0.max_statements")));
	    dataSource.setTestConnectionOnCheckout(Boolean.parseBoolean(environment.getRequiredProperty("c3p0.testConnectionOnCheckout")));
	    dataSource.setAcquireIncrement(Integer.parseInt(environment.getRequiredProperty("c3p0.acquireIncrement")));
	    
	    return dataSource;
	}

	private Properties hibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", environment.getRequiredProperty("hibernate.dialect"));
		properties.put("hibernate.show_sql", environment.getRequiredProperty("hibernate.show_sql"));
		properties.put("hibernate.format_sql", environment.getRequiredProperty("hibernate.format_sql"));
		properties.put("use_sql_comments", environment.getRequiredProperty("hibernate.use_sql_comments"));
		properties.put("hibernate.hbm2ddl.auto", environment.getRequiredProperty("hibernate.hbm2ddl.auto"));
		properties.put("hibernate.generate_statistics", environment.getRequiredProperty("hibernate.generate_statistics"));
		properties.put("hibernate.cache.region.factory_class", environment.getRequiredProperty("hibernate.cache.region.factory_class"));
		properties.put("hibernate.cache.use_second_level_cache", environment.getRequiredProperty("hibernate.cache.use_second_level_cache"));
		properties.put("hibernate.cache.use_query_cache", environment.getRequiredProperty("hibernate.cache.use_query_cache"));
		properties.put("net.sf.ehcache.configurationResourceName", environment.getRequiredProperty("hibernate.format_sql"));
		properties.put("hibernate.enable_lazy_load_no_trans", environment.getRequiredProperty("hibernate.enable_lazy_load_no_trans"));
		properties.put("hibernate.connection.SetBigStringTryClob", environment.getRequiredProperty("hibernate.connection.SetBigStringTryClob"));
		properties.put("net.sf.ehcache.configurationResourceName", "/ehCache.xml");
		properties.put("javax.persistence.validation.mode", environment.getRequiredProperty("javax.persistence.validation.mode"));
		
		return properties;
	}

	@Bean
	 public JpaTransactionManager transactionManager() {
	     JpaTransactionManager transactionManager = new JpaTransactionManager();
	     transactionManager.setEntityManagerFactory(entityManagerFactory().getObject());
	     return transactionManager;
	 }
}




 

