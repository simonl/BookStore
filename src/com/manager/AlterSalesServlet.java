package com.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.dataAccess.tables.Book;
import com.dataAccess.tables.User;
import com.dataClasses.CouldNotConnect;
import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.dataClasses.Money;
import com.servlets.Session;

/**
 * Servlet implementation class SetSalesServlet
 */
public class AlterSalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
	protected final void doGet(
			final HttpServletRequest request, 
			final HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected final void doPost(
			final HttpServletRequest request, 
			final HttpServletResponse response) 
			throws ServletException, IOException {
		String bookISBN = request.getParameter("isbn");
		String bookSalesPrice = request.getParameter("bookSalesPrice");
		final Session session = (Session) request.getSession().getAttribute("session");
		final Maybe<User.Authority> user = session.getLoggedOnUser();
		String errorMessage = "";
		System.out.println("errormessage = " + errorMessage);
		
		Database db = null;
		Maybe<Database.Manager> token = null;
		System.out.println("2 = " + errorMessage);
		if(user.isNull()) return;
		System.out.println("3 = " + errorMessage);
		try {
			db = Database.connect();
			token = db.restricted(user.value());
			if(token.isNull()){
				System.out.println("invalid user credentials");
				return;
				
			}
			
		} catch (CouldNotConnect e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Set<Book.Data> books = null;
		boolean found = false;
		try {
			Maybe<Book.Isbn13> bookISBN13 = Book.Isbn13.parse(bookISBN);
			if(!bookISBN13.isNull()){
				System.out.println("bookISBN13 in AlterSalesServlet = " + bookISBN13.getValue().getValue());
				Maybe<Book.Id> bookID = db.fromIsbn(bookISBN13.getValue());
				if (!bookID.isNull()){
					Book.Data bookData = db.get(bookID.getValue());
					Maybe<Money> salesPrice = Money.parse(bookSalesPrice);
					if(!salesPrice.isNull()){
						if(checkRangeOfSalesPrice(salesPrice.getValue(), bookData.getWholesalePrice(), bookData.getListPrice() )){
							db.setSalePrice(token.getValue() , bookID.getValue(), salesPrice.getValue());
							found = true;
						}
						else
							errorMessage = "The price set is not within the permissible range";
					}
					else
						errorMessage = "The book has no sales price value. Contact your Administrator";
				}
				else
					errorMessage = "Invalid book Id from isbn number";
			}
			else
				errorMessage = "Invalid book isbn number";
			System.out.println("errormessage = " + errorMessage);
			
			PrintWriter out = response.getWriter();
			out.print(convertToXML(createSuccessDocument(found, errorMessage)));
			//out.close();
			
		
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Books were not found");
		}
		
		
	}
	
	
	private boolean checkRangeOfSalesPrice(Money salesPriceValue, Money minValue, Money maxValue){
		if(salesPriceValue.getValue().compareTo(new BigDecimal("0")) >= 0 && salesPriceValue.value.compareTo(maxValue.getValue()) <= 0)
			return true;
		return false;
	}
	
	/*
	 
	 public static final HTML createSuccessDocument(final boolean success, final String errorMessage) {
	 	return <%
	 		<AlterSalesPriceStatus>
	 			<success>
	 				{% success %}
	 			</success>
	 			<errorMessage>
	 				{% errorMessage %}
	 			</errorMessage>
	 		</AlterSalesPriceStatus>
	 	%>;
	 }
	 
	 */
    private Document createSuccessDocument(Boolean success, String errorMessage) {

        Document xmldoc = null;
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            DOMImplementation impl = builder.getDOMImplementation();
            Element e = null;
            Element e1 = null;
            Node n = null;
            // Document.
            xmldoc = impl.createDocument(null, "AlterSalesPriceStatus", null);
            // Root element.
            Element root = xmldoc.getDocumentElement();

            e1 = xmldoc.createElementNS(null, "success");
            n = xmldoc.createTextNode(success.toString());
            e1.appendChild(n);
            
            root.appendChild(e1);
            
            e1 = xmldoc.createElementNS(null, "errorMessage");
            n = xmldoc.createTextNode(errorMessage);
            e1.appendChild(n);
                       
            root.appendChild(e1);
            
        } catch (FactoryConfigurationError e) {
            System.out.println("Could not locate a JAXP DocumentBuilderFactory class");
        } catch (ParserConfigurationException e) {
            System.out.println("Could not locate a JAXP DocumentBuilder class");
        }
        //System.out.println(xmldoc);
        return xmldoc;
    }
	
	
	

    /**
     * Transform a DOM Document into an an XML document as a string
     * Used for transforming in a JSP
     *
     * @param xmldoc
     * @return
     */
    private String convertToXML(Document xmldoc) {

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
        return xmlString;
    }



}

/*

private Document convertBookDataToDocument(Set<Book.Data> rows) {

    Document xmldoc = null;
    try {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        DOMImplementation impl = builder.getDOMImplementation();
        Element e = null;
        Element e1 = null;
        Node n = null;
        // Document.
        xmldoc = impl.createDocument(null, "books", null);
        // Root element.
        Element root = xmldoc.getDocumentElement();

        for (Book.Data bd: rows) {
            e1 = xmldoc.createElementNS(null, "book");
            e = xmldoc.createElementNS(null, "author");
            n = xmldoc.createTextNode(bd.author.getValue());
            e.appendChild(n);
            e1.appendChild(e);

            e = xmldoc.createElementNS(null, "dateEntered");
            n = xmldoc.createTextNode(bd.dateEntered.toString());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "description");
            n = xmldoc.createTextNode(bd.description.getValue());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "dimensions");
            n = xmldoc.createTextNode(bd.dimensions.toString());
            e.appendChild(n);
            e1.appendChild(e);
            
            
            e = xmldoc.createElementNS(null, "genre");
            n = xmldoc.createTextNode(bd.genre.getValue());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "isbn10");
            n = xmldoc.createTextNode(bd.isbn10.getValue());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "isbn13");
            n = xmldoc.createTextNode(bd.isbn13.getValue());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "listPrice");
            n = xmldoc.createTextNode(bd.listPrice.getValue().toPlainString());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "numberOfBooks");
            n = xmldoc.createTextNode(bd.numberOfBooks.getValue().toString());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "numberOfPages");
            n = xmldoc.createTextNode(bd.numberOfPages.getValue().toString());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "publisher");
            n = xmldoc.createTextNode(bd.publisher.getValue());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "salePrice");
            n = xmldoc.createTextNode(bd.salePrice.getValue().toPlainString());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "thumbnail");
            n = xmldoc.createTextNode(bd.thumbnail.getValue());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "title");
            n = xmldoc.createTextNode(bd.title.getValue());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "weight");
            n = xmldoc.createTextNode(bd.weight.getValue().toString());
            e.appendChild(n);
            e1.appendChild(e);
            
            e = xmldoc.createElementNS(null, "wholesalePrice");
            n = xmldoc.createTextNode(bd.wholesalePrice.getValue().toPlainString());
            e.appendChild(n);
            e1.appendChild(e);
            
            root.appendChild(e1);
        }
    } catch (FactoryConfigurationError e) {
        System.out.println("Could not locate a JAXP DocumentBuilderFactory class");
    } catch (ParserConfigurationException e) {
        System.out.println("Could not locate a JAXP DocumentBuilder class");
    }
    return xmldoc;
}

*/
