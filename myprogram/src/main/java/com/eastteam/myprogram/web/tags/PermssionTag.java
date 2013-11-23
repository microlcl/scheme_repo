package com.eastteam.myprogram.web.tags;

import java.io.IOException;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import com.eastteam.myprogram.entity.User;

//标签处理类，继承 SimpleTagSupport 父类
public class PermssionTag extends SimpleTagSupport {
	// 重写 doTag 方法，该方法在标签结束生成页面内容
	private String functionId;
	private String content;
	public String getFunctionId() {
		return functionId;
	}

	public void setFunctionId(String functionId) {
		this.functionId = functionId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public void doTag() throws JspException, IOException {
		// 获取页面输出流，并输出字符串
		JspFragment j = getJspBody();
		JspContext b = getJspContext();
		User user = (User)b.getAttribute("user",3);
		boolean temp = user.checkPermission(functionId);
		if(temp){
			   JspFragment jf=this.getJspBody();
	              jf.invoke(null);
		}
		
//		String a = b.getOut().toString();
	}
}