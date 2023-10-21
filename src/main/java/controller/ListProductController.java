
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.CategoryDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;
@WebServlet(urlPatterns = {"/list-product"})
public class ListProductController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Product> products = new ArrayList<>();
		ProductDAO proDAO = new ProductDAO();
		products = proDAO.getAll();
		req.setAttribute("products", products);
		req.getRequestDispatcher("/views/admin/listProduct.jsp").forward(req, resp);
		
	}
	
}
