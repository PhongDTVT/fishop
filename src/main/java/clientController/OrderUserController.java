package clientController;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import dao.CartUserDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;
import model.CartUser;
import model.Order;
import model.OrderDetail;
@WebServlet(urlPatterns = {"/order-user"})
public class OrderUserController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		CartUserDAO cUDAO = new CartUserDAO();
		ArrayList<CartUser> cUsers = (ArrayList<CartUser>)req.getSession().getAttribute("cUsers");
		int[] a = new int[100];
		String[] s = new String[100];
		
		
		for(int k = 0;k<cUsers.size();k++) {
			a[k] = Integer.parseInt(req.getParameter("quantity("+k+")"));
			s[k] = req.getParameter("size("+k+")");
				}
		
		String fullname = req.getParameter("fullname");
		String phone = req.getParameter("phone");
		@SuppressWarnings("unused")
		String email = req.getParameter("email");
		String tinh = req.getParameter("tinh");
		String huyen = req.getParameter("huyen");
		String xa = req.getParameter("xa");
		String sonha = req.getParameter("sonha");
		
		String note = req.getParameter("note");
		
		int userId = Integer.parseInt(req.getParameter("user_Id"));
		Order order = new Order();
		order.setOrderDate(new Date(System.currentTimeMillis()));
		order.setCustomerHuyen(huyen);
		order.setCustomerXa(xa);
		order.setCustomerDiaChi(sonha);
		order.setCustomerName(fullname);
		order.setCustomerPhone(phone);
		order.setCustomerTinh(tinh);
		order.setNote(note);
		order.setUserId(userId);
		OrderDAO oDAO = new OrderDAO();
		oDAO.insert(order);
		
		int i = 0;
		Order o = oDAO.getCustomer(order);
		int id = o.getOrderId();
		for(CartUser c : cUsers) {
			
			OrderDetail oDetail = new OrderDetail();
			
			oDetail.setpName(c.getpName());
			oDetail.setQuantity(c.getQuantityInCart());
			oDetail.setSize(s[i]);
			oDetail.setprice(c.getPrice());
			oDetail.setpImg(c.getpImg());
			oDetail.setSanpham_id(c.getpId());
			oDetail.setUserId(userId);
			oDetail.setoId(id);
			oDetail.setSize(s[i]);
			oDetail.setQuantity(a[i]);
			
			
			OrderDetailDAO oDetailDAO = new OrderDetailDAO();
			oDetailDAO.insert(oDetail);
			i++;
			cUDAO.deleteAll(c.getpId(), userId);
		} 
		cUsers.clear();
		
		resp.sendRedirect("/FiShop/index");
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		CartUserDAO cUDAO = new CartUserDAO();
		ArrayList<CartUser> cUsers = (ArrayList<CartUser>)req.getSession().getAttribute("cUsers");
		int[] a = new int[100];
		String[] s = new String[100];
		
		
		for(int k = 0;k<cUsers.size();k++) {
			a[k] = Integer.parseInt(req.getParameter("quantity("+k+")"));
			s[k] = req.getParameter("size("+k+")");
				}
		
		String fullname = req.getParameter("fullname");
		String phone = req.getParameter("phone");
		@SuppressWarnings("unused")
		String email = req.getParameter("email");
		String tinh = req.getParameter("tinh");
		String huyen = req.getParameter("huyen");
		String xa = req.getParameter("xa");
		String sonha = req.getParameter("sonha");
		
		String note = req.getParameter("note");
		
		int userId = Integer.parseInt(req.getParameter("user_Id"));
		Order order = new Order();
		order.setOrderDate(new Date(System.currentTimeMillis()));
		order.setCustomerHuyen(huyen);
		order.setCustomerXa(xa);
		order.setCustomerDiaChi(sonha);
		order.setCustomerName(fullname);
		order.setCustomerPhone(phone);
		order.setCustomerTinh(tinh);
		order.setNote(note);
		order.setUserId(userId);
		OrderDAO oDAO = new OrderDAO();
		oDAO.insert(order);
	
		int i = 0;
		Order o = oDAO.getCustomer(order);
		int id = o.getOrderId();
		for(CartUser c : cUsers) {
			
			OrderDetail oDetail = new OrderDetail();
			
			oDetail.setpName(c.getpName());
			oDetail.setQuantity(c.getQuantityInCart());
			oDetail.setSize(s[i]);
			oDetail.setprice(c.getPrice());
			oDetail.setpImg(c.getpImg());
			oDetail.setSanpham_id(c.getpId());
			oDetail.setUserId(userId);
			oDetail.setoId(id);
			oDetail.setSize(s[i]);
			oDetail.setQuantity(a[i]);
			OrderDetailDAO oDetailDAO = new OrderDetailDAO();
			oDetailDAO.insert(oDetail);
			i++;
			cUDAO.deleteAll(c.getpId(), userId);
		} 
		cUsers.clear();
		
		resp.sendRedirect("/FiShop/index");
	}
}
