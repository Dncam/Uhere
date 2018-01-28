package com.uhere.auto.model.implement;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.springframework.stereotype.Component;

@Component
public class ConvertImageTag extends SimpleTagSupport {

	private byte[] vImagem;

	@Override
	public void doTag() throws JspException, IOException {
		if(!UhereUtils.isBase64(vImagem))
			vImagem = Base64.getEncoder().encode(vImagem);
		try {
			JspWriter out = getJspContext().getOut();
			if (vImagem != null && vImagem.length > 0) {
				String base64Encoded = new String(vImagem);
				out.print(base64Encoded);
			}
		} catch (Exception e) {
			throw new JspException("Error: " + e.getMessage());
		}
	}

	public void setvImagem(byte[] vImagem) {
		this.vImagem = vImagem;
	}

}
