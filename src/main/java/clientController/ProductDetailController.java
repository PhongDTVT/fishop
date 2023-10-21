package clientController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.ProductDAO;
import dao.ProductImgDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.ProductImg;
@WebServlet(urlPatterns = {"/productDetail"})
public class ProductDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		ProductDAO productDAO = new ProductDAO();
		ProductImgDAO proImgDAO = new ProductImgDAO();
		List<ProductImg> proImgs = new ArrayList<>();
		proImgs = proImgDAO.getAllSpId(id);
		Product pro = new Product();
		pro = productDAO.getById(id);
		req.setAttribute("pro", pro);
		req.setAttribute("proImgs", proImgs);
		req.getRequestDispatcher("/views/client/productDetail.jsp").forward(req, resp);
	}
}
