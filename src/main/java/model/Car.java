package model;

import java.sql.Date;

public class Car {
	
	private int id;
    private int ownerId;
    private String model;
    private String number;
    private Date registrationDate;
    private int age;
    private int seats;
    private String image;
    private double amount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getSeats() {
		return seats;
	}
	public void setSeats(int seats) {
		this.seats = seats;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "Car [id=" + id + ", ownerId=" + ownerId + ", model=" + model + ", number=" + number
				+ ", registrationDate=" + registrationDate + ", age=" + age + ", seats=" + seats + ", image=" + image
				+ ", amount=" + amount + "]";
	}
	
    
    
}

