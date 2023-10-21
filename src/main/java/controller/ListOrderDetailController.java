package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import model.OrderDetail;
@WebServlet(urlPatterns = {"/listOrderDetail"})
public class ListOrderDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<OrderDetail> ods = new ArrayList<>();
		OrderDetailDAO oDDAO = new OrderDetailDAO();
		ods = oDDAO.getAll();
		req.setAttribute("ods", ods);
		req.getRequestDispatcher("/views/admin/listOrderDetail.jsp").forward(req, resp);
	}
}
