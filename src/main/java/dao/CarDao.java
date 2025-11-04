package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import model.Car;

public class CarDao {

	public static void insercar(Car c) {

		try {

			Connection conn = DBConnection.createConnection();
			String sql = "INSERT INTO cars(ownerId, model, number, registrationDate, age, seats, image, amount) VALUES(?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, c.getOwnerId());
			pst.setString(2, c.getModel());
			pst.setString(3, c.getNumber());
			pst.setDate(4, c.getRegistrationDate());
			pst.setInt(5, c.getAge());
			pst.setInt(6, c.getSeats());
			pst.setString(7, c.getImage());
			pst.setDouble(8, c.getAmount());

			pst.executeUpdate();

			System.out.println("New car inserted");
			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public static List<Car> getAllCars() {
	    List<Car> list = new ArrayList<>();

	    try {
	        Connection conn = DBConnection.createConnection();
	        String sql = "SELECT * FROM cars";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        ResultSet rs = pst.executeQuery();

	        while (rs.next()) {
	            Car c = new Car();
	            c.setId(rs.getInt("id"));
	            c.setOwnerId(rs.getInt("ownerId"));
	            c.setModel(rs.getString("model"));
	            c.setNumber(rs.getString("number"));
	            c.setRegistrationDate(rs.getDate("registrationDate"));
	            c.setAge(rs.getInt("age"));
	            c.setSeats(rs.getInt("seats"));
	            c.setImage(rs.getString("image"));
	            c.setAmount(rs.getDouble("amount"));
	            list.add(c);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

}
