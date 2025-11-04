package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import model.Owner;
import model.Ride;

public class OwnerDao {

	public static void insertowner(Owner o) {

		try {

			Connection conn = DBConnection.createConnection();
			String sql = "insert into owner (name,email,password,contact) values (?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, o.getName());
			pst.setString(2, o.getEmail());
			pst.setString(3, o.getPassword());
			pst.setLong(4, o.getContact());
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
			String sql = "select * from owner where email=?";
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

	public static Owner ownerlogin(String email, String password) {

		Owner o = null;

		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from owner where email = ? and password = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {

				o = new Owner();
				o.setOwnerId(rs.getInt("ownerId"));
				o.setName(rs.getString("name"));
				o.setEmail(rs.getString("email"));
				o.setPassword(rs.getString("password"));
				o.setContact(rs.getLong("contact"));

				System.out.println(o);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return o;
	}

	public static void updateOwnerProfile(Owner o) {

		try {

			Connection conn = DBConnection.createConnection();
			String sql = "update owner set name=?,email=?,contact=? where ownerId=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, o.getName());
			pst.setString(2, o.getEmail());
			pst.setLong(3, o.getContact());
			pst.setInt(4, o.getOwnerId());
			pst.executeUpdate();

			System.out.println("Owner profile update successfully");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static boolean checkOldPassword(String email, String op) {

		boolean flag = false;

		try {
			Connection conn = DBConnection.createConnection();
			String sql = "select * from owner where email=? and password=?";
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
			String sql = "update owner set password=? where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, np);
			pst.setString(2, email);
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static List<Owner> getAllOwners() {
		List<Owner> list = new ArrayList<>();
		try {
			Connection conn = DBConnection.createConnection();
			String sql = "SELECT * FROM owner";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Owner o = new Owner();
				o.setOwnerId(rs.getInt("ownerId"));
				o.setName(rs.getString("name"));
				o.setEmail(rs.getString("email"));
				o.setContact(rs.getLong("contact"));
				list.add(o);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static int getOwnerCount() {
	    int count = 0;
	    try {
	        Connection conn = DBConnection.createConnection();
	        String sql = "SELECT COUNT(*) as total FROM owner";
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