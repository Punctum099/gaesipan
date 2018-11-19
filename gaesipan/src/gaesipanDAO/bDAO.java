package gaesipanDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import gaesipanDTO.bDTO;

public class bDAO {

	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3307/gaesipan?characterEncoding=UTF-8&serverTimezone=UTC";	//포트번호 주의
	private String upw = "tjddlr320";
	private String query = "SELECT * FROM Board_TB WHERE see = 'Y' ORDER BY seq";
	private int pageSize = 20;
	
	public bDAO() {
		try{
			Class.forName(driver);	//com.mysql.jdbc.Driver
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<bDTO> content(){
		
		ArrayList<bDTO> dtos = new ArrayList<bDTO>();
		
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try{
			connection = DriverManager.getConnection(url, "root", upw);	//jdbc:mysql://localhost:3307/gaesipan?characterEncoding=UTF-8&serverTimezone=UTC
			statement = connection.createStatement();					//↑ 데이터베이스 타임 존 설정
			resultSet = statement.executeQuery(query);	//SELECT * FROM Board_TB WHERE see = 'Y' ORDER BY seq
			
			while(resultSet.next()){
				int seq = resultSet.getInt("seq");
				String title = resultSet.getString("title");
				String contents = resultSet.getString("contents");
				String author = resultSet.getString("author");
				int hit = resultSet.getInt("hit");
				String time = resultSet.getString("time");
				String UPtime = resultSet.getString("UPtime");
				String see = resultSet.getString("see");
				
				bDTO dto = new bDTO(seq, title, contents, author, hit, time, UPtime, see);
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
	
public ArrayList<bDTO> list(String pageNumber, String option, String search) {
		
		ArrayList<bDTO> dtos = new ArrayList<bDTO>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DriverManager.getConnection(url, "root", upw);
			String query = "SELECT * FROM Board_TB WHERE see = 'Y' ORDER BY seq LIMIT ?, ?";
			
			if(option.equals("author") || option.equals("title") || option.equals("contents")){
				query = "SELECT * FROM Board_TB WHERE see = 'Y' AND " + option + " LIKE '%" + search + "%' ORDER BY seq LIMIT ?, ?";
			}else if(option.equals("title_content")){
				query = "SELECT * FROM Board_TB WHERE see = 'Y' AND (title LIKE '%" + search + "%' OR contents LIKE '%" + search + "%') ORDER BY seq LIMIT ?, ?";
			}
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(pageNumber) * pageSize - pageSize);
			preparedStatement.setInt(2, pageSize);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				int seq = resultSet.getInt("seq");
				String title = resultSet.getString("title");
				String contents = resultSet.getString("contents");
				String author = resultSet.getString("author");
				int hit = resultSet.getInt("hit");
				String time = resultSet.getString("time");
				String UPtime = resultSet.getString("UPtime");
				String see = resultSet.getString("see");
				
				bDTO dto = new bDTO(seq, title, contents, author, hit, time, UPtime, see);
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

	public boolean nextPage(String pageNumber) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			String query = "SELECT * FROM Board_TB WHERE see = 'Y' AND seq >= ? ORDER BY seq;";
			connection = DriverManager.getConnection(url, "root", upw);
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(pageNumber) * 10);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				return true;
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
		return false;
	}
	
	public int targetPage(String pageNumber) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			String query = "SELECT COUNT(*) FROM Board_TB WHERE see = 'Y' AND seq > ?;";
			connection = DriverManager.getConnection(url, "root", upw);
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, (Integer.parseInt(pageNumber) - 1) * pageSize);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				return resultSet.getInt(1) / 10;
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
		return 0;
	}
	
	public int totalCount(String option, String search) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			String query = "SELECT COUNT(*) FROM Board_TB WHERE see = 'Y';";
			connection = DriverManager.getConnection(url, "root", upw);
			
			if(option.equals("author") || option.equals("title") || option.equals("contents")){
				query = "SELECT COUNT(*) FROM Board_TB WHERE see = 'Y'  AND " + option + " LIKE '%" + search + "%';";
			}else if(option.equals("title_content")){
				query = "SELECT COUNT(*) FROM Board_TB WHERE see = 'Y' AND (title LIKE '%" + search + "%' OR contents LIKE '%" + search + "%');";
			}
			
			
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				return resultSet.getInt(1);
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
		return 0;
	}

	public bDTO contentView(String seq, String modify) {
		// TODO Auto-generated method stub
		
		if(modify==null) {
			upHit(seq);
		}else {
			modify=null;
		}
		
		bDTO dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {

			connection = DriverManager.getConnection(url, "root", upw);
			
			String query = "SELECT * FROM Board_TB WHERE seq = ? AND see = 'Y'";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(seq));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				int Iseq = resultSet.getInt("seq");
				String title = resultSet.getString("title");
				String contents = resultSet.getString("contents");
				String author = resultSet.getString("author");
				int hit = resultSet.getInt("hit");
				String time = resultSet.getString("time");
				String UPtime = resultSet.getString("UPtime");
				String see = resultSet.getString("see");
				
				dto = new bDTO(Iseq, title, contents, author, hit, time, UPtime, see);
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

	private void upHit(String seq) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = DriverManager.getConnection(url, "root", upw);
			String query = "UPDATE Board_TB SET hit = hit + 1 WHERE seq = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, seq);
			
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
	
	public void delete(String seq) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			
			connection = DriverManager.getConnection(url, "root", upw);
			String query = "UPDATE Board_TB SET see = 'N' WHERE seq = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(seq));
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
	
	public void write(String title, String contents, String author) {
		// TODO Auto-generated method stub
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = DriverManager.getConnection(url, "root", upw);
			String query = "INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES (?, ?, ?, 0, NOW(), NOW(), 'Y');";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, contents);
			preparedStatement.setString(3, author);
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
	
	public void modify(String title, String contents, String seq) {
		// TODO Auto-generated method stub
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = DriverManager.getConnection(url, "root", upw);
			
			String query = "UPDATE Board_TB SET title=?, contents=?, UPtime=NOW() WHERE seq = ? LIMIT 1";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, contents);
			preparedStatement.setInt(3, Integer.parseInt(seq));
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
