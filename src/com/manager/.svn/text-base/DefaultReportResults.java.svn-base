package com.manager;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.dataClasses.Database;
import com.dataClasses.ResultNotUnique;
import com.reports.ReportDate;
import com.servlets.Attributes;

public abstract class DefaultReportResults {
	
	public static void addDefaultAttributesToReport(Database db, Attributes att, ReportDate rp) throws SQLException, ResultNotUnique{
		ResultSet allTimeTotalSalesResult = null;
		ResultSet allTimeTotalCostResult = null;
		ResultSet allTimeTotalProfitResult = null;
		


		allTimeTotalSalesResult = db.queryUnique("select COALESCE(sum(p.price * p.number_of_copies), 0) as 'Total_Purchase' FROM purchase p;");
		allTimeTotalCostResult = db.queryUnique("select COALESCE(sum(b.wholesale_price * p.number_of_copies), 0) as 'Total_Cost' from book b, purchase p where b.id = p.book_id;");
		allTimeTotalProfitResult = db.queryUnique("select (COALESCE(sum(p.price * p.number_of_copies), 0) - COALESCE(sum(b.wholesale_price * p.number_of_copies), 0)) as 'Total_Profit' from book b, purchase p where b.id = p.book_id;");
		
		att.set("totalSales", allTimeTotalSalesResult.getDouble(1));
		att.set("totalCost", allTimeTotalCostResult.getDouble(1));
		att.set("totalProfit", allTimeTotalProfitResult.getDouble(1));
		att.set("startDate", rp.getUtilStartDate().toString());
		att.set("endDate", rp.getUtilEndDate().toString());

	}

}
