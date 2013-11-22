package com.eastteam.myprogram.web;

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.catalina.Session;
import org.apache.jasper.runtime.BodyContentImpl;
import org.eclipse.jetty.server.Request;

//标签处理类，继承 SimpleTagSupport 父类
public class PermssionTag extends SimpleTagSupport {
	// 重写 doTag 方法，该方法在标签结束生成页面内容
	private String functionId;

	public String getFunctionId() {
		return functionId;
	}

	public void setFunctionId(String functionId) {
		this.functionId = functionId;
	}

	public void doTag() throws JspException, IOException {
		// 获取页面输出流，并输出字符串
		String a = (String) getJspContext().getAttribute(functionId);
		System.out.println(a);
		 JspFragment j= getJspBody();
		 JspContext B=getJspContext();
		getJspContext().getOut().write("Hello World");
	}
}