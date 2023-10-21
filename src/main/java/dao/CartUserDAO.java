package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.CartUser;
import model.Product;
import model.User;

public class CartUserDAO {
	public List<CartUser> getAllByUserId(int id) {
		List<CartUser> cUl = new ArrayList<>();
		CartUser cUser = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select * from f_cartuser where user_id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				cUser = new CartUser();

				cUser.setUserId(rs.getInt("user_id"));
				cUser.setpId(rs.getInt("sanpham_id"));
				cUser.setpImg(rs.getString("sanpham_anh"));
				cUser.setpName(rs.getString("sanpham_tieude"));
				cUser.setPrice(rs.getString("sanpham_price"));
				cUser.setQuantityInCart(rs.getInt("quantity_incart"));
				cUser.setDiscount(rs.getInt("discount"));
				cUser.setCategoryID(rs.getInt("category_id"));
				
				cUl.add(cUser);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cUl;
		
	}
	
	
	public List<CartUser> getAllBySpId(int id) {
		List<CartUser> cUl = new ArrayList<>();
		
		Connection conn = DBConnect.getConnection();
		String sql = "select* from f_cartuser where sanpham_id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				CartUser cUser = new CartUser();
				
				cUser.setUserId(rs.getInt("user_id"));
				cUser.setpId(rs.getInt("sanpham_id"));
				cUser.setpImg(rs.getString("sanpham_anh"));
				cUser.setpName(rs.getString("sanpham_tieude"));
				cUser.setPrice(rs.getString("sanpham_price"));
				cUser.setQuantityInCart(rs.getInt("quantity_incart"));
				cUser.setDiscount(rs.getInt("discount"));
				cUser.setCategoryID(rs.getInt("category_id"));
				cUl.add(cUser);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cUl;
		
	}
	public CartUser getById(int id) {
		CartUser cUser = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select* from f_cartuser where sanpham_id =?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				cUser = new CartUser();
				cUser.setUserId(rs.getInt("user_id"));
				cUser.setpId(rs.getInt("sanpham_id"));
				cUser.setpImg(rs.getString("sanpham_anh"));
				cUser.setpName(rs.getString("sanpham_tieude"));
				cUser.setPrice(rs.getString("sanpham_price"));
				cUser.setQuantityInCart(rs.getInt("quantity_incart"));
				cUser.setDiscount(rs.getInt("discount"));
				cUser.setCategoryID(rs.getInt("category_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cUser;
		
	}
	
	public boolean insert(CartUser cUser) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "insert into f_cartuser (user_id,sanpham_id,sanpham_anh,sanpham_price,sanpham_tieude,quantity_incart,discount,category_id) values(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cUser.getUserId());
			ps.setInt(2, cUser.getpId());
			ps.setString(3, cUser.getpImg());
			ps.setString(4, cUser.getPrice());
			ps.setString(5, cUser.getpName());
			ps.setInt(6, cUser.getQuantityInCart());
			ps.setInt(7, cUser.getDiscount());
			ps.setInt(8, cUser.getCategoryID());
	
			
			int rs = ps.executeUpdate();
			if(rs>0) {
				check = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;
		
	}
	
	public  void deleteAll(int id,int uId) {
		Connection conn = DBConnect.getConnection();
		String sql = "delete  from f_cartuser where sanpham_id=? and user_id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setInt(2, uId);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public  void delete(int id) {
		Connection conn = DBConnect.getConnection();
		String sql = "delete from f_cartuser where sanpham_id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public boolean update(int id) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "update f_cartuser set quantity_incart=quantity_incart+1  where sanpham_id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
		
			
			ps.setInt(1, id);
			int rs = ps.executeUpdate();
			if(rs>0) {
				check = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;
	}
}
