package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.CartUserDAO;
import dao.OrderDetailDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.OrderDetail;
import model.User;
@WebServlet(urlPatterns = {"/list-user"})
public class ListUserController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		List<User> users = new ArrayList<>();
		UserDAO uDAO = new UserDAO();
		users = uDAO.getAll();
		CartUserDAO cUDAO = new CartUserDAO();
		int[] uId = new int[users.size()];
		int i = 0;
		for (User u : users) {
			uId[i] = u.getId();
		}
		List<OrderDetail> ods = new ArrayList<>();
		OrderDetailDAO oDDAO = new OrderDetailDAO();
		ods = oDDAO.getAll();
		req.setAttribute("ods", ods);
		
		req.setAttribute("uId", uId);
		req.setAttribute("users", users);
		req.getRequestDispatcher("/views/admin/listUser.jsp").forward(req, resp);
	}
}
