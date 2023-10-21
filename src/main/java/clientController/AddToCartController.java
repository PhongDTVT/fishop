package clientController;

import java.io.IOException; 
import java.util.ArrayList;
import java.util.List;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Product;
@WebServlet(urlPatterns = {"/addCart"})
public class AddToCartController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Cart> carts = new ArrayList<>();
		int id = Integer.parseInt(req.getParameter("id"));
		
		
		Product product = new Product();
		ProductDAO productDAO = new ProductDAO(); 
		Cart cart = new Cart();
		product = productDAO.getById(id);
		cart.setpId(id);
		cart.setpName(product.getpName());
		cart.setpMa(product.getpMa());
		cart.setPrice(product.getPrice());
		cart.setCategoryID(product.getCategoryID());
		cart.setCategoryID(product.getCategoryID());
		cart.setDiscount(product.getDiscount());
		cart.setpDesc(product.getpDesc());
		cart.setpImg(product.getpImg());
		cart.setQuantity(1);
		
		HttpSession session = req.getSession();
		ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("carts");
		if(cart_list == null) {
			carts.add(cart);
			
			session.setAttribute("carts", carts);
			
		}else {
			carts = cart_list;
			boolean exits = false;
			for(Cart c : cart_list) {
				if(c.getpId() == id) {
					exits = true;
					
				}
			}
			if(!exits) {
				carts.add(cart);
			}else {
				cart.setQuantity(cart.getQuantity()+1);
			}
		}
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
