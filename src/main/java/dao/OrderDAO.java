package dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.Order;
import model.User;

public class OrderDAO {
	public List<Order> getAll(){
		List<Order> orders = new ArrayList<Order>();
		Connection conn = DBConnect.getConnection();
		String sql = "select * from f_order";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setOrderId(rs.getInt("order_id"));
				order.setOrderDate(rs.getDate("order_date"));
				order.setNote(rs.getString("note"));
				
				order.setCustomerDiaChi(rs.getString("customer_diachi"));
				order.setCustomerHuyen(rs.getString("customer_huyen"));
				
				order.setCustomerName(rs.getString("customer_name"));
				order.setCustomerPhone(rs.getString("customer_phone"));
				order.setCustomerTinh(rs.getString("customer_tinh"));
				order.setCustomerXa(rs.getString("customer_xa"));
				order.setUserId(rs.getInt("user_id"));
				
				orders.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}
	
	public boolean insert(Order order) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "insert into f_order (order_date,customer_name,customer_phone,customer_tinh,customer_huyen,customer_xa,customer_diachi,note,user_id) values (?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDate(1, order.getOrderDate());
			ps.setString(2, order.getCustomerName());
			ps.setString(3, order.getCustomerPhone());
			ps.setString(4, order.getCustomerTinh());
			ps.setString(5, order.getCustomerHuyen());
			ps.setString(6, order.getCustomerXa());
			ps.setString(7, order.getCustomerDiaChi());
			ps.setString(8, order.getNote());
			ps.setInt(9, order.getUserId());
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
	public Order getCustomer(Order o) {
		Order od = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select * from f_order where order_date =? and customer_name=? and customer_phone=? and customer_tinh=? and customer_huyen=? and customer_xa=? and customer_diachi=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDate(1, o.getOrderDate());
			ps.setString(2, o.getCustomerName());
			ps.setString(3, o.getCustomerPhone());
			ps.setString(4, o.getCustomerTinh());
			ps.setString(5, o.getCustomerHuyen());
			ps.setString(6, o.getCustomerXa());
			ps.setString(7, o.getCustomerDiaChi());
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				od = new Order();
				od.setOrderId(rs.getInt("order_id"));
				od.setOrderDate(rs.getDate("order_date"));
				od.setCustomerName(rs.getString("customer_name"));
				od.setCustomerPhone(rs.getString("customer_phone"));
				od.setCustomerTinh(rs.getString("customer_tinh"));
				od.setCustomerHuyen(rs.getString("customer_huyen"));
				od.setCustomerXa(rs.getString("customer_xa"));
				od.setCustomerDiaChi(rs.getString("customer_diachi"));
				od.setNote(rs.getString("note"));
				od.setUserId(rs.getInt("user_id"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return od;
		
	}
	public  void delete(int id) {
		Connection conn = DBConnect.getConnection();
		String sql = "delete from f_order where order_id = ?";
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
