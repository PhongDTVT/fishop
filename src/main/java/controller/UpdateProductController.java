package controller;

import java.io.IOException;


import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
@WebServlet(urlPatterns = {"/updateProduct"})
public class UpdateProductController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pId = Integer.parseInt(req.getParameter("pId"));
		ProductDAO proDAO = new ProductDAO();
		Product product = proDAO.getById(pId);
		req.setAttribute("product", product);
		req.getRequestDispatcher("/views/admin/updateProduct.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int pId = Integer.parseInt(req.getParameter("pId"));
		String pName = req.getParameter("pName");
		String pMa = req.getParameter("pMa");
		int categoryId  =  Integer.parseInt(req.getParameter("category_id"));
		int loaisanphamId = Integer.parseInt(req.getParameter("loaisanpham_id"));
		int discount = Integer.parseInt(req.getParameter("discount"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		int colorId = Integer.parseInt(req.getParameter("color_id"));
		String price = req.getParameter("sanpham_gia");
		String pDesc = req.getParameter("sanpham_chitiet");
		String pImg = req.getParameter("sanpham_anh");
		Product product = new Product(pId, pName, pMa, categoryId, loaisanphamId, discount, quantity, colorId, price, pDesc, pImg);
		
		ProductDAO proDAO = new ProductDAO();
		proDAO.update(product);
		resp.sendRedirect("/FiShop/list-product");
	}
}
