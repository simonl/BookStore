package com.dataClasses;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Used to prepare SQL statements
 * Takes the index at which it should start filling in values
 *   and the SQL statement into which to put those values
 * Returns the index where the next value should be inserted 
 * 
 * @author Simon Langlois
 */
public interface Preparer {
	public int prepare(int i, final PreparedStatement statement) throws SQLException; 
}