package model;

public class FilterProduct {
	private int loaisanphamId;
	private int categoryId;
	private String loaisanphamName;
	public int getLoaisanphamId() {
		return loaisanphamId;
	}
	public void setLoaisanphamId(int loaisanphamId) {
		this.loaisanphamId = loaisanphamId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getLoaisanphamName() {
		return loaisanphamName;
	}
	public void setLoaisanphamName(String loaisanphamName) {
		this.loaisanphamName = loaisanphamName;
	}
	public FilterProduct(int loaisanphamId, int categoryId, String loaisanphamName) {
		super();
		this.loaisanphamId = loaisanphamId;
		this.categoryId = categoryId;
		this.loaisanphamName = loaisanphamName;
	}
	public FilterProduct() {
		super();
	}
	
}
