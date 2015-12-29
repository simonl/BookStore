package com.servlets;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dataAccess.tables.Survey;
import com.dataAccess.tables.User;
import com.dataClasses.Cart;
import com.dataClasses.Maybe;

/**
 * 
 * Keeps track of all data we care about across requests
 *   - cart
 *   - last page that was visited
 *   - logged on user
 *   - survey answered
 *   - cookies stored by the client
 *   - if the user is on a mobile device
 * 
 * This class is complicated by the CookieManager that intercepts cookies that are added to the session.
 *   It is necessary to distinguish the new from the old cookies later.
 * 
 * @author Simon Langlois
 */
public class Session {

	private Session() { }
	
	public final Cart cart = new Cart();
	public ClosedServlet lastPage = Closures.welcome;
	public Maybe<User.Authority> loggedOnUser = Maybe.nothing();
	public Maybe<Survey.Id> surveyAnswered = Maybe.nothing();
	public boolean isMobile = false;
	
	private final List<Cookie> cookies = new ArrayList<Cookie>();
	private int numCookies = 0;
	
	public final Cookie[] getCookies() {
		return cookies.toArray(new Cookie[cookies.size()]);
	}
	public final void addCookie(final Cookie cookie) {
		cookies.add(cookie);
	}
	
	public final Cart getCart() {
		return cart;
	}
	public final ClosedServlet getLastPage() {
		return lastPage;
	}
	public final Maybe<User.Authority> getLoggedOnUser() {
		return loggedOnUser;
	}
	public final Maybe<Survey.Id> getSurveyAnswered() {
		return surveyAnswered;
	}
	public final boolean getIsMobile() {
		return isMobile;
	}
	
	public static final class NewSession {
		public final Session session = new Session();
		public final CookieManager manager = new CookieManager() {

			@Override
			public void load(final HttpServletRequest request) {
				final Cookie[] cookies = request.getCookies();
				session.cookies.clear();
				try {
					if(cookies != null){
						session.numCookies = cookies.length;
						
						for(final Cookie cookie : cookies) {
							session.cookies.add(cookie);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			@Override
			public void save(final HttpServletResponse response) {
				for(int i = session.numCookies; i < session.cookies.size(); i++) {
					response.addCookie(session.cookies.get(i));
				}
			}
		};
	}
	
	public static final NewSession make() {
		return new NewSession();
	}
}
