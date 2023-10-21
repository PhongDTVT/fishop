package model;


import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Order {
	private int orderId;
	private Date orderDate;
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	private String note;
	private String customerName;
	private String customerPhone;
	private String customerTinh;
	private String customerHuyen;
	private String customerXa;
	private String customerDiaChi;
	private int userId;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	public String getCustomerTinh() {
		return customerTinh;
	}
	public void setCustomerTinh(String customerTinh) {
		this.customerTinh = customerTinh;
	}
	public String getCustomerHuyen() {
		return customerHuyen;
	}
	public void setCustomerHuyen(String customerHuyen) {
		this.customerHuyen = customerHuyen;
	}
	public String getCustomerXa() {
		return customerXa;
	}
	public void setCustomerXa(String customerXa) {
		this.customerXa = customerXa;
	}
	public String getCustomerDiaChi() {
		return customerDiaChi;
	}
	public void setCustomerDiaChi(String customerDiaChi) {
		this.customerDiaChi = customerDiaChi;
	}
	public Order(int orderId,Date orderDate, String note, String customerName, String customerPhone,
			String customerTinh, String customerHuyen, String customerXa, String customerDiaChi ,int userId) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.note = note;
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.customerTinh = customerTinh;
		this.customerHuyen = customerHuyen;
		this.customerXa = customerXa;
		this.customerDiaChi = customerDiaChi;
		this.userId = userId;
	}
	public Order() {
		super();
	}
	
	
}
