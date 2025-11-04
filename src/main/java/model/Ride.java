package model;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class Ride {

	private int id;
    private String serviceType;
    private int userId;
    private String pickupLocation;
    private String dropLocation;
    private Time pickupTime;
    private Time returnTime;
    private Date travelDate; 
    private String days; 
    private String carType;
    private int seats;
    private String paymentMethod;
    private String distance;
    private int fare;
    private String notes;
    private Timestamp createdAt;
    private int availableSeats;
    private int bookedSeats;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getPickupLocation() {
		return pickupLocation;
	}
	public void setPickupLocation(String pickupLocation) {
		this.pickupLocation = pickupLocation;
	}
	public String getDropLocation() {
		return dropLocation;
	}
	public void setDropLocation(String dropLocation) {
		this.dropLocation = dropLocation;
	}
	public Time getPickupTime() {
		return pickupTime;
	}
	public void setPickupTime(Time pickupTime) {
		this.pickupTime = pickupTime;
	}
	public Time getReturnTime() {
		return returnTime;
	}
	public void setReturnTime(Time returnTime) {
		this.returnTime = returnTime;
	}
	public Date getTravelDate() {
		return travelDate;
	}
	public void setTravelDate(Date travelDate) {
		this.travelDate = travelDate;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public int getSeats() {
		return seats;
	}
	public void setSeats(int seats) {
		this.seats = seats;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public int getFare() {
		return fare;
	}
	public void setFare(int fare) {
		this.fare = fare;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public int getAvailableSeats() {
		return availableSeats;
	}
	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}
	public int getBookedSeats() {
		return bookedSeats;
	}
	public void setBookedSeats(int bookedSeats) {
		this.bookedSeats = bookedSeats;
	}
	
	@Override
	public String toString() {
		return "Ride [id=" + id + ", serviceType=" + serviceType + ", userId=" + userId + ", pickupLocation="
				+ pickupLocation + ", dropLocation=" + dropLocation + ", pickupTime=" + pickupTime + ", returnTime="
				+ returnTime + ", travelDate=" + travelDate + ", days=" + days + ", carType=" + carType + ", seats="
				+ seats + ", paymentMethod=" + paymentMethod + ", distance=" + distance + ", fare=" + fare + ", notes="
				+ notes + ", createdAt=" + createdAt + ", availableSeats=" + availableSeats + ", bookedSeats="
				+ bookedSeats + "]";
	}
    
    
	
    
}
