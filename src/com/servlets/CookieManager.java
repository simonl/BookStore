package com.servlets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CookieManager {	
	public void load(final HttpServletRequest request);
	public void save(final HttpServletResponse response);
}
