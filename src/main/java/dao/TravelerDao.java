package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import model.Traveler;

public class TravelerDao {

	public static void insertowner(Traveler t) {

		try {

			Connection conn = DBConnection.createConnection();
			String sql = "insert into traveler (name,email,password,contact,payment) values (?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, t.getName());
			pst.setString(2, t.getEmail());
			pst.setString(3, t.getPassword());
			pst.setLong(4, t.getContact());
			pst.setString(5, t.getPayment());
			pst.executeUpdate();

			System.out.println("Data inserted successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static boolean checkEmail(String email) {

		boolean flag = false;

		try {

			Connection conn = DBConnection.createConnection();
			String sql = "select * from traveler where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {

				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static Traveler travelerlogin(String email, String password) {

		Traveler t = null;

		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from traveler where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {

				t = new Traveler();
				t.setId(rs.getInt("id"));
				t.setName(rs.getString("name"));
				t.setEmail(rs.getString("email"));
				t.setPassword(rs.getString("password"));
				t.setPayment(rs.getString("payment"));
				t.setContact(rs.getLong("contact"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}

	public static void updateTravelerProfile(Traveler t) {

		try {

			Connection conn = DBConnection.createConnection();
			String sql = "update traveler set name=?,email=?,contact=? where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, t.getName());
			pst.setString(2, t.getEmail());
			pst.setLong(3, t.getContact());
			pst.setInt(4, t.getId());
			pst.executeUpdate();

			System.out.println("Traveler profile updated successfully");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static boolean checkOldPassword(String email, String op) {

		boolean flag = false;

		try {

			Connection conn = DBConnection.createConnection();
			String sql = "select * from traveler where email = ? and password = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, op);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {

				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static void updatepass(String email, String np) {

		try {
			Connection conn = DBConnection.createConnection();
			String sql = "update traveler set password=? where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, np);
			pst.setString(2, email);
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static List<Traveler> getAllTravelers() {
		List<Traveler> list = new ArrayList<>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "SELECT * FROM traveler";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Traveler t = new Traveler();
				t.setId(rs.getInt("id"));
				t.setName(rs.getString("name"));
				t.setEmail(rs.getString("email"));
				t.setContact(rs.getLong("contact"));
				list.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static int getTravelerCount() {
	    int count = 0;
	    try {
	        Connection conn = DBConnection.createConnection();
	        String sql = "SELECT COUNT(*) as total FROM traveler";
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
