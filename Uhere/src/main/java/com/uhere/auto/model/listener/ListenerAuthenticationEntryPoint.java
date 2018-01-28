package com.uhere.auto.model.listener;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

public class ListenerAuthenticationEntryPoint implements AuthenticationEntryPoint {
	
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        if (authException != null) {
        	String url = request.getScheme() + "://" ;
    		url += request.getServerName() + ":";
    		url += request.getServerPort() ;
    		url += request.getContextPath();
    		url += "/tela/mensagem?titulo=mensagem.erro&msg=mensagem.erro.acesso&isModal=false";
            response.sendRedirect(url);
        }
    }
}