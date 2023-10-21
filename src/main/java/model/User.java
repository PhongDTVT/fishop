package model;

public class User {
	private int id;
	private String fullName;
	private String userName;
	private String passWord;
	private String email;
	private String phoneNumber;
	private String address;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	public User(int id, String fullName, String userName, String passWord, String email, String phoneNumber,
			String address) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
	
		
	}
	public User() {
		super();
	}
}
