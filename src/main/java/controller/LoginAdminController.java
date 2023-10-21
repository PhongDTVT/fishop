package controller;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/login"})
public class LoginAdminController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String adminname = req.getParameter("adminname");
		String password = req.getParameter("password");
		UserDAO userDAO = new UserDAO();
		if(userDAO.login(adminname, password)) {
			HttpSession session = req.getSession();
			session.setAttribute("adminname", adminname);
			resp.sendRedirect("/FiShop/list-category1");
			
		}else {
			req.setAttribute("loginError", "Wrong username or password");
			req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
		}
	}
}
