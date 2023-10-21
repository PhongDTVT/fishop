package dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import model.User;
import model.UserInform;

public class UserDAO {
//	getAll
	public List<User> getAll(){
		List<User> users = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from user";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getInt("user_id"));
				user.setFullName(rs.getString("fullname"));
				user.setUserName(rs.getString("userName"));
				user.setPassWord(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setPhoneNumber(rs.getString("phonenumber"));
				user.setAddress(rs.getString("address"));
		
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
		
	}
	public List<UserInform> getAllUserInform(){
		List<UserInform> uis = new ArrayList<>();
		Connection con = DBConnect.getConnection();
		String sql = "select * from f_userinform";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				UserInform ui = new UserInform();
				ui.setUserId(rs.getInt("user_id"));
				ui.setTinh(rs.getString("tinh"));
				ui.setHuyen(rs.getString("huyen"));
				ui.setXa(rs.getString("xa"));
				ui.setSonha(rs.getString("sonha"));
				
		
				uis.add(ui);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return uis;
		
	}
//	getById
	public User getById(int id) {
		User user = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select* from user where user_id =?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("user_id"));
				user.setFullName(rs.getString("fullname"));
				user.setUserName(rs.getString("userName"));
				user.setPassWord(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setPhoneNumber(rs.getString("phonenumber"));
				user.setAddress(rs.getString("address"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
		
	}
	public UserInform getByIdInform(int id) {
		UserInform ui = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select* from f_userinform where user_id =?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				ui = new UserInform();
				ui.setUserId(rs.getInt("user_id"));
				ui.setTinh(rs.getString("tinh"));
				ui.setHuyen(rs.getString("huyen"));
				ui.setXa(rs.getString("xa"));
				ui.setSonha(rs.getString("sonha"));
				
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ui;
		
	}
	public User getByUserName(String username) {
		User user = null;
		Connection conn = DBConnect.getConnection();
		String sql = "select* from user where username=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("user_id"));
				user.setFullName(rs.getString("fullname"));
				user.setUserName(rs.getString("userName"));
				user.setPassWord(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setPhoneNumber(rs.getString("phonenumber"));
				user.setAddress(rs.getString("address"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
		
	}
//	insert
	public boolean insert(User user) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "insert into user (fullname,username,password,email,phonenumber,address) values(?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
		
			ps.setString(1, user.getFullName());
			ps.setString(2, user.getUserName());
			ps.setString(3, user.getPassWord());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getPhoneNumber());
			ps.setString(6, user.getAddress());
		
			
			
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
	public boolean insertUserInform(UserInform ui) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "insert into f_userinform (user_id,tinh,huyen,xa,sonha) values(?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
		
			ps.setInt(1, ui.getUserId());
			ps.setString(2, ui.getTinh());
			ps.setString(3, ui.getHuyen());
			ps.setString(4, ui.getXa());
			ps.setString(5, ui.getSonha());

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
//	update
	public boolean update(User user) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "update user set username = ? where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user.getId());
			ps.setString(2, user.getFullName());
			ps.setString(3, user.getUserName());
			ps.setString(4, user.getPassWord());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getPhoneNumber());
			ps.setString(7, user.getAddress());

			
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
	public boolean updateUserInform(UserInform ui) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "update f_userinform set tinh = ?,huyen=?,xa=?,sonha=? where user_id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ui.getTinh());
			ps.setString(2, ui.getHuyen());
			ps.setString(3, ui.getXa());
			ps.setString(4, ui.getSonha());
			ps.setInt(5, ui.getUserId());
		

			
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
//	delete
	public boolean login(String username,String password) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "select * from f_admin where admin_name=? and admin_password=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				check = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return check;
		
	}
	public boolean loginUser(String username,String password) {
		boolean check = false;
		Connection conn = DBConnect.getConnection();
		String sql = "select * from user where username=? and password=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
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
		String sql = "delete from user where user_id = ?";
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
