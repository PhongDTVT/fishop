package clientController;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import model.UserInform;
@WebServlet(urlPatterns = {"/check"})
public class CheckOutController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("id") != null) {
		int uId = Integer.parseInt(req.getParameter("id"));
		UserDAO uDAO = new UserDAO();
		UserInform ui = new UserInform();
		
		if(uId > 0) {
		ui = uDAO.getByIdInform(uId);
		User user = new User();
		user = uDAO.getById(uId);
		int u_id = user.getId();
		req.setAttribute("u_id", u_id);
		req.setAttribute("ui", ui);
		req.setAttribute("user", user);
		req.getRequestDispatcher("/views/client/checkout.jsp").forward(req, resp);

		}
		}
		else {
			
			req.getRequestDispatcher("/views/client/checkout.jsp").forward(req, resp);
		}
	}
}
