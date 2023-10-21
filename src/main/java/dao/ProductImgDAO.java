package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Product;
import model.ProductImg;

public class ProductImgDAO {
	public List<ProductImg> getAllSpId(int id){
		List<ProductImg> proImgs = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from f_sp_anh where sanpham_id=?";
		PreparedStatement ps; 
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ProductImg proImg = new ProductImg();
				proImg.setSanphamId(rs.getInt("sanpham_id"));
				proImg.setSpanhId(rs.getInt("spanh_id"));
				proImg.setSanphamImg(rs.getString("sanpham_anh"));
				proImgs.add(proImg);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return proImgs;
		
	}
}
