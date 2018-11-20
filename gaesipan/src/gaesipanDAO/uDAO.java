package gaesipanDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import gaesipanDTO.bDTO;

public class uDAO {

	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3307/gaesipan?characterEncoding=UTF-8&serverTimezone=UTC";	//포트번호 주의
	private String upw = "tjddlr320";
	private String query = "SELECT * FROM Member_TB";
	
	public uDAO() {
		try{
			Class.forName(driver);	//com.mysql.jdbc.Driver
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
