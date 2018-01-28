package com.uhere.auto.config;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class ConfigSession implements HttpSessionListener {
 
    @Override
    public void sessionCreated(HttpSessionEvent event) {
        System.out.println("==== Session is created ====");
        event.getSession().setMaxInactiveInterval(5*60);
    }
 
    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
    	event.getSession().invalidate();
        System.out.println("==== Session is destroyed ====");
    }	

}
