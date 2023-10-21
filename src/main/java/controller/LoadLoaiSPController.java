package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
@WebServlet(urlPatterns = {"/loadSp"})
public class LoadLoaiSPController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
	
		int loaiSp = Integer.parseInt(req.getParameter("loaiSpId"));
		List<Product> products = new ArrayList<>();
		ProductDAO proDAO = new ProductDAO();
		
		products = proDAO.getAllLoaiSpId(loaiSp);
		
		PrintWriter out = resp.getWriter();
		for(Product cate:products) {
			int discount = (cate.getDiscount())*Integer.parseInt(cate.getPrice())/100;
			out.print("<div class=\"product col-lg-4 col-md-6 col-sm-6 d-flex\">\r\n"
					+ "            <div class=\"card w-100 my-2 shadow-2-strong\">\r\n"
					+ "              <img src=\"https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/10.webp\" class=\"card-img-top imgRoom\" />\r\n"
					+ "              <div class=\"card-body d-flex flex-column\">\r\n"
					+ "                <div class=\"d-flex flex-row\">\r\n"
					+ "                  <h5 class=\"mb-1 me-1\">"+cate.getPrice()+"</h5>\r\n"
					+ "                  <span class=\"text-danger\"><s style=\"text-decoration: line-through; font-size: 2rem;\">"+discount+"</s></span>\r\n"
					+ "                </div>\r\n"
					+ "                <p class=\"card-text\">"+cate.getpName()+"</p>\r\n"
					+ "                <p class=\"card-text\">"+cate.getpMa()+"</p>\r\n"
					+ "                <div class=\"card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto\">\r\n"
					+ "                  <a href=\"#!\" class=\"btn btn-primary shadow-0 me-1\">Add to cart</a>\r\n"
					+ "                  <a href=\"#!\" class=\"btn btn-light border icon-hover px-2 pt-2\"><i class=\"fas fa-heart fa-lg text-secondary px-1\"></i></a>\r\n"
					+ "                </div>\r\n"
					+ "              </div>\r\n"
					+ "            </div>\r\n"
					+ "          </div>");
        
  
       
	}
	}
}
