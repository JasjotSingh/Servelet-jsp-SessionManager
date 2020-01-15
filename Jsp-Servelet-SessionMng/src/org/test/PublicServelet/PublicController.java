package org.test.PublicServelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PublicController
 */
@WebServlet("/PublicController")
public class PublicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublicController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch(action) {
		case "Login":
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		case "About":
			request.getRequestDispatcher("About.jsp").forward(request, response);
		default:
			response.sendRedirect("NotFound.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at:").append(request.getContextPath());
		String UserName = request.getParameter("username");
		String PassWord = request.getParameter("password");
		if(PassWord.equals("pass") && UserName.equals("Jas")) {
			request.getSession().invalidate();
			HttpSession NewSession = request.getSession(true);
			NewSession.setMaxInactiveInterval(300);
			//request.getRequestDispatcher("/PrivateController?action=MemberArea").forward(request, response);
			Cookie CUserName = new Cookie("UserName", UserName);
			response.addCookie(CUserName);
			response.sendRedirect("MemberArea.jsp");
		}
		else {
			//request.getRequestDispatcher("/PublicController?action=Login").forward(request, response);
			response.sendRedirect("Login.jsp");
		}
	}

}
