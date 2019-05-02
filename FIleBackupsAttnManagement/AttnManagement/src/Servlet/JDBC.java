package Servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.AttnManagement.passwordcreator.CredentialCreatorBean;
import com.AttnManagement.passwordcreator.PasswordCreatotr;
import com.mailing.service.MailSender;

public class JDBC {

	public CredentialCreatorBean insert(String name, String mobile, String emailId, String dob, String address, String organization,String branch,
			String role, String employeeId, String telephoneNumber,String usn) throws ClassNotFoundException, SQLException {
		CredentialCreatorBean ccb= new CredentialCreatorBean();
		//Downloading drivers : Database
		Class.forName("com.mysql.jdbc.Driver"); 
		
		
		//Connection open
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
		
		//Preparing query
		 PreparedStatement ps=con.prepareStatement("insert into Register(name,mobile,emailId,dob,address,organization,branch,role,employeeId,telephoneNumber,usn) values (?,?,?,?,?,?,?,?,?,?,?)");  
    ps.setString(1,name);  
    ps.setString(2,mobile);  
    ps.setString(3,emailId);  
    ps.setString(4,dob);
    ps.setString(5,address);  
    ps.setString(6,organization); 
    ps.setString(7,branch); 
    
    ps.setString(8,role);  
    ps.setString(9,employeeId);
    ps.setString(10,telephoneNumber);
    ps.setString(11, usn);
    	
		//Executing the queries
		ps.executeUpdate();
		PreparedStatement ps1;
		if(role.equalsIgnoreCase("Student")) {
			ps1 = con.prepareStatement("insert into userDetails(id,password,loginCount,role) values (?,?,?,?)");
			ps1.setString(1, usn);
		} else {
			ps1 = con.prepareStatement("insert into userDetails(id,password,loginCount,role) values (?,?,?,?)");
			ps1.setString(1, employeeId);

		}
	  PasswordCreatotr pg= new PasswordCreatotr();
	String password=  pg.getAlphaNumericString();
	    ps1.setString(2,password);
	    ps1.setInt(3, 1);
	    ps1.setString(4, role);
	    int result=ps1.executeUpdate();
	    
	    
	System.out.println("Result::::::::::::::"+result);
	ArrayList<Object> list= new ArrayList<Object>();
	PreparedStatement ps2;
		if (role.equalsIgnoreCase("Student")) {
			ps2 = con.prepareStatement("select * from userDetails where id = ?");
			ps2.setString(1, usn);

		} else {
			ps2 = con.prepareStatement("select * from userDetails where id = ?");
			ps2.setString(1, employeeId);
		}
	
	ResultSet rs1=ps2.executeQuery();
	while(rs1.next()) {
		
		
		System.out.println("User ID::::::::::::::::"+rs1.getString(1));
		System.out.println("Password::::::::::::::::"+rs1.getString(2));
		
		
		
		ccb.setUserId(rs1.getString(1));
		ccb.setPassword(rs1.getString(2));
		
		
			
			  MailSender ms= new MailSender(); ms.send("seems.cse4@gmail.com","Seems@2018",emailId, "Registration Successful."
			  ,"Congratulations, your registration has been done successfully in Smart attendance management system with user id :"
			  +rs1.getString(1)+" and password is : "+rs1.getString(2)
			  +". Please login into the system for further use. ");

			 
	}
	
	//Closing the connection
		con.close();
		return ccb;
	}

	
	
	
	
	
}
