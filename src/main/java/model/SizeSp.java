package model;

public class SizeSp {
	private int sizespId;
	private int categoryId;
	private String size;
	public int getSizespId() { 
		return sizespId;
	}
	public void setSizespId(int sizespId) {
		this.sizespId = sizespId;
	}
	public int getcategoryId() {
		return categoryId;
	}
	public void setcategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public SizeSp(int sizespId, int categoryId, String size) {
		super();
		this.sizespId = sizespId;
		this.categoryId = categoryId;
		this.size = size;
	}
	public SizeSp() {
		super();
	}
	
}
