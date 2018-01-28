package com.uhere.auto.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import com.uhere.auto.model.listener.ListenerAuthenticationEntryPoint;
import com.uhere.auto.model.listener.ListenerAuthenticationFailureHandler;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@ComponentScan(basePackages = "com.uhere.auto")
public class ConfigSpringSecurity extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder()).usersByUsernameQuery(
				"select email as username, senha as password, ativo as enabled from uherebd.TBL_USUARIO where email = ?")
				.authoritiesByUsernameQuery(
						"select u.email as username, p.descricao as authority from uherebd.TBL_USUARIO u, uherebd.TBL_PERMISSOES p, uherebd.TBL_USUARIO_PERMISSOES up"
								+ " where u.cpfCnpj = up.cpfCnpj	and up.chave = p.chave	and u.email = ?");
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
				.antMatchers("/", "/anuncio/pesquisa/**", "/estrutura/**", "/login**","/tela/mensagem**","/tela/mensagem/**").permitAll()
				.antMatchers("/login/modificar/senha").anonymous()
				.antMatchers("/cliente/cadastro/simples","/cliente/reenviar/email","/cliente/cadastro/confirma","/cliente/erro").anonymous()
				.antMatchers("/cliente/**","/anuncio/**").access("hasRole('USUARIO')")
			.anyRequest().authenticated()
		.and()
			.formLogin()
				.loginPage("/login")
				.failureUrl("/login?error=true&msg=''")
				.successForwardUrl("/tela/mensagem?titulo=mensagem.sucesso&msg=mensagem.sucesso.login&isModal=true")
				.usernameParameter("username").passwordParameter("password")
				.failureHandler(authenticationFailureHandler()).permitAll()
		.and()
			.exceptionHandling()
				.authenticationEntryPoint(authenticationEntryPoint())
				.accessDeniedPage("/tela/mensagem?titulo=mensagem.erro&msg=mensagem.erro.acesso&isModal=false")
		.and()
			.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/login/logout")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.permitAll()
		.and()
			.sessionManagement()
				//.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
				.sessionFixation()
				.migrateSession()
				.maximumSessions(1)
				.expiredUrl("/")
				.maxSessionsPreventsLogin(true)
			.and()
		.and()
			.rememberMe()
				.disable()
			.csrf()
				.disable();

	}

	@Bean
	public SimpleUrlAuthenticationFailureHandler authenticationFailureHandler() {
		return new ListenerAuthenticationFailureHandler();
	}
	
	@Bean
	public AuthenticationEntryPoint authenticationEntryPoint() {
	    return new ListenerAuthenticationEntryPoint();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}

	@Bean
	@Override
	protected AuthenticationManager authenticationManager() throws Exception {
		return super.authenticationManager();
	}

	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Bean
	@Override
	public UserDetailsService userDetailsServiceBean() throws Exception {
		return super.userDetailsServiceBean();
	}
}