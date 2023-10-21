package clientController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.CartUserDAO;
import dao.ProductDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartUser;
import model.Product;
import model.User;
@WebServlet(urlPatterns = {"/viewCart"})
public class ViewCartController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		
		HttpSession  session = req.getSession();
	
		List<Product> products = new ArrayList<>();
		ProductDAO proDAO = new ProductDAO();
		products = proDAO.getAll();
		
		req.setAttribute("products", products);
		req.getRequestDispatcher("/views/client/viewCart.jsp").forward(req, resp);
	}
}
