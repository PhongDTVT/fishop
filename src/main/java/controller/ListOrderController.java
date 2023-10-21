package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.OrderDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import model.Product;
@WebServlet(urlPatterns = {"/listOrder"})
public class ListOrderController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Order> orders = new ArrayList<>();
		OrderDAO oDAO = new OrderDAO();
		orders = oDAO.getAll();
		req.setAttribute("orders", orders);
		req.getRequestDispatcher("/views/admin/listOrder.jsp").forward(req, resp);
	}
}
