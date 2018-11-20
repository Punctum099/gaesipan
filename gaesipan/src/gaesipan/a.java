package gaesipan;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class a {

	 public static void main(String[] args) {
		 Connection connection = null;
		    Statement st = null;
		    try {
		        Class.forName("com.mysql.jdbc.Driver");
		        connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/gaesipan?characterEncoding=UTF-8&serverTimezone=UTC" , "root", "tjddlr320");
		        st = connection.createStatement();
		        connection.close();
		    } catch (SQLException se1) {
		        se1.printStackTrace();
		    } catch (Exception ex) {
		        ex.printStackTrace();
		    } finally {
		        try {
		            if (st != null)
		                st.close();
		        } catch (SQLException se2) {
		        }
		        try {
		            if (connection != null)
		                connection.close();
		        } catch (SQLException se) {
		            se.printStackTrace();
		        }
		    }

	 	}
	}