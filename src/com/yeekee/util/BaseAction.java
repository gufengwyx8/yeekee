package com.yeekee.util;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {

	public static final String CODE_SESSION_KEY = "code";
	public static final String USER_SESSION_KEY = "user";
	public static final String ADMIN_SESSION_KEY = "admin";

	public HttpServletResponse getHttpResponse() {
		return ServletActionContext.getResponse();
	}

	public HttpServletRequest getHttpRequest() {
		return ServletActionContext.getRequest();
	}

	public HttpSession getSession() {
		return getHttpRequest().getSession();
	}

	public Cookie[] getCookie() {
		return getHttpRequest().getCookies();
	}

	public void addCookie(Cookie cookie) {
		getHttpResponse().addCookie(cookie);
	}

	public Cookie getCookie(String key) {
		if (getCookie() == null) {
			return null;
		}
		for (Cookie c : getCookie()) {
			if (c.getName().equals(key)) {
				return c;
			}
		}
		return null;
	}

	public ServletContext getServletContext() {
		return ServletActionContext.getServletContext();
	}
}
