package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
@WebServlet(urlPatterns = {"/filter"})
public class FilterProductPage extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		ProductDAO productDAO = new ProductDAO();
		List<Product> products = new ArrayList<>();
		products = productDAO.getAllLoaiSpId(id);
		req.setAttribute("products", products);
		req.getRequestDispatcher("/views/client/filterPage.jsp").forward(req, resp);
		
	}
}
