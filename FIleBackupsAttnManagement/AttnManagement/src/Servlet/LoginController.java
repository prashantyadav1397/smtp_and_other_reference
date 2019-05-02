package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		
		
		String userId =	request.getParameter("userId");
		String password =	request.getParameter("password");
		String loginId =	request.getParameter("loginId");
		
		loginJDBC lj= new loginJDBC();
		try {
			
			int attemptNumber=lj.loginCheckAttempt(userId,password,loginId);
			if(attemptNumber==1) {
				response.sendRedirect("FirstTimePasswordChange.jsp");
			}
			
			else {
				int result = lj.insert(userId, password,loginId);
				if (result > 0) {
					if(loginId.equalsIgnoreCase("Admin")) {
					
					response.sendRedirect("Admin.jsp");
					}
					else if (loginId.equalsIgnoreCase("Student")) {
						response.sendRedirect("Student.jsp");
					}
					else {
						response.sendRedirect("Faculty.jsp");
					}
					
				} else {
					response.sendRedirect("index.jsp");
				}
			}
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	

}
