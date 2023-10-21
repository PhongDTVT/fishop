package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.CartUserDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartUser;
import model.Category;
import model.Product;
import model.User;
@WebServlet(urlPatterns = {"/product"})
public class ProductPage extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		User u = new User();
		UserDAO uDAO = new UserDAO();
		HttpSession  session = req.getSession();
		u = uDAO.getByUserName((String) session.getAttribute("username"));
		if(id != 1 && id != 5) {
			ProductDAO productDAO = new ProductDAO();
			List<Product> p = new ArrayList<>();
			p = productDAO.getAllCategoryId(id);
			List<CartUser> cUsers = new ArrayList<>();
			CartUserDAO cUDAO = new CartUserDAO();
			if(u != null) {
			cUsers = cUDAO.getAllByUserId(u.getId());
			}
			session.setAttribute("cUsers", cUsers);
			
			req.setAttribute("p", p);
			req.getRequestDispatcher("/views/client/productPage.jsp").forward(req, resp);
		}else if(id == 5) {
			ProductDAO productDAO = new ProductDAO();
			List<Product> p = new ArrayList<>();
			p = productDAO.getAllSale();
			req.setAttribute("p", p);
			req.getRequestDispatcher("/views/client/productPage.jsp").forward(req, resp);
		}
		else  {
			resp.sendRedirect("/FiShop/index");
		}
		
	}
	
}
