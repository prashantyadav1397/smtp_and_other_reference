package Servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class loginJDBC {

	public int insert(String userId, String password,String loginId) throws ClassNotFoundException, SQLException {
		
		//Downloading drivers : Database
				Class.forName("com.mysql.jdbc.Driver"); 
				
				
				//Connection open
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
				
				//Preparing query
				 PreparedStatement ps=con.prepareStatement("select count(*) from userDetails where id=? and password=? and role=?");  
		    ps.setString(1,userId);  
		    ps.setString(2,password);  
		    ps.setString(3, loginId);
		    			
				
				//Executing the queries
			ResultSet result=	ps.executeQuery();
			int output=0;
			while(result.next()) {
				output=result.getInt(1);
			}
			
			System.out.println("result::::::"+result);
			return output;
		
	}

	public int loginCheckAttempt(String userId, String password,String loginId) throws ClassNotFoundException, SQLException {
		// Downloading drivers : Database
		Class.forName("com.mysql.jdbc.Driver");

		// Connection open
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");

		// Preparing query
		PreparedStatement ps = con.prepareStatement("select loginCount from userDetails where id=? and password=? and role=?");
		ps.setString(1, userId);
		ps.setString(2, password);
		ps.setString(3, loginId);

		// Executing the queries
		ResultSet result = ps.executeQuery();
		int output = 0;
		while (result.next()) {
			output = result.getInt(1);
		}

		System.out.println("loginCount::::::" + result);
		return output;
	}

}
