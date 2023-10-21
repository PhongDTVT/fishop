package clientController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.User;
import model.UserInform;
@WebServlet(urlPatterns = {"/userInform"})
public class UserInformController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserInform ui = new UserInform();
		int uId = Integer.parseInt(req.getParameter("uId"));
		
		UserInform uis = new UserInform();
		uis.setHuyen(req.getParameter("huyen"));
		uis.setTinh(req.getParameter("tinh"));
		uis.setXa(req.getParameter("xa"));
		uis.setSonha(req.getParameter("sonha"));
		uis.setUserId(uId);
		
		UserDAO uDAO = new UserDAO();
		if(uDAO.getByIdInform(uId) == null) {
		uDAO.insertUserInform(uis);
		}else {
			uDAO.updateUserInform(uis);
		}
		ui = uDAO.getByIdInform(uId);
		req.setAttribute("ui", ui);
	
		resp.sendRedirect("/FiShop/profile-client");
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserInform ui = new UserInform();
		int uId = Integer.parseInt(req.getParameter("uId"));
		
		UserInform uis = new UserInform();
		uis.setHuyen(req.getParameter("huyen"));
		uis.setTinh(req.getParameter("tinh"));
		uis.setXa(req.getParameter("xa"));
		uis.setSonha(req.getParameter("sonha"));
		uis.setUserId(uId);
		
		UserDAO uDAO = new UserDAO();
		if(uDAO.getByIdInform(uId) == null) {
		uDAO.insertUserInform(uis);
		}else {
			uDAO.updateUserInform(uis);
		}
		ui = uDAO.getByIdInform(uId);
		req.setAttribute("ui", ui);
	
		resp.sendRedirect("/FiShop/profile-client");
		
	}
}
