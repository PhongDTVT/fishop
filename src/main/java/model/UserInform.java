package model;

public class UserInform  {
	private int userId;
	private String tinh;
	private String huyen;
	private String xa;
	private String sonha;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getTinh() {
		return tinh;
	}
	public void setTinh(String tinh) {
		this.tinh = tinh;
	}
	public String getHuyen() {
		return huyen;
	}
	public void setHuyen(String huyen) {
		this.huyen = huyen;
	}
	public String getXa() {
		return xa;
	}
	public void setXa(String xa) {
		this.xa = xa;
	}
	public String getSonha() {
		return sonha;
	}
	public void setSonha(String sonha) {
		this.sonha = sonha;
	}
	public UserInform(int userId, String tinh, String huyen, String xa, String sonha) {
		super();
		this.userId = userId;
		this.tinh = tinh;
		this.huyen = huyen;
		this.xa = xa;
		this.sonha = sonha;
	}
	public UserInform() {
		super();
	}

	
	

}
