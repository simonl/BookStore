package com.servlets;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dataClasses.Func;
import com.dataClasses.Funcs;
import com.dataClasses.Maybe;

/**
 * Contains the parameters to a servlet and, unlike HttpRequests,
 *   they can be created
 * 
 * @author Simon Langlois
 */
public final class Parameters {
	public final Map<String, String[]> parameters;
	public final Map<String, FileItem> files;
	
	public Parameters() {
		this(new HashMap<String, String[]>());
	}
	
	public Parameters(final Map<String, String[]> parameters) {
		this(parameters, new HashMap<String, FileItem>());
	}
	
	public Parameters(final Map<String, String[]> parameters, final Map<String, FileItem> files) {
		this.parameters = Collections.unmodifiableMap(parameters);
		this.files = Collections.unmodifiableMap(files);
	}
	
	
	

	public Maybe<String> get(final String name) {
		final String[] values = parameters.get(name);
		
		if(values == null) return Maybe.nothing();
		if(values.length != 1) return Maybe.nothing();
		
		return Maybe.just(values[0]);
	}
	
	public String[] gets(final String name) {
		final String[] values = parameters.get(name);
		
		if(values == null) return new String[] { };
		
		return values;
	}
	
	public Maybe<FileItem> file(final String name) {
		return Maybe.from(files.get(name));
	}
	
	public String toString() {
		String result = "{\n";
		for(final String name : parameters.keySet()) {
			result += "\t" + name + " = " + Arrays.toString(parameters.get(name)) + "\n";
		}
		result += "}";
		return result;
	}

	
	
	public static final Parameters fromRequest(final HttpServletRequest request) {
		final Map<String, List<String>> parameters = new HashMap<String, List<String>>();
		final Map<String, FileItem> fileItems = new HashMap<String, FileItem>();
		
		@SuppressWarnings("unchecked")
		final Map<String, String[]> map = request.getParameterMap();
		for(final String name : map.keySet()) {
			parameters.put(name, Arrays.asList(map.get(name)));
		}
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		if (isMultipart) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);

			try {
				@SuppressWarnings("unchecked")
				List<FileItem> items = (List<FileItem>) upload.parseRequest(request);
				
				for(final FileItem item : items) {
					final String name = item.getFieldName();
					
					if (item.isFormField()) {						
						if(!parameters.containsKey(name))
							parameters.put(name, new ArrayList<String>());
						
						parameters.get(name).add(item.getString());
					} else {
						fileItems.put(item.getFieldName(), item);
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		final Map<String, String[]> simpleParameters = Funcs.map(parameters, new Func<List<String>, String[]>() {
			public String[] apply(final List<String> xs) {
				return xs.toArray(new String[xs.size()]);
			} 
		});
		
		return new Parameters(simpleParameters, fileItems);
	}
}
