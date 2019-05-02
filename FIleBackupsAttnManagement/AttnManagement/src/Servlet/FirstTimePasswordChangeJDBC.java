package Servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.AttnManagement.passwordcreator.CredentialCreatorBean;

public class FirstTimePasswordChangeJDBC {

	
	// TODO Auto-generated method stub

	public CredentialCreatorBean insert(String userId, String password) throws ClassNotFoundException, SQLException {
	
			System.out.println("Details:::::::::::::::::::"+userId+"   "+password);
			
			
			//Downloading drivers : Database
			Class.forName("com.mysql.jdbc.Driver"); 

			//Connection open
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
			
			//Preparing query
			 PreparedStatement ps=con.prepareStatement("update userDetails set password=?, loginCount=? where id=?");  
	    ps.setString(1,password);  
	    ps.setInt(2, 2);
	    ps.setString(3,userId);  
	    	
			//Executing the queries
			ps.executeUpdate();
		CredentialCreatorBean ccb= new CredentialCreatorBean();
		PreparedStatement ps2=	con.prepareStatement("select * from userDetails where id = ?");
		 ps2.setString(1,userId);
		
		ResultSet rs1=ps2.executeQuery();
		while(rs1.next()) {
			
			
			System.out.println("User ID::::::::::::::::"+rs1.getString(1));
			System.out.println("Password::::::::::::::::"+rs1.getString(2));
			ccb.setUserId(rs1.getString(1));
			ccb.setPassword(rs1.getString(2));
		}
		
		
		return ccb;
			
		
	
	}	
}
