package com.view.book;

import java.io.IOException;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import com.dataClasses.Database;
import com.dataClasses.Maybe;
import com.dataClasses.RatingStats;
import com.dataClasses.TextReviewData;
import com.servlets.Attributes;
import com.servlets.Conts;
import com.servlets.MainPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;
import com.xml.XML;

/**
 * Servlet implementation class ViewBookServlet
 */
public class ViewBookServlet extends MainPageServlet {
	private static final long serialVersionUID = 1L;

    @Override
    public final Conts.Cont body(
    		final Database db, 
    		final Session session,
    		final Parameters parameters) 
    		throws ServletException, IOException, SQLException {
				
		for(final Book.Id id : validate(db, parameters)) {
			final Attributes attributes = known(db, session, id);
			return Conts.display("/jsp/viewbookpanel.jsp", attributes);
		}
		
		return Conts.error("viewBookError", "Invalid isbn#");		
    }
    
    public static final Maybe<Book.Id> validate(final Database db, final Parameters parameters) throws SQLException {
    	for(final String input : parameters.get("isbn"))
    	for(final Book.Isbn13 isbn : Book.Isbn13.parse(input))
    	for(final Book.Id id : db.fromIsbn(isbn))
    		return Maybe.just(id);
    	
    	return Maybe.nothing();
    }
    
	public static final Attributes known(
			final Database db, 
			final Session session,
			final Book.Id book) 
			throws ServletException, IOException, SQLException {
		
		final Book.Data bookData = db.get(book);
		final Set<Book.Id> related = db.relatedBooks(book, 6);
		final List<TextReviewData> textReviews = db.getTextReviews(book);
		final RatingStats ratings = db.getRatingStats(book);

		final Attributes attributes = new Attributes();		
		attributes.set("book", bookData);
		attributes.set("relatedBooks", db.getBooks(related));
		attributes.set("reviews", textReviews);
		attributes.set("averageRating", ratings.average);
		attributes.set("totalReviews", textReviews.size());
		attributes.set("totalRatings", ratings.count);

		String xmlString = null;
        Document xmldoc = convertBookDataToDocument(bookData,ratings);
        if (xmldoc != null) {
              xmlString = convertToXML(xmldoc);
              attributes.set("xmlString", xmlString);
        }
		
		final Maybe<User.Authority> user = session.loggedOnUser;
		if(!user.isNull())
			db.visit(user.value(), book);
		
		final Cookie cookie = new Cookie("lastGenre", bookData.genre.value);
		cookie.setMaxAge(60*60*24*365);
		session.addCookie(cookie);

		return attributes;

	}
	
	/**
     * Convert the ArrayList of fish objects to a DOM Document
     *
     * @param rows
     * @return
     */
    private static Document convertBookDataToDocument(Book.Data bookData, RatingStats ratings) {

        Document xmldoc = null;
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            DOMImplementation impl = builder.getDOMImplementation();
            Element e = null;
            Element e1 = null;
            Element e2 = null;
            Node n = null;
            // Document.
            xmldoc = impl.createDocument(null, "books", null);
            // Root element.
            Element root = xmldoc.getDocumentElement();

                e1 = xmldoc.createElementNS(null, "book");
                e = xmldoc.createElementNS(null, "title");
                n = xmldoc.createTextNode(bookData.title.value);
                e.appendChild(n);
                e1.appendChild(e);
                e = xmldoc.createElementNS(null, "author");
                n = xmldoc.createTextNode(bookData.author.value);
                e.appendChild(n);
                e1.appendChild(e);
                e = xmldoc.createElementNS(null, "publisher");
                n = xmldoc.createTextNode(bookData.publisher.value);
                e.appendChild(n);
                e1.appendChild(e);
                e = xmldoc.createElementNS(null, "numberOfBooks");
                n = xmldoc.createTextNode(bookData.numberOfBooks.toString().equals("Nothing")?"0":bookData.numberOfBooks.value().toString());
                e.appendChild(n);
                e1.appendChild(e);
                e = xmldoc.createElementNS(null, "numberOfPages");
                n = xmldoc.createTextNode(bookData.numberOfPages.toString());
                e.appendChild(n);
                e1.appendChild(e);
                e = xmldoc.createElementNS(null, "genre");
                n = xmldoc.createTextNode(bookData.genre.value);
                e.appendChild(n);
                e1.appendChild(e);

                e = xmldoc.createElementNS(null, "price");                
                if (bookData.listPrice.value.equals(bookData.salePrice.value))
                {
                	e2 = xmldoc.createElementNS(null, "sale");
                	n = xmldoc.createTextNode("$" + bookData.listPrice.toString());
                	e2.appendChild(n);
                	e.appendChild(e2);
                	e2 = xmldoc.createElementNS(null, "list");
                	n = xmldoc.createTextNode("");
                	e2.appendChild(n);
                	e.appendChild(e2);
                }
                else
                {
                	e2 = xmldoc.createElementNS(null, "sale");
                	n = xmldoc.createTextNode("$" + bookData.salePrice.toString() + " ");
                	e2.appendChild(n);
                	e.appendChild(e2);
                	e2 = xmldoc.createElementNS(null, "list");
                	n = xmldoc.createTextNode("$" + bookData.listPrice.toString());
                	e2.appendChild(n);
                	e.appendChild(e2);
                }
                e1.appendChild(e);
                
                e = xmldoc.createElementNS(null, "isbn13");
                n = xmldoc.createTextNode(bookData.isbn13.toString());
                e.appendChild(n);
                e1.appendChild(e);
                e = xmldoc.createElementNS(null, "isbn10");
                n = xmldoc.createTextNode(bookData.isbn10.toString());
                e.appendChild(n);
                e1.appendChild(e);
                e = xmldoc.createElementNS(null, "weight");
                n = xmldoc.createTextNode(bookData.weight.toString());
                e.appendChild(n);
                e1.appendChild(e);

                e = xmldoc.createElementNS(null, "width");
                n = xmldoc.createTextNode(String.valueOf(bookData.dimensions.width));
                e.appendChild(n);
                e1.appendChild(e);
                
                e = xmldoc.createElementNS(null, "length");
                n = xmldoc.createTextNode(String.valueOf(bookData.dimensions.length));
                e.appendChild(n);
                e1.appendChild(e);
                
                e = xmldoc.createElementNS(null, "height");
                n = xmldoc.createTextNode(String.valueOf(bookData.dimensions.height));
                e.appendChild(n);
                e1.appendChild(e);
                
                e = xmldoc.createElementNS(null, "description");
                n = xmldoc.createTextNode(bookData.description.value);
                e.appendChild(n);
                e1.appendChild(e);
                e = xmldoc.createElementNS(null, "ratings");
                n = xmldoc.createTextNode(String.valueOf(ratings.count));
                e.appendChild(n);
                e1.appendChild(e);
                
                e = xmldoc.createElementNS(null, "rating");
                if (ratings.average == null)
                {
                	e2 = xmldoc.createElementNS(null, "text");
                	n = xmldoc.createTextNode("No Ratings Yet");
                	e2.appendChild(n);
                    e.appendChild(e2);
                }
                else
                {
                	
                	generateRatingElements(ratings.average,xmldoc,e);
                	e.appendChild(e2);
                }
                e1.appendChild(e);
                
                e = xmldoc.createElementNS(null, "bookThumbnailSrc");
                n = xmldoc.createTextNode("bookImages/" + bookData.thumbnail.value);
                e.appendChild(n);
                e1.appendChild(e);
                e = xmldoc.createElementNS(null, "bookCoverSrc");
                n = xmldoc.createTextNode("bookImages/" + bookData.cover.value);
                e.appendChild(n);
                e1.appendChild(e);

                //Either shows num of books left or out of stock.
            	e = xmldoc.createElementNS(null, "stockavailability");
                if (bookData.numberOfBooks.isNull())
                	n = xmldoc.createTextNode("Out Of Stock!");
                else
                	n = xmldoc.createTextNode(bookData.numberOfBooks.value() + " books available");
            	e.appendChild(n);
            	e1.appendChild(e);
                
            	//E-FORMATS
            	e = xmldoc.createElementNS(null, "eformats");
            	if (bookData.eformats.size() > 0)
                	n = xmldoc.createTextNode(bookData.eformats.toString()); // added .toString()
            	else
            		n = xmldoc.createTextNode("None");
            	e.appendChild(n);
            	e1.appendChild(e);

            	//Types Of Book (either paper, e-book, or both)            		
            	e = xmldoc.createElementNS(null, "typeOfBook");
            	if (!bookData.numberOfBooks.isNull())
            	{
            		if (bookData.eformats.size() > 0)
            		{
            			e2 = xmldoc.createElementNS(null, "isElectronic");
            			n = xmldoc.createTextNode("true");
            			e2.appendChild(n);
            			e1.appendChild(e2);
            			e2 = xmldoc.createElementNS(null, "isPaper");
            			n = xmldoc.createTextNode("true");
            			e2.appendChild(n);
            			e1.appendChild(e2);
            			n = xmldoc.createTextNode(" [Paper & EBook]");
            		}
            		else
            		{
            			e2 = xmldoc.createElementNS(null, "isPaper");
            			n = xmldoc.createTextNode("true");
            			e2.appendChild(n);
            			e1.appendChild(e2);
            			e2 = xmldoc.createElementNS(null, "isElectronic");
            			n = xmldoc.createTextNode("false");
            			e2.appendChild(n);
            			e1.appendChild(e2);
            			n = xmldoc.createTextNode(" [Paper]");
            		}
            	}
            	else
            	{
        			e2 = xmldoc.createElementNS(null, "isPaper");
        			n = xmldoc.createTextNode("false");
        			e2.appendChild(n);
        			e1.appendChild(e2);
        			e2 = xmldoc.createElementNS(null, "isElectronic");
        			n = xmldoc.createTextNode("true");
        			e2.appendChild(n);
        			e1.appendChild(e2);
           			n = xmldoc.createTextNode(" [EBook]");
            	}
            	e.appendChild(n);
            	e1.appendChild(e);
            	
            	root.appendChild(e1);
                
        } catch (FactoryConfigurationError e) {
            System.out.println("Could not locate a JAXP DocumentBuilderFactory class");
        } catch (ParserConfigurationException e) {
            System.out.println("Could not locate a JAXP DocumentBuilder class");
        }
        return xmldoc;
    }
/**
 * Generate the XML elements and nodes for returning ratings to view book
 * 
 * @param rating The BigDecimal average rating of the book
 * @param xmldoc The xml document container to apply generated results to.
 * @param parentElement The Element type that is the parent to all these children
 */
    private static void generateRatingElements(BigDecimal rating, Document xmldoc, Element parentElement)
    {
    	Element e = null;
    	Node n = null;
    	
    	e = xmldoc.createElementNS(null, "text");
    	n = xmldoc.createTextNode("Rating of " + String.valueOf(rating) + "/5");
    	e.appendChild(n);
    	parentElement.appendChild(e);
    	
    	e = xmldoc.createElementNS(null, "imageSrc");
    	n = null;
		double result = rating.doubleValue();
		if (result >= 5)
			n = xmldoc.createTextNode("imgs/diamondpickaxe.png");
		else if (result >= 4 && n == null)
			n = xmldoc.createTextNode("imgs/goldpickaxe.png");
		else if (result >= 3 && n == null)
			n = xmldoc.createTextNode("imgs/ironpickaxe.png");
		else if (result >= 2 && n == null)
			n = xmldoc.createTextNode("imgs/stonepickaxe.png");
		else if (result >= 1 && n == null)
			n = xmldoc.createTextNode("imgs/woodpickaxe.png");
		e.appendChild(n);
		parentElement.appendChild(e);
		
		for (int i = 1; i <= 5 ; i++)
		{
			e = xmldoc.createElementNS(null, "image" + i);
			n = xmldoc.createTextNode("visibility:" + (i > rating.intValue()?"hidden;":"visible;"));
			e.appendChild(n);
			parentElement.appendChild(e);
		}
    }
    
    /**
     * Transform a DOM Document into an an XML document as a string
     * Used for transforming in a JSP
     *
     * @param xmldoc
     * @return
     */
    private static String convertToXML(Document xmldoc) {

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
