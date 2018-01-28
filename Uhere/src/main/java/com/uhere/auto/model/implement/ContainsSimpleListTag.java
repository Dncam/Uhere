package com.uhere.auto.model.implement;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.springframework.stereotype.Component;

@Component
public class ContainsSimpleListTag extends SimpleTagSupport {

	private List<?> arrayFind;
	private Object keyFind;
	private String var;

	@Override
	public void doTag() throws JspException, IOException {
		boolean exists = false ;
		if (this.arrayFind != null && this.arrayFind.size() > 0)
			for(Object object : arrayFind)
				if(object.toString().equals(keyFind)) {
					exists = true;
					break;
				}
		getJspContext().setAttribute(this.var, exists);
	}

	public void setArrayFind(List<?> arrayFind) {
		this.arrayFind = arrayFind;
	}

	public void setKeyFind(Object keyFind) {
		this.keyFind = keyFind;
	}

	public void setVar(String var) {
		this.var = var;
	}
}
