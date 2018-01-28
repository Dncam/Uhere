package com.uhere.auto.model.listener;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.stereotype.Component;

@Component
public class ListenerAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,AuthenticationException exception) throws IOException, ServletException {
		if (exception.getClass().isAssignableFrom(UsernameNotFoundException.class))
			setDefaultFailureUrl("/login?error=true&msg=mensagem.erro.login.usuario");
		else if(exception.getClass().isAssignableFrom(SessionAuthenticationException.class))
			setDefaultFailureUrl("/login?error=true&msg=mensagem.erro.login.acesso");
		else if (exception.getClass().isAssignableFrom(DisabledException.class))
			setDefaultFailureUrl("/login?error=true&msg=mensagem.erro.login.disabilitado");
		else
			setDefaultFailureUrl("/login?error=true&msg=mensagem.erro.login.credencial");
		
		super.onAuthenticationFailure(request, response, exception);
	}

}