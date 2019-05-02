package Servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mailing.service.MailSender;

public class NoticeBoardJDBC {

	public void insert(String noticeInfo,String branch,String timeLine) throws ClassNotFoundException, SQLException {
		// Downloading drivers : Database
		Class.forName("com.mysql.jdbc.Driver");
		// Connection open
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
		// Preparing query
		PreparedStatement ps = con.prepareStatement("insert into NoticeBoard(noticeInfo,branch,timeLine) values (?,?,?)");
		ps.setString(1, noticeInfo);
		ps.setString(2, branch);
		ps.setString(3, timeLine);
		// Executing the queries
		ps.executeUpdate();
		
		PreparedStatement ps2 = con.prepareStatement("select emailId from register where branch = ?");
		ps2.setString(1, branch);
		
		ResultSet rs1=ps2.executeQuery();
		while(rs1.next()) {
			
			String currentEmailId=rs1.getString(1);
				
				  MailSender ms= new MailSender(); ms.send("seems.cse4@gmail.com","Seems@2018", currentEmailId, "Dear Team, Welcome to the notice board of CSE."
				  ,"The current information on notice board of CSE is  :"
				  +noticeInfo +" and please follow it without fail.");

				 
		}
		
		
												
		
	}

}
