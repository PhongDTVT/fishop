package clientController;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
@WebServlet(urlPatterns = {"/register"})
public class RegisterClientController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		UserDAO userDAO = new UserDAO();
		User user = new User();
		user.setAddress(address);
		user.setEmail(email);
		user.setFullName(fullname);
		user.setPassWord(password);
		user.setUserName(username);
		user.setPhoneNumber(phone);
		
		userDAO.insert(user);
		req.setAttribute("user", user);
		resp.sendRedirect("/FiShop/index");
	}
	
}
