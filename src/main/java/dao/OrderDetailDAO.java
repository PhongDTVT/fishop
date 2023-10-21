package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Order;
import model.OrderDetail;
import model.QuantitySell;

public class OrderDetailDAO {
	public List<OrderDetail> getAll(){
		List<OrderDetail> orderdetails = new ArrayList<OrderDetail>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from f_order_detail";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				OrderDetail orderdetail = new OrderDetail();
				orderdetail.setOrder_id(rs.getInt("order_id"));
				orderdetail.setpName(rs.getString("sanpham_tieude"));
				orderdetail.setQuantity(rs.getInt("quantity_sell"));
				orderdetail.setprice(rs.getString("sanpham_gia"));
				orderdetail.setpImg(rs.getString("sanpham_anh"));
				orderdetail.setSanpham_id(rs.getInt("sanpham_id"));
				orderdetail.setSize(rs.getString("size"));
				orderdetail.setUserId(rs.getInt("user_id"));
				orderdetail.setoId(rs.getInt("oId"));
				orderdetails.add(orderdetail);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderdetails;
	}
	public List<OrderDetail> getAllByUserId(int uId){
		List<OrderDetail> orderdetails = new ArrayList<OrderDetail>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from f_order_detail where user_id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				OrderDetail orderdetail = new OrderDetail();
				orderdetail.setOrder_id(rs.getInt("order_id"));
				orderdetail.setpName(rs.getString("sanpham_tieude"));
				orderdetail.setQuantity(rs.getInt("quantity_sell"));
				orderdetail.setprice(rs.getString("sanpham_gia"));
				orderdetail.setpImg(rs.getString("sanpham_anh"));
				orderdetail.setSanpham_id(rs.getInt("sanpham_id"));
				orderdetail.setSize(rs.getString("size"));
				orderdetail.setUserId(rs.getInt("user_id"));
				orderdetail.setoId(rs.getInt("oId"));
				orderdetails.add(orderdetail);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderdetails;
	}
	public boolean insert(OrderDetail orderdetail) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "insert into f_order_detail (sanpham_id,sanpham_tieude,sanpham_anh,sanpham_gia,quantity_sell,size,user_id,oId) values (?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, orderdetail.getSanpham_id());
			ps.setString(2, orderdetail.getpName());
			ps.setString(3, orderdetail.getpImg());
			ps.setString(4, orderdetail.getprice());
			
			ps.setInt(5, orderdetail.getQuantity());
			ps.setString(6, orderdetail.getSize());
			ps.setInt(7, orderdetail.getUserId());
			ps.setInt(8, orderdetail.getoId());
			int row = ps.executeUpdate();
			if(row > 0) {
				check = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;
	}
	public  void delete(int id) {
		Connection conn = DBConnect.getConnection();
		String sql = "delete from f_order_detail where oId = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public List<OrderDetail> getAllO(){
		List<OrderDetail> spout = new ArrayList<OrderDetail>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from f_spout";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				OrderDetail orderdetail = new OrderDetail();
				orderdetail.setOrder_id(rs.getInt("id"));
				orderdetail.setpName(rs.getString("sanpham_tieude"));
				orderdetail.setQuantity(rs.getInt("quantity_sell"));
				orderdetail.setprice(rs.getString("sanpham_gia"));
				orderdetail.setpImg(rs.getString("sanpham_anh"));
				orderdetail.setSanpham_id(rs.getInt("sanpham_id"));
				orderdetail.setSize(rs.getString("size"));
				orderdetail.setoId(rs.getInt("oId"));
				spout.add(orderdetail);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return spout;
	}
}
