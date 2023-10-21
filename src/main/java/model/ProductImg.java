package model;

public class ProductImg {
	private int spanhId;
	private int sanphamId;
	private String sanphamImg;
	public int getSpanhId() {
		return spanhId;
	}
	public void setSpanhId(int spanhId) {
		this.spanhId = spanhId;
	}
	public int getSanphamId() {
		return sanphamId;
	}
	public void setSanphamId(int sanphamId) {
		this.sanphamId = sanphamId;
	}
	public String getSanphamImg() {
		return sanphamImg;
	}
	public void setSanphamImg(String sanphamImg) {
		this.sanphamImg = sanphamImg;
	}
	public ProductImg(int spanhId, int sanphamId, String sanphamImg) {
		super();
		this.spanhId = spanhId;
		this.sanphamId = sanphamId;
		this.sanphamImg = sanphamImg;
	}
	public ProductImg() {
		super();
	}
	
}
