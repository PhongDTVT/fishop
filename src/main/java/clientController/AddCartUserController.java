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
import model.Cart;
import model.CartUser;
import model.Product;
import model.User;
@WebServlet(urlPatterns = {"/addCartuser"})
public class AddCartUserController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<CartUser> cUsers = new ArrayList<>();
		int id = Integer.parseInt(req.getParameter("id"));
		
		User user = new User();
		UserDAO uDAO = new UserDAO();
		HttpSession session = req.getSession();
		user = uDAO.getByUserName((String)session.getAttribute("username"));
		
		Product product = new Product();
		ProductDAO productDAO = new ProductDAO();
		CartUser cUser = new CartUser();
		CartUserDAO cUDAO = new CartUserDAO();
		product = productDAO.getById(id);
		cUser.setpId(id);
		cUser.setpName(product.getpName());
		cUser.setpMa(product.getpMa());
		cUser.setPrice(product.getPrice());
		cUser.setCategoryID(product.getCategoryID());
		cUser.setCategoryID(product.getCategoryID());
		cUser.setDiscount(product.getDiscount());
		cUser.setpDesc(product.getpDesc());
		cUser.setpImg(product.getpImg());
		cUser.setUserId(user.getId());
		cUser.setQuantityInCart(1);
		
		
		
		
		if(cUDAO.getById(id) == null) {
		cUDAO.insert(cUser);
		}else {
			cUDAO.update(id);
			
		}
		cUsers = cUDAO.getAllByUserId(user.getId());
		session.setAttribute("cUsers", cUsers);
		
		if(product.getCategoryID() == 2) {
			resp.sendRedirect("/FiShop/product?id=2");
			}else if(product.getCategoryID() == 3){
				resp.sendRedirect("/FiShop/product?id=3");
			}else if(product.getCategoryID() == 4) {
				resp.sendRedirect("/FiShop/product?id=4");
			}else  {
				resp.sendRedirect("/FiShop/product?id=5");
			}
		
		
		
		
	}
}
