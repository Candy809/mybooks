package entity;

import java.io.Serializable;



public class CartItemBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BookBean book;
	private int quantity;
	
	public CartItemBean(BookBean book, int quantity) {
		super();
		this.book = book;
		this.quantity = quantity;
	}
	public BookBean getBook() {
		return book;
	}
	public void setBook(BookBean book) {
		this.book = book;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
