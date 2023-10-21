package dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;

public class CategoryDAO {
	public List<Category> getAll(){
		List<Category> categories = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from category";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Category category = new Category();
				category.setId(rs.getInt("id"));
				category.setName(rs.getString("name"));
				categories.add(category);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categories;
		
	}
	//Phuong thuc them loai san pham
	public boolean insert(Category category) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "insert into category values(?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, category.getId());
			ps.setString(2, category.getName());
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
	//phuong thuc lay loai san pham theo id
	public Category getById(int id) {
		Category category = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select* from category where id =?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				category = new Category();
				category.setId(rs.getInt("id"));
				category.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return category;
		
	}
	//phương thưc cap nhat loai san pham
	public boolean update(Category category) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "update category set name = ? where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category.getName());
			ps.setInt(2, category.getId());
			
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
	// phuong thuc xoa san pham 
	public  void delete(int id) {
		Connection conn = DBConnect.getConnection();
		String sql = "delete from category where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
