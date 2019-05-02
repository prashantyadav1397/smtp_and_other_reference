package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.AttnManagement.passwordcreator.CredentialCreatorBean;

/**
 * Servlet implementation class servlet
 */
public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String role =	request.getParameter("role");
	String name =	request.getParameter("name");
	String mobile =	request.getParameter("mobile");
	String emailId =	request.getParameter("emailId");
	String dob =	request.getParameter("dob");
	String address =	request.getParameter("address");
	String organization =	request.getParameter("organization");
	String branch =	request.getParameter("branch");
	String employeeId =	request.getParameter("employeeId");
	String usn =	request.getParameter("usn");
	String telephoneNumber =	request.getParameter("telephoneNumber");
		
		
	
	
	System.out.println(name);
	System.out.println(mobile);
	System.out.println(emailId);
	System.out.println(dob);
	System.out.println(address);
	System.out.println(organization);
	System.out.println(role);
	System.out.println(employeeId);
	System.out.println(telephoneNumber);
	
	
	JDBC j= new JDBC();
	try {
		CredentialCreatorBean ccb=	j.insert(name,mobile,emailId,dob,address,organization,branch,role,employeeId,telephoneNumber,usn);
	
	System.out.println("Credentials:::::::::::::"+ccb.getUserId()+"   "+ccb.getPassword());
		
	//request.setAttribute("userId", ccb.getUserId());
	
	
	
			/*
			 * HttpSession session=request.getSession(); session.setAttribute("ccbobj",ccb);
			 */
	//request.getSession().setAttribute("password", ccb.getPassword());
	request.getSession().setAttribute("userId", ccb.getUserId());
	request.getSession().setAttribute("password", ccb.getPassword());
	 response.sendRedirect("index.jsp"); 
			 
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
		
	}

}


























