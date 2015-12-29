package com.xml;

import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.FactoryConfigurationError;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.DOMImplementation;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

public abstract class XmlFactory {
	
    public static Document createDocument(HashMap<String, String> map, String rootName) {

        Document xmldoc = null;
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            DOMImplementation impl = builder.getDOMImplementation();
            //get the keys from the map
            Set<String> set = map.keySet();
            Element element = null;
            Node node = null;
            // Document.
            xmldoc = impl.createDocument(null, rootName, null);
            // Root element.
            Element root = xmldoc.getDocumentElement();
            
            //Build the xml
            for(String str: set){
            	System.out.println(str);
            	element = xmldoc.createElementNS(null, str);
                node = xmldoc.createTextNode(map.get(str));
                element.appendChild(node);
                root.appendChild(element);
            }

          
        } catch (FactoryConfigurationError e) {
            System.out.println("Could not locate a JAXP DocumentBuilderFactory class");
        } catch (ParserConfigurationException e) {
            System.out.println("Could not locate a JAXP DocumentBuilder class");
        }
        //System.out.println(xmldoc);
        return xmldoc;
    }
	
	
	
	

	/**
	 * Transform a DOM Document into an an XML document as a string Used for
	 * transforming in a JSP
	 * 
	 * @param xmldoc
	 * @return
	 */
	public static String convertToXML(Document xmldoc) {

		String xmlString = null;

		// DOM Transform.
		try {
			// Show raw XML
			DOMSource domSource = new DOMSource(xmldoc);
			StringWriter outWriter = new StringWriter();
			StreamResult result = new StreamResult(outWriter);
			TransformerFactory tf = TransformerFactory.newInstance();
			Transformer serializer = tf.newTransformer();
			serializer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
			serializer.setOutputProperty(OutputKeys.INDENT, "yes");
			serializer.transform(domSource, result);
			xmlString = outWriter.toString();

		} catch (TransformerConfigurationException tce) {
			// Use the contained exception, if any
			Throwable x = tce;
			if (tce.getException() != null) {
				x = tce.getException();
			}
			x.printStackTrace();
		} catch (TransformerException te) {
			// Use the contained exception, if any
			Throwable x = te;
			if (te.getException() != null) {
				x = te.getException();
			}
			x.printStackTrace();
		}
		System.out.println(xmlString);
		return xmlString;
	}

	/**
	 * Builds a hashmap
	 * 
	 * @param map
	 *            The map to build on to.
	 * @param key
	 *            The key to add to the map
	 * @param value
	 *            The value to set into the map
	 * @return The same map as the one pass in the argument. If the key and the
	 *         value were not null, and the key has a length greater than zero,
	 *         then the key is inserted if the key didn't exist before.
	 */
	public static HashMap<String, String> buildMap(HashMap<String, String> map,
			String key, String value) {
		if(key == null)
			System.out.println("key is null");
		if(map == null)
			System.out.println("map is null");
		if(value == null)
			System.out.println("value is null");
		if (key != null && value != null && key.trim().length() > 0) {
			System.out.println("key: " + key + "\tvalue: " + value);
			if (!map.containsKey(key))
				map.put(key, value);
		}
		return map;
	}

}
