package model;

import java.sql.Date;

public class Product {
	private int pId;
	private String pName;
	private String pMa;
	private int categoryID;
	private int loaisanphamId;
	private int discount;
	private int quantity;
	private int colorId;
	private String price;
	private String pDesc;
	private String pImg;
	private Category category;
	private int tonkho;

	public int getTonkho() {
		return tonkho;
	}
	public void setTonkho(int tonkho) {
		this.tonkho = tonkho;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpMa() {
		return pMa;
	}
	public void setpMa(String pMa) {
		this.pMa = pMa;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public int getLoaisanphamId() {
		return loaisanphamId;
	}
	public void setLoaisanphamId(int loaisanphamId) {
		this.loaisanphamId = loaisanphamId;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getColorId() {
		return colorId;
	}
	public void setColorId(int colorId) {
		this.colorId = colorId;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public Product(int pId, String pName, String pMa, int categoryID, int loaisanphamId, int discount, int quantity,
			int colorId, String price, String pDesc, String pImg) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pMa = pMa;
		this.categoryID = categoryID;
		this.loaisanphamId = loaisanphamId;
		this.discount = discount;
		this.quantity = quantity;
		this.colorId = colorId;
		this.price = price;
		this.pDesc = pDesc;
		this.pImg = pImg;
	}
	public Product() {
		super();
	}
	
	
}
