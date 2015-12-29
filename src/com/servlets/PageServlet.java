package com.servlets;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map.Entry;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dataClasses.Database;
import com.servlets.Session.NewSession;

/**
 * @author Simon Langlois, edited by Edward Gagnon
 */
public abstract class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public abstract Conts.Cont main(
			final Database db,
			final Session session,
			final Parameters parameters)
			throws ServletException, IOException, SQLException;
	
	@Override
	protected final void doGet(
			final HttpServletRequest request, 
			final HttpServletResponse response) 
			throws ServletException, IOException {
		handle(request, response);
	}

	@Override
	protected final void doPost(
			final HttpServletRequest request, 
			final HttpServletResponse response) 
			throws ServletException, IOException {
		handle(request, response);
	}
	
	public final void handle(
			final HttpServletRequest request, 
			final HttpServletResponse response) 
			throws ServletException, IOException {
		
		
		if(request.getSession().getAttribute("session") == null) {
			final NewSession newSession = Session.make();
			request.getSession().setAttribute("session", newSession.session);
			request.getSession().setAttribute("manager", newSession.manager);
			
			request.getSession().setAttribute("cart", newSession.session.cart);

			//Check for the mobile site information
			String userAgent = request.getHeader("user-agent");
			final Pattern mobile = Pattern.compile("iphone|ipad|ipod|android|blackberry|mini|windows\\sce|palm");

			if(userAgent != null && mobile.matcher(userAgent.toLowerCase()).find()){
				newSession.session.isMobile = true;
			}
		}
		
		final Session session = (Session) request.getSession().getAttribute("session");
		final CookieManager manager = (CookieManager) request.getSession().getAttribute("manager");

		final Parameters parameters = Parameters.fromRequest(request);
		manager.load(request);

		
		
		
		
		Database db = null;
		
		try {
			db = Database.connect();
			
			ClosedServlet closure = new ClosedServlet(this, parameters);
			trampoline: while(true) {
				
				// Page specific things happen here
				final Conts.Cont cont = closure.main(db, session);
				
				switch(cont.getType()) {
					case REDIRECT:
						closure = cont.getRedirect();
						continue trampoline;
					case ERROR:
						request.setAttribute(cont.getErrorName(), cont.getErrorMessage());
						closure = session.lastPage;
						continue trampoline;
					case DOWNLOAD:
						final String filename = cont.getFilename();
						final String path = getServletContext().getRealPath("/");
						
						response.setContentType("application/octet-stream");
						response.setHeader("content-disposition", "attachment; filename=" + filename);
						
						final FileInputStream input = new FileInputStream(path + filename);
						final PrintWriter output = response.getWriter();
						while(true) {
							final int i = input.read();
							if(i == -1) break;
							
							output.write(i);
						}
						input.close();
						
						closure = session.lastPage;
						continue trampoline;
					case DISPLAY: 
						final String url = cont.getDisplay();
						final Attributes attributes = cont.getAttributes();
						
						for(final Entry<String, Object> entry : attributes)
							request.setAttribute(entry.getKey(), entry.getValue());

						manager.save(response);
						session.lastPage = closure;

						getServletContext().getRequestDispatcher(url).forward(request, response);
						return;
				}
			}	
		} catch (final SQLException e) {
			e.printStackTrace();

			request.setAttribute("stackTrace", e.toString());
			getServletContext().getRequestDispatcher("/jsp/noDatabase.jsp").forward(request, response);
			return;
		} finally {
			if(db != null)
				db.close();
		}
	}
}
