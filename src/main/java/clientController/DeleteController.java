package clientController;

import java.io.IOException;
import java.util.ArrayList;

import com.mysql.cj.Session;

import dao.CartUserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.CartUser;
@WebServlet(urlPatterns = {"/deleteCart"})
public class DeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		CartUserDAO cUDAO = new CartUserDAO();
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("username");
		if(username == null) {
		ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("carts");
		for (int i = 0; i < cart_list.size(); i++) {
			if(cart_list.get(i).getpId() == id) {
				cart_list.remove(i);
			}
		}
		
		}
		else {
			ArrayList<CartUser> cUser_list = (ArrayList<CartUser>)session.getAttribute("cUsers");
			for (int i = 0; i < cUser_list.size(); i++) {
				if(cUser_list.get(i).getpId() == id) {
					cUser_list.remove(i);
					
					cUDAO.delete(id);
				}
			}
		}
		req.getRequestDispatcher("/views/client/viewCart.jsp").forward(req, resp);
	}
}
