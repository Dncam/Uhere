package com.uhere.auto.config;

import java.util.Locale;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import com.uhere.auto.interceptor.InterceptorCadastroAnuncio;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.uhere.auto")
@PropertySource(value = { "classpath:mail.properties" })
public class ConfigSpringMVC extends WebMvcConfigurerAdapter {

	@Autowired
	private Environment environment;
	
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	// Configura as imagens grandes
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
	    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
	    multipartResolver.setMaxUploadSize(20971520);
	    return multipartResolver;
	}
	
	// Configura a pasta de resources
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	// Configura internalização
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("classpath:language");
		messageSource.setDefaultEncoding("ISO-8859-1");
		return messageSource;
	}
	
	@Bean
	public LocaleResolver localeResolver() {
		final CookieLocaleResolver resolver = new CookieLocaleResolver();
		resolver.setDefaultLocale(new Locale("pt","BR"));
		return resolver;
	}

	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {
		LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
		localeChangeInterceptor.setParamName("language");
		return localeChangeInterceptor;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(localeChangeInterceptor());
		registry.addInterceptor(new InterceptorCadastroAnuncio()).addPathPatterns("/anuncio/cadastrar/");
	}

	/**
     * Configure TilesConfigurer.
     */
    @Bean
    public TilesConfigurer tilesConfigurer(){
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions(new String[] {"/WEB-INF/tiles/tiles-definitions.xml"});
        tilesConfigurer.setCheckRefresh(true);
        return tilesConfigurer;
    }
 
    /**
     * Configure ViewResolvers to deliver preferred views.
     */
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        TilesViewResolver viewResolver = new TilesViewResolver();
        registry.viewResolver(viewResolver);
    }
    
	/**
     * configurando Email
     */
    @Bean
    public JavaMailSender javaMailSender() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
        javaMailSender.setHost(environment.getRequiredProperty("mail.host"));
        javaMailSender.setPort(Integer.parseInt(environment.getRequiredProperty("mail.port")));
        javaMailSender.setUsername(environment.getRequiredProperty("mail.user"));
        javaMailSender.setPassword(environment.getRequiredProperty("mail.pass"));
        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol", environment.getRequiredProperty("mail.transport.protocol"));
        properties.setProperty("mail.smtp.auth", environment.getRequiredProperty("mail.smtp.auth"));
        properties.setProperty("mail.smtp.starttls.enable", environment.getRequiredProperty("mail.smtp.starttls.enable"));
        javaMailSender.setJavaMailProperties(properties);
        return javaMailSender;
    }
	
}
