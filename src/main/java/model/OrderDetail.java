package model;

public class OrderDetail {
	private int order_id;
	private int sanpham_id;
	private String pName;
	private String pImg;
	private String price;
	private int quantity;
	private String size;
	private int userId;
	private int oId;
	public int getoId() {
		return oId;
	}
	public void setoId(int oId) {
		this.oId = oId;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getSanpham_id() {
		return sanpham_id;
	}
	public void setSanpham_id(int sanpham_id) {
		this.sanpham_id = sanpham_id;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public String getprice() {
		return price;
	}
	public void setprice(String price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public OrderDetail(int order_id, int sanpham_id, String pName, String pImg, String price, int quantity, String size,
			int userId, int oId) {
		super();
		this.order_id = order_id;
		this.sanpham_id = sanpham_id;
		this.pName = pName;
		this.pImg = pImg;
		this.price = price;
		this.quantity = quantity;
		this.size = size;
		this.userId = userId;
		this.oId = oId;
	}
	public OrderDetail() {
		super();
	}
	
	
}
