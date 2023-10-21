package clientController;

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
@WebServlet(urlPatterns = {"/index"})
public class HomeController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		
		List<Product> products = new ArrayList<>();
		ProductDAO proDAO = new ProductDAO();
		products = proDAO.getAll();
		req.setAttribute("products", products);
		req.getRequestDispatcher("/views/client/homePage.jsp").forward(req, resp);
		
	}

}
