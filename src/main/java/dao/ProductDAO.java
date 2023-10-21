package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Product;
import model.QuantitySell;

public class ProductDAO {
	public List<Product> getAll(){
		List<Product> products = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from f_sanpham";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setpId(rs.getInt("sanpham_id"));
				product.setpName(rs.getString("sanpham_tieude"));
				product.setpMa(rs.getString("sanpham_ma"));
				product.setCategoryID(rs.getInt("category_id"));
				product.setLoaisanphamId(rs.getInt("loaisanpham_id"));
				product.setDiscount(rs.getInt("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setColorId(rs.getInt("color_id"));
				product.setPrice(rs.getString("sanpham_gia"));
				product.setpDesc(rs.getString("sanpham_chitiet"));
				product.setpImg(rs.getString("sanpham_anh"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
		
	}
	
	
	public List<Product> getNextSP(int id,int amount){
		List<Product> products = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from f_sanpham where category_id=? limit ?,6";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setInt(2, amount);
		
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setpId(rs.getInt("sanpham_id"));
				product.setpName(rs.getString("sanpham_tieude"));
				product.setpMa(rs.getString("sanpham_ma"));
				product.setCategoryID(rs.getInt("category_id"));
				product.setLoaisanphamId(rs.getInt("loaisanpham_id"));
				product.setDiscount(rs.getInt("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setColorId(rs.getInt("color_id"));
				product.setPrice(rs.getString("sanpham_gia"));
				product.setpDesc(rs.getString("sanpham_chitiet"));
				product.setpImg(rs.getString("sanpham_anh"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
		
	}
	public List<Product> getNextSPSale(int amount){
		List<Product> products = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from f_sanpham where discount > 0 limit ?,6";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, amount);
		
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setpId(rs.getInt("sanpham_id"));
				product.setpName(rs.getString("sanpham_tieude"));
				product.setpMa(rs.getString("sanpham_ma"));
				product.setCategoryID(rs.getInt("category_id"));
				product.setLoaisanphamId(rs.getInt("loaisanpham_id"));
				product.setDiscount(rs.getInt("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setColorId(rs.getInt("color_id"));
				product.setPrice(rs.getString("sanpham_gia"));
				product.setpDesc(rs.getString("sanpham_chitiet"));
				product.setpImg(rs.getString("sanpham_anh"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
		
	}
	public List<Product> getAllCategoryId(int cateId){
		List<Product> products = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from f_sanpham where category_id=? ";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cateId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setpId(rs.getInt("sanpham_id"));
				product.setpName(rs.getString("sanpham_tieude"));
				product.setpMa(rs.getString("sanpham_ma"));
				product.setCategoryID(rs.getInt("category_id"));
				product.setLoaisanphamId(rs.getInt("loaisanpham_id"));
				product.setDiscount(rs.getInt("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setColorId(rs.getInt("color_id"));
				product.setPrice(rs.getString("sanpham_gia"));
				product.setpDesc(rs.getString("sanpham_chitiet"));
				product.setpImg(rs.getString("sanpham_anh"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
		
	}
	public List<Product> getAllSale(){
		List<Product> products = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from f_sanpham where discount > 0 limit 6";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setpId(rs.getInt("sanpham_id"));
				product.setpName(rs.getString("sanpham_tieude"));
				product.setpMa(rs.getString("sanpham_ma"));
				product.setCategoryID(rs.getInt("category_id"));
				product.setLoaisanphamId(rs.getInt("loaisanpham_id"));
				product.setDiscount(rs.getInt("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setColorId(rs.getInt("color_id"));
				product.setPrice(rs.getString("sanpham_gia"));
				product.setpDesc(rs.getString("sanpham_chitiet"));
				product.setpImg(rs.getString("sanpham_anh"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
		
	}
	public List<Product> getAllLoaiSpId(int loaiSpId){
		List<Product> products = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from f_sanpham where loaisanpham_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, loaiSpId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setpId(rs.getInt("sanpham_id"));
				product.setpName(rs.getString("sanpham_tieude"));
				product.setpMa(rs.getString("sanpham_ma"));
				product.setCategoryID(rs.getInt("category_id"));
				product.setLoaisanphamId(rs.getInt("loaisanpham_id"));
				product.setDiscount(rs.getInt("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setColorId(rs.getInt("color_id"));
				product.setPrice(rs.getString("sanpham_gia"));
				product.setpDesc(rs.getString("sanpham_chitiet"));
				product.setpImg(rs.getString("sanpham_anh"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
		
	}
	//Phuong thuc them loai san pham
	public boolean insert(Product product) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "insert into f_sanpham values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, product.getpId());
			ps.setString(2, product.getpName());
			ps.setString(3, product.getpMa());
			ps.setInt(4, product.getCategoryID());
			ps.setInt(5, product.getLoaisanphamId());
			ps.setInt(6, product.getDiscount());
			ps.setInt(7, product.getQuantity());
			ps.setInt(8, product.getColorId());
			ps.setString(9, product.getPrice());
			ps.setString(10, product.getpDesc());
			ps.setString(11, product.getpImg());
			
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
	public Product getById(int id) {
		Product product = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select * from f_sanpham where sanpham_id =?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				product = new Product();
				product.setpId(rs.getInt("sanpham_id"));
				product.setpName(rs.getString("sanpham_tieude"));
				product.setpMa(rs.getString("sanpham_ma"));
				product.setCategoryID(rs.getInt("category_id"));
				product.setLoaisanphamId(rs.getInt("loaisanpham_id"));
				product.setDiscount(rs.getInt("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setColorId(rs.getInt("color_id"));
				product.setPrice(rs.getString("sanpham_gia"));
				product.setpDesc(rs.getString("sanpham_chitiet"));
				product.setpImg(rs.getString("sanpham_anh"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
		
	}
	public List<Product> getAllById(int id) {
		List<Product> products = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from f_sanpham where category_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setpId(rs.getInt("sanpham_id"));
				product.setpName(rs.getString("sanpham_tieude"));
				product.setpMa(rs.getString("sanpham_ma"));
				product.setCategoryID(rs.getInt("category_id"));
				product.setLoaisanphamId(rs.getInt("loaisanpham_id"));
				product.setDiscount(rs.getInt("discount"));
				product.setQuantity(rs.getInt("quantity"));
				product.setColorId(rs.getInt("color_id"));
				product.setPrice(rs.getString("sanpham_gia"));
				product.setpDesc(rs.getString("sanpham_chitiet"));
				product.setpImg(rs.getString("sanpham_anh"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
		
	}
	
	//phương thưc cap nhat loai san pham
	public boolean update(Product product) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "update f_sanpham set sanpham_tieude=? ,sanpham_ma=?,category_id=?,loaisanpham_id=?,discount=?,quantity=?,color_id=?,sanpham_gia=?,sanpham_chitiet=?,sanpham_anh=?  where sanpham_id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, product.getpName());
			ps.setString(2, product.getpMa());
			ps.setInt(3, product.getCategoryID());
			ps.setInt(4, product.getLoaisanphamId());
			ps.setInt(5, product.getDiscount());
			ps.setInt(6, product.getQuantity());
			ps.setInt(7, product.getColorId());
			ps.setString(8, product.getPrice());
			ps.setString(9, product.getpDesc());
			ps.setString(10, product.getpImg());
			ps.setInt(11, product.getpId());
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
		String sql = "delete from f_sanpham where sanpham_id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public List<QuantitySell> quantitySell(){
		List<QuantitySell> qs = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "SELECT fshop.f_sanpham.sanpham_id,fshop.f_sanpham.quantity, fshop.f_order_detail.quantity_sell,fshop.f_sanpham.sanpham_tieude,fshop.f_sanpham.sanpham_gia,fshop.f_sanpham.discount,fshop.f_sanpham.sanpham_anh\r\n"
				+ "FROM fshop.f_sanpham\r\n"
				+ "INNER JOIN fshop.f_order_detail ON fshop.f_sanpham.sanpham_id = fshop.f_order_detail.sanpham_id;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				QuantitySell q = new QuantitySell();
				q.setpId(rs.getInt("sanpham_id"));
				q.setpName(rs.getString("sanpham_tieude"));

				q.setDiscount(rs.getInt("discount"));
				q.setQuantity(rs.getInt("quantity"));
				q.setQuantitySell(rs.getInt("quantity_sell"));
				q.setPrice(rs.getString("sanpham_gia"));
				
				q.setpImg(rs.getString("sanpham_anh"));
				
				qs.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return qs;
		
	}
	
	public List<Product> getAllIn(){
		List<Product> s = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select f_sanpham.sanpham_id,f_sanpham.sanpham_tieude,f_sanpham.sanpham_ma , f_sanpham.category_id,f_sanpham.loaisanpham_id,f_sanpham.discount,f_sanpham.quantity - IFNULL(f_order_detail.quantity_sell,0) as tonkho,f_sanpham.color_id,f_sanpham.sanpham_gia,f_sanpham.sanpham_chitiet,f_sanpham.sanpham_anh\r\n"
				+ "from f_sanpham\r\n"
				+ "left join f_order_detail on f_sanpham.sanpham_id=f_order_detail.sanpham_id;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setpId(rs.getInt("sanpham_id"));
				product.setpName(rs.getString("sanpham_tieude"));
				product.setpMa(rs.getString("sanpham_ma"));
				product.setCategoryID(rs.getInt("category_id"));
				product.setLoaisanphamId(rs.getInt("loaisanpham_id"));
				product.setDiscount(rs.getInt("discount"));
				product.setTonkho(rs.getInt("tonkho"));
				product.setColorId(rs.getInt("color_id"));
				product.setPrice(rs.getString("sanpham_gia"));
				product.setpDesc(rs.getString("sanpham_chitiet"));
				product.setpImg(rs.getString("sanpham_anh"));
				s.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
		
	}
}
