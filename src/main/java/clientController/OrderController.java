package clientController;

import java.io.BufferedReader;
import java.io.IOException; 

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;





import com.fasterxml.jackson.databind.ObjectMapper;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;
import model.Order;
import model.OrderDetail;

@WebServlet(urlPatterns = {"/order-client"})
public class OrderController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		ArrayList<Cart> cart_list = (ArrayList<Cart>)req.getSession().getAttribute("carts");
		int[] a = new int[100];
		String[] s = new String[100];
		
		
		for(int k = 0;k<cart_list.size();k++) {
			a[k] = Integer.parseInt(req.getParameter("quantity("+k+")"));
			s[k] = req.getParameter("size("+k+")");
				}
		
		String firstname = req.getParameter("firstname");
		String phone = req.getParameter("phone");
		@SuppressWarnings("unused")
		String email = req.getParameter("email");
		String tinh = req.getParameter("tinh");
		String huyen = req.getParameter("huyen");
		String xa = req.getParameter("xa");
		String sonha = req.getParameter("sonha");
		String lastname = req.getParameter("lastname");
		String note = req.getParameter("note");
		int userId = 0;
		if(req.getParameter("user_id") != null) {
		userId = Integer.parseInt(req.getParameter("user_Id"));
		}
		
		Order order = new Order();
		order.setOrderDate(new Date(System.currentTimeMillis()));
		order.setCustomerHuyen(huyen);
		order.setCustomerXa(xa);
		order.setCustomerDiaChi(sonha);
		order.setCustomerName(firstname + lastname);
		order.setCustomerPhone(phone);
		order.setCustomerTinh(tinh);
		order.setNote(note);
		order.setUserId(userId);
		
		OrderDAO oDAO = new OrderDAO();
		oDAO.insert(order);
		int id = oDAO.getCustomer(order).getOrderId();
		int i = 0;
	
		for(Cart c : cart_list) {
			
			OrderDetail oDetail = new OrderDetail();
			
			oDetail.setpName(c.getpName());
			oDetail.setQuantity(c.getQuantity());
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
		} 
		cart_list.clear();
		
		resp.sendRedirect("/FiShop/index");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		ArrayList<Cart> cart_list = (ArrayList<Cart>)req.getSession().getAttribute("carts");
		int[] a = new int[100];
		String[] s = new String[100];
		
		
		for(int k = 0;k<cart_list.size();k++) {
			a[k] = Integer.parseInt(req.getParameter("quantity("+k+")"));
			
	
			s[k] = req.getParameter("size-Sneaker("+k+")");
			
			
		
		}
		
		
        
		
		
		String firstname = req.getParameter("firstname");
		String phone = req.getParameter("phone");
		@SuppressWarnings("unused")
		String email = req.getParameter("email");
		String tinh = req.getParameter("tinh");
		String huyen = req.getParameter("huyen");
		String xa = req.getParameter("xa");
		String sonha = req.getParameter("sonha");
		String lastname = req.getParameter("lastname");
		String note = req.getParameter("note");
		int userId = 0;
		if(req.getParameter("user_id") != null) {
		userId = Integer.parseInt(req.getParameter("user_Id"));
		}
		
		Order order = new Order();
		order.setOrderDate(new Date(System.currentTimeMillis()));
		order.setCustomerHuyen(huyen);
		order.setCustomerXa(xa);
		order.setCustomerDiaChi(sonha);
		order.setCustomerName(firstname + lastname);
		order.setCustomerPhone(phone);
		order.setCustomerTinh(tinh);
		order.setNote(note);
		order.setUserId(userId);
		
		OrderDAO oDAO = new OrderDAO();
		oDAO.insert(order);
		int id = oDAO.getCustomer(order).getOrderId();
		int i = 0;
		
		for(Cart c : cart_list) {
			
			OrderDetail oDetail = new OrderDetail();
			
			oDetail.setpName(c.getpName());
			oDetail.setQuantity(c.getQuantity());
			
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
		} 
		cart_list.clear();
		
		resp.sendRedirect("/FiShop/index");
	}
	
}
