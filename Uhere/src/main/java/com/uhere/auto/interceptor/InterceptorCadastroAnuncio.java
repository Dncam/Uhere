package com.uhere.auto.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class InterceptorCadastroAnuncio implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView model)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		MultipartHttpServletRequest files = (MultipartHttpServletRequest) request;
		files.getFileMap().size();
		Map<Long,MultipartFile> listaArquivos = new HashMap<Long,MultipartFile>();
		for (String key: files.getFileMap().keySet()) {
			listaArquivos.put(Long.valueOf(key),((MultipartFile)files.getFileMap().get(key)));
		}
		request.setAttribute("arquivos",listaArquivos);
		return true;
	}
}
