package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.OrderDetailDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.QuantitySell;
@WebServlet(urlPatterns = {"/quantity-sell"})
public class QuantitySaleOut extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<QuantitySell> qs = new ArrayList<>();
		List<QuantitySell> spout = new ArrayList<>();
		ProductDAO proDAO = new ProductDAO();
		qs = proDAO.quantitySell();
		List<Product> s = new ArrayList<>();
		s = proDAO.getAllIn();
		int i = 0;
		
		
		req.setAttribute("s", s);
		req.setAttribute("qs", qs);
		req.getRequestDispatcher("/views/admin/listQuantitySell.jsp").forward(req, resp);
	}
}
