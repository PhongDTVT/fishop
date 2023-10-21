package controller;

import java.io.IOException;

import dao.CategoryDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/deleteProduct"})
public class DeleteProductController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("pId"));
		ProductDAO proDAO = new ProductDAO();
		proDAO.delete(id);
		resp.sendRedirect("/FiShop/list-product");
	}
}
