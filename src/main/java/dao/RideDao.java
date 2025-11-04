package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import model.Ride;

public class RideDao {

	public static boolean insertride(Ride r) {

		boolean inserted = false;

		try {

			Connection conn = DBConnection.createConnection();
			String sql = "INSERT INTO rides (serviceType, userId, pickupLocation, dropLocation, pickupTime, returnTime, travelDate, days, carType, seats, availableSeats, bookedSeats, paymentMethod, distance, fare, notes) VALUES (?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, r.getServiceType());
			pst.setInt(2, r.getUserId());
			pst.setString(3, r.getPickupLocation());
			pst.setString(4, r.getDropLocation());
			pst.setTime(5, r.getPickupTime());
			pst.setTime(6, r.getReturnTime());
			pst.setDate(7, r.getTravelDate());
			pst.setString(8, r.getDays());
			pst.setString(9, r.getCarType());
			pst.setInt(10, r.getSeats());
			pst.setInt(11, r.getSeats());
			pst.setInt(12, 0);
			pst.setString(13, r.getPaymentMethod());
			pst.setString(14, r.getDistance());
			pst.setInt(15, r.getFare());
			pst.setString(16, r.getNotes());

			int rows = pst.executeUpdate();

			if (rows > 0) {
				inserted = true;
				System.out.println("Ride data inserted successfully!");
			}

			System.out.println("Rider data inserted");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return inserted;
	}

	public static List<Ride> searchRides(String pickup, String drop, Date travelDate, Time pickupTime) {
		List<Ride> list = new ArrayList<>();

		try {
			Connection conn = DBConnection.createConnection();

			String sql = "SELECT * FROM rides WHERE pickupLocation=? AND dropLocation=? AND travelDate=? AND pickupTime=?";
			PreparedStatement pst = conn.prepareStatement(sql);

			pst.setString(1, pickup);
			pst.setString(2, drop);
			pst.setDate(3, travelDate);
			pst.setTime(4, pickupTime);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				Ride r = new Ride();
				r.setId(rs.getInt("id"));
				r.setServiceType(rs.getString("serviceType"));
				r.setPickupLocation(rs.getString("pickupLocation"));
				r.setDropLocation(rs.getString("dropLocation"));
				r.setPickupTime(rs.getTime("pickupTime"));
				r.setTravelDate(rs.getDate("travelDate"));
				r.setCarType(rs.getString("carType"));
				r.setSeats(rs.getInt("seats"));
				r.setDistance(rs.getString("distance"));
				r.setFare(rs.getInt("fare"));
				r.setAvailableSeats(rs.getInt("availableSeats"));

				list.add(r);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static boolean bookRide(int rideId, int travelerId, int seatsToBook) {
		boolean booked = false;

		try {
			Connection conn = DBConnection.createConnection();

			String sql = "SELECT availableSeats, bookedSeats FROM rides WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, rideId);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				int available = rs.getInt("availableSeats");
				int bookedNow = rs.getInt("bookedSeats");

				if (available >= seatsToBook && seatsToBook > 0) {

					String updateSql = "UPDATE rides SET availableSeats = ?, bookedSeats = ? WHERE id = ?";
					PreparedStatement pstUpdate = conn.prepareStatement(updateSql);
					pstUpdate.setInt(1, available - seatsToBook);
					pstUpdate.setInt(2, bookedNow + seatsToBook);
					pstUpdate.setInt(3, rideId);

					int rows = pstUpdate.executeUpdate();

					if (rows > 0) {
						booked = true;
						System.out.println("✅ Ride booked successfully: " + seatsToBook + " seat(s)");
					}
				} else {
					System.out.println("⚠️ Not enough seats available to book this ride.");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return booked;
	}

	public static List<Ride> getAllRides() {
		List<Ride> list = new ArrayList<>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "SELECT * FROM rides";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Ride r = new Ride();
				r.setId(rs.getInt("id"));
				r.setPickupLocation(rs.getString("pickuplocation"));
				r.setDropLocation(rs.getString("droplocation"));
				r.setTravelDate(rs.getDate("traveldate"));
				r.setFare(rs.getInt("fare"));
				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Ride> getRidesByOwnerId(int ownerId) {
		List<Ride> rides = new ArrayList<>();

		try {
			Connection conn = DBConnection.createConnection();
			String sql = "SELECT * FROM rides WHERE userId = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, ownerId);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Ride r = new Ride();
				r.setId(rs.getInt("id"));
				r.setPickupLocation(rs.getString("pickupLocation"));
				r.setDropLocation(rs.getString("dropLocation"));
				r.setTravelDate(rs.getDate("travelDate"));
				r.setPickupTime(rs.getTime("pickupTime"));
				rides.add(r);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return rides;
	}
	
	public static List<Ride> getRidesBookedByTraveler(int travelerId) {
	    List<Ride> rides = new ArrayList<>();
	    try {
	        Connection conn = DBConnection.createConnection();
	        
	        
	        String sql = "SELECT * FROM rides WHERE userId = ?";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        pst.setInt(1, travelerId);
	        
	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            Ride r = new Ride();
	            r.setId(rs.getInt("id"));
	            r.setPickupLocation(rs.getString("pickupLocation"));
	            r.setDropLocation(rs.getString("dropLocation"));
	            r.setTravelDate(rs.getDate("travelDate"));
	            r.setPickupTime(rs.getTime("pickupTime"));
	            r.setAvailableSeats(rs.getInt("availableSeats"));
	            r.setFare(rs.getInt("fare"));
	            r.setPaymentMethod(rs.getString("paymentMethod"));
	            rides.add(r);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return rides;
	}
	
	public static int getRideCount() {
	    int count = 0;
	    try {
	        Connection conn = DBConnection.createConnection();
	        String sql = "SELECT COUNT(*) as total FROM rides";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        ResultSet rs = pst.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt("total");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}



}
