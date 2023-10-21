package clientController;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/login-client"})
public class LoginClientController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		UserDAO userDAO = new UserDAO();
		if(userDAO.loginUser(username, password)) {
			HttpSession session = req.getSession();
			session.setAttribute("username", username);
			resp.sendRedirect("/FiShop/index");
			
		}else {
			req.setAttribute("loginError", "Wrong username or password");
			req.getRequestDispatcher("/index").forward(req, resp);
			
		}
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		UserDAO userDAO = new UserDAO();
		if(userDAO.loginUser(username, password)) {
			HttpSession session = req.getSession();
			session.setAttribute("username", username);
			resp.sendRedirect("/FiShop/index");
			
		}else {
			req.setAttribute("loginError", "Wrong username or password");
			req.getRequestDispatcher("/index").forward(req, resp);
		}
	}
}
