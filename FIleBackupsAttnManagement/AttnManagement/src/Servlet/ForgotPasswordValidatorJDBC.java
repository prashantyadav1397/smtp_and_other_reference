package Servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ForgotPasswordValidatorJDBC {

	public int insert(String userId, String dob, String mobile, String emailId) throws ClassNotFoundException, SQLException {
		
		//Downloading drivers : Database
		Class.forName("com.mysql.jdbc.Driver"); 
		
		
		//Connection open
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
		
		PreparedStatement ps1=con.prepareStatement("select role from userDetails where id=?");
		ps1.setString(1,userId);  
		ResultSet result1=	ps1.executeQuery();
		String output1="";
		while(result1.next()) {
			output1=result1.getString(1);
		}
		PreparedStatement ps;
		if(output1.equalsIgnoreCase("Student")) {
			  ps=con.prepareStatement("select count(*) from Register where usn=? and dob=? and mobile=? and emailId=?"); 
			    ps.setString(1,userId);  
			    ps.setString(2,dob);  
			    ps.setString(3,mobile);  
			    ps.setString(4,emailId); 
		}
		else {
		//Preparing query
		  ps=con.prepareStatement("select count(*) from Register where employeeId=? and dob=? and mobile=? and emailId=?");  
    ps.setString(1,userId);  
    ps.setString(2,dob);  
    ps.setString(3,mobile);  
    ps.setString(4,emailId); 
		}
		
		//Executing the queries
	ResultSet result=	ps.executeQuery();
	int output=0;
	while(result.next()) {
		output=result.getInt(1);
	}
	
	System.out.println("result::::::"+result);
	return output;

	}

}
