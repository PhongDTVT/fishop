package controller;




import java.io.IOException;





import dao.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Product;
@WebServlet(urlPatterns = {"/add-product"})
public class AddProductController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
			int pId = Integer.parseInt(req.getParameter("pId"));
			String pName = req.getParameter("pName");
			String pMa = req.getParameter("pMa");
			int categoryId  = (req.getParameter("category_id") != null) ? Integer.parseInt(req.getParameter("category_id")):0;
			int loaisanphamId = (req.getParameter("loaisanpham_id") != null)?Integer.parseInt(req.getParameter("loaisanpham_id")):0;
			int discount = (req.getParameter("discount") != null)?Integer.parseInt(req.getParameter("discount")):0;
			int quantity = (req.getParameter("quantity") != null)?Integer.parseInt(req.getParameter("quantity")):0;
			int colorId = (req.getParameter("color_id") != null)?Integer.parseInt(req.getParameter("color_id")):0;
			
			String price = req.getParameter("sanpham_gia");
			String pDesc = req.getParameter("sanpham_chitiet");
			String pImg = req.getParameter("sanpham_anh");
			

			Product product = new Product(pId, pName, pMa, categoryId, loaisanphamId, discount, quantity, colorId, price, pDesc, pImg);
			ProductDAO productDAO = new ProductDAO();
			productDAO.insert(product);
			
		
		resp.sendRedirect("/FiShop/list-product");
	}
}
