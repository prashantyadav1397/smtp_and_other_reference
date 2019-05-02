package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.AttnManagement.passwordcreator.CredentialCreatorBean;

/**
 * Servlet implementation class firstTimePasswordChangeController
 */
public class firstTimePasswordChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public firstTimePasswordChangeController() {
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
		FirstTimePasswordChangeJDBC j= new FirstTimePasswordChangeJDBC();
		try {
			
			
			CredentialCreatorBean ccb=	j.insert(userId,password);
		

			
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
