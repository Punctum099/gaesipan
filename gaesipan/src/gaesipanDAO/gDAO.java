package gaesipanDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import gaesipanDTO.gDTO;

public class gDAO {

	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/gaesipan?characterEncoding=UTF-8&serverTimezone=UTC";
	private String upw = "tjddlr320";
	private String query = "select * FROM bored";
	
	public gDAO() {
		try{
			Class.forName(driver);	//com.mysql.cj.jdbc.Driver
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<gDTO> content(){
		
		ArrayList<gDTO> dtos = new ArrayList<gDTO>();
		
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try{
			connection = DriverManager.getConnection(url, "root", upw);	//jdbc:mysql://localhost:3306/gaesipan?characterEncoding=UTF-8&serverTimezone=UTC
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);	//select * from bored
			
			while(resultSet.next()){
				int siq = resultSet.getInt("siq");
				String title = resultSet.getString("title");
				String contents = resultSet.getString("contents");
				String author = resultSet.getString("author");
				int hit = resultSet.getInt("hit");
				String time = resultSet.getString("time");
				String UPtime = resultSet.getString("UPtime");
				String see = resultSet.getString("see");
				
				gDTO dto = new gDTO(siq, title, contents, author, hit, time, UPtime, see);
				dtos.add(dto);
			}
		} catch(Exception e) {
			} finally {
				try{
					if(resultSet != null) resultSet.close();
					if(statement != null) statement.close();
					if(connection != null) connection.close();
				} catch(Exception e){
					e.printStackTrace();
				}
			}
		
		return dtos;
	}
	
public ArrayList<gDTO> list() {
		
		ArrayList<gDTO> dtos = new ArrayList<gDTO>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			String query = "select * from bored";
			connection = DriverManager.getConnection(url, "root", upw);
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				int siq = resultSet.getInt("siq");
				String title = resultSet.getString("title");
				String contents = resultSet.getString("contents");
				String author = resultSet.getString("author");
				int hit = resultSet.getInt("hit");
				String time = resultSet.getString("time");
				String UPtime = resultSet.getString("UPtime");
				String see = resultSet.getString("see");
				
				gDTO dto = new gDTO(siq, title, contents, author, hit, time, UPtime, see);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}

	public gDTO contentView(String siq) {
		// TODO Auto-generated method stub
		
		upHit(siq);
		
		gDTO dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {

			connection = DriverManager.getConnection(url, "root", upw);
			
			String query = "select * from bored where siq = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(siq));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				int Isiq = resultSet.getInt("siq");
				String title = resultSet.getString("title");
				String contents = resultSet.getString("contents");
				String author = resultSet.getString("author");
				int hit = resultSet.getInt("hit");
				String time = resultSet.getString("time");
				String UPtime = resultSet.getString("UPtime");
				String see = resultSet.getString("see");
				
				dto = new gDTO(Isiq, title, contents, author, hit, time, UPtime, see);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dto;
	}

	private void upHit(String siq) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = DriverManager.getConnection(url, "root", upw);
			String query = "UPDATE bored SET hit = hit + 1 WHERE siq = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, siq);
			
			preparedStatement.executeUpdate();
					
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
	
	public void delete(String siq) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			
			connection = DriverManager.getConnection(url, "root", upw);
			String query = "DELETE FROM bored WHERE siq = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(siq));
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
}
