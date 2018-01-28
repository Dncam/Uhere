package com.uhere.auto.model.implement;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

@Component
public class ContainsListTag extends SimpleTagSupport {

	private List<Object> arrayFind;
	private Object keyFind;
	private String field;
	private String var;

	@Override
	public void doTag() throws JspException, IOException {
		boolean exists = false;
		if (this.arrayFind != null && this.arrayFind.size() > 0)
			for(Object obj : this.arrayFind) {
				try {
					Object v1 = obj.getClass().getDeclaredMethod("get" + StringUtils.capitalize(field),new Class[]{} ).invoke(obj);
					if ( v1.equals(keyFind) ) {
						exists = true;
						break;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		getJspContext().setAttribute(this.var, exists);
	}

	public void setArrayFind(List<Object> arrayFind) {
		this.arrayFind = arrayFind;
	}

	public void setKeyFind(Object keyFind) {
		this.keyFind = keyFind;
	}

	public void setField(String field) {
		this.field = field;
	}

	public void setVar(String var) {
		this.var = var;
	}
}
