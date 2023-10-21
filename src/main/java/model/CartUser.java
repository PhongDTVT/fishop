package model;

public class CartUser extends Product  {
	private int userId;
	private int quantityInCart;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getQuantityInCart() {
		return quantityInCart;
	}
	public void setQuantityInCart(int quantityInCart) {
		this.quantityInCart = quantityInCart;
	}
	public CartUser(int userId, int quantityInCart) {
		super();
		this.userId = userId;
		this.quantityInCart = quantityInCart;
	}
	public CartUser() {
		super();
	}
	
	
}
