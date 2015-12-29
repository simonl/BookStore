package com.servlets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Is used to bridge the fact that cookies are 1. read from requests 2. added to responses
 *   and my system in which cookies are in the Session
 * 
 * A cookie manager is usually associated with a private Session object
 * A cookie manager does 3 things:
 *   load moves cookies from a request to the session
 *   remembers all the operations that were done on the cookies in the session
 *   save all the changes to a response
 * 
 * @author Simon Langlois
 */
public interface CookieManager {	
	public void load(final HttpServletRequest request);
	public void save(final HttpServletResponse response);
}
