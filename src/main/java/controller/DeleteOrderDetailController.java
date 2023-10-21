package controller;

import java.io.IOException;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = {"/deleteDetail"})
public class DeleteOrderDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("oId"));
		OrderDetailDAO oDAO = new OrderDetailDAO();
		oDAO.delete(id);
		resp.sendRedirect("/FiShop/listOrderDetail");
	}
}
