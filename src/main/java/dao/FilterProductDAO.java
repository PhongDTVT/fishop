package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.FilterProduct;
import model.Product;
import model.SizeSp;

public class FilterProductDAO {
	public List<FilterProduct> getAllCategoryId(int id){
		List<FilterProduct> fproducts = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from f_loaisanpham where category_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FilterProduct fproduct = new FilterProduct();
				fproduct.setLoaisanphamId(rs.getInt("loaisanpham_id"));
				fproduct.setCategoryId(rs.getInt("category_id"));
				fproduct.setLoaisanphamName(rs.getString("loaisanpham_name"));
				fproducts.add(fproduct);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fproducts;
		
	}
	
	public List<SizeSp> getAllSize(){
		List<SizeSp> sizes = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from f_sizesp";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				SizeSp size = new SizeSp();
				size.setcategoryId(rs.getInt("category_id"));
				size.setSizespId(rs.getInt("sizesp_id"));
				size.setSize(rs.getString("sizesp"));
				sizes.add(size);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sizes;
		
	}
	
}
