package entity;

public class BookOrder {
	private int orderId;
	private String userName;
	private String zipcCode;
	private String phone;
	private String creditCard;
	private double total;
	
	public BookOrder() {
		
	}
	public String getCreditCard() {
		return creditCard;
	}
	public void setCreditCard(String creditCard) {
		this.creditCard = creditCard;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getZipcCode() {
		return zipcCode;
	}
	public void setZipcCode(String zipcCode) {
		this.zipcCode = zipcCode;
	}
}
