package com.servlets;

import com.servlets.Conts.Cont;

/**

	Servlets return an instance of type Conts.Cont to either
	  - Display an JSP
	  - Redirect to another servlet
	  - Indicate an error in processing, which will return to the last page
	  - Initiate the download of a file
	
    Using an Abstract Data Type =>

	exists cont : *. {
	  Display : string -> attributes -> cont
	  Error : string -> string -> cont
	  Redirect : closedServlet -> cont
	  Download : string -> cont
	  ...
	}
	
	To represent the type =>
	
	<
	  Display : (string, attributes)
	  Error : (string, string)
	  Redirect : closedServlet
	  Download : string
	>
	
*/
public final class Conts {
	public static enum Type { REDIRECT, DISPLAY, ERROR, DOWNLOAD };
	
	public static abstract class Cont {		
		public abstract Type getType();
		
		public ClosedServlet getRedirect() { throw new UnsupportedOperationException(); }
		public String getDisplay() { throw new UnsupportedOperationException(); }
		public Attributes getAttributes() { throw new UnsupportedOperationException(); }
		public String getErrorName() { throw new UnsupportedOperationException(); }
		public String getErrorMessage() { throw new UnsupportedOperationException(); }
		public String getFilename() { throw new UnsupportedOperationException(); }
	}
	
	public static final Cont redirect(final ClosedServlet servlet) {
		return new Cont() {
			@Override
			public Type getType() {
				return Type.REDIRECT;
			}

			@Override
			public ClosedServlet getRedirect() {
				return servlet;
			}
		};
	}
	
	public static final Cont display(final String url, final Attributes attributes) {
		return new Cont() {
			@Override
			public Type getType() {
				return Type.DISPLAY;
			}

			@Override
			public String getDisplay() {
				return url;
			}	
			
			@Override
			public Attributes getAttributes() {
				return attributes;
			}	
		};
	}

	public static final Cont error(final String name, final String message) {
		return new Cont() {
			@Override
			public Type getType() {
				return Type.ERROR;
			}

			@Override
			public String getErrorName() {
				return name;
			}	
			
			@Override
			public String getErrorMessage() {
				return message;
			}	
		};
	}

	public static final Cont download(final String filename) {
		return new Cont() {

			@Override
			public Type getType() {
				return Type.DOWNLOAD;
			}
			
			@Override
			public String getFilename() {
				return filename;
			}
		};
	}
}
