package com.reports;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.dataClasses.Database;
import com.dataClasses.Database.Manager;
import com.dataClasses.Maybe;
import com.servlets.ClosedServlet;
import com.servlets.Conts;
import com.servlets.Conts.Cont;
import com.servlets.ManagerPageServlet;
import com.servlets.Parameters;
import com.servlets.Session;

/**
 * @author Edward Gagnon
 */
public class ReportChooserServlet extends ManagerPageServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportChooserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	public Cont body(Manager token, Database db, Session session,
			Parameters parameters) throws ServletException, IOException,
			SQLException {
		//Based on the radio inputs, redirect to the appropriate servlet
		Maybe<String> reportToShow = parameters.get("reportOption");
		
		//Redirect to the appropriate report.
		if(reportToShow.isNull())
			return Conts.redirect(new ClosedServlet(new ShowReportMenuServlet(), parameters));
		else if(reportToShow.getValue().equals("totalSales")){
			return Conts.redirect(new ClosedServlet(new ShowTotalSalesReports(), parameters));
		}
		else if(reportToShow.getValue().equals("SalesByAuthor"))
			return Conts.redirect(new ClosedServlet(new SalesByAuthorDateChooser(), parameters));
		else if(reportToShow.getValue().equals("SalesByClient"))
			return Conts.redirect(new ClosedServlet(new SalesByClientDateChooser(), parameters));
		else if(reportToShow.getValue().equals("SalesByPublisher"))
			return Conts.redirect(new ClosedServlet(new SalesByPublisherDateChooser(), parameters));
		else if(reportToShow.getValue().equals("TopSellers"))
			return Conts.redirect(new ClosedServlet(new TopSellersDateChooser(), parameters));
		else if(reportToShow.getValue().equals("TopClients"))
			return Conts.redirect(new ClosedServlet(new TopClientsDateChooser(), parameters));
		else if(reportToShow.getValue().equals("ZeroSales"))
			return Conts.redirect(new ClosedServlet(new ZeroSalesDateChooser(), parameters));
		else if(reportToShow.getValue().equals("StockReport"))
			return Conts.redirect(new ClosedServlet(new StockReportServlet(), parameters));
		else if(reportToShow.getValue().equals("ReorderReport"))
			return Conts.redirect(new ClosedServlet(new ShowReorderReport(), parameters));
		else
			return Conts.redirect(new ClosedServlet(new ShowReportMenuServlet(), parameters));
		

	}

}
