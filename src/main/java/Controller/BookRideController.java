package Controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RideDao;
import model.Owner;
import model.Ride;
import model.Traveler;
import utils.DistanceCalculator;

@WebServlet("/BookRide")
public class BookRideController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BookRideController() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		HttpSession session = request.getSession(false);

		if (action == null) {
			response.sendRedirect("index.jsp");
			return;
		}

		if (action.equalsIgnoreCase("book")) {

			Traveler traveler = (Traveler) session.getAttribute("data");

			if (traveler == null) {
				response.sendRedirect("traveler-login.jsp");
				return;
			}

			int userId = traveler.getId();

			Ride r = new Ride();
			r.setServiceType(request.getParameter("serviceType"));
			r.setPickupLocation(request.getParameter("pickupLocation"));
			r.setDropLocation(request.getParameter("dropLocation"));
			r.setCarType(request.getParameter("carType"));
			r.setSeats(Integer.parseInt(request.getParameter("seats")));
			r.setPaymentMethod(request.getParameter("paymentMethod"));
			r.setNotes(request.getParameter("notes"));
			r.setUserId(userId);

			String[] daysArr = request.getParameterValues("days");
			if (daysArr != null && daysArr.length > 0) {
				String daysStr = Arrays.stream(daysArr).collect(Collectors.joining(","));
				r.setDays(daysStr);
			} else {
				r.setDays("");
			}

			try {
				String pickupTimeRaw = request.getParameter("pickupTime");
				if (pickupTimeRaw != null && !pickupTimeRaw.isEmpty()) {
					if (!pickupTimeRaw.contains(":"))
						pickupTimeRaw += ":00";
					else if (pickupTimeRaw.matches("^\\d{1,2}:\\d{2}$"))
						pickupTimeRaw += ":00";
					r.setPickupTime(Time.valueOf(pickupTimeRaw));
				}

				String returnTimeRaw = request.getParameter("returnTime");
				if (returnTimeRaw != null && !returnTimeRaw.isEmpty()) {
					if (returnTimeRaw.matches("^\\d{1,2}:\\d{2}$"))
						returnTimeRaw += ":00";
					r.setReturnTime(Time.valueOf(returnTimeRaw));
				}
			} catch (Exception e) {
				System.out.println("ERROR parsing time: " + e.getMessage());
			}

			try {
				String travelDate = request.getParameter("travelDate");
				if (travelDate != null && !travelDate.isEmpty()) {
					r.setTravelDate(Date.valueOf(travelDate));
				} else {
					r.setTravelDate(new Date(System.currentTimeMillis()));
				}
			} catch (Exception e) {
				r.setTravelDate(new Date(System.currentTimeMillis()));
			}

			
			double distanceKm = DistanceCalculator.calculateDistance(r.getPickupLocation(), r.getDropLocation());
			r.setDistance(String.format("%.2f km", distanceKm));

			double perKmRate = 10;
			switch (r.getServiceType()) {
			case "daily_commute":
				perKmRate = 8;
				break;
			case "airport_transfer":
				perKmRate = 12;
				break;
			case "outstation":
				perKmRate = 15;
				break;
			case "rental":
				perKmRate = 10;
				break;
			}

			double fare = DistanceCalculator.calculateFare(distanceKm, perKmRate);
			r.setFare((int) fare);

			boolean inserted = RideDao.insertride(r);
			if (inserted) {
				request.setAttribute("data", r);
				request.setAttribute("msg",
						"Ride booked successfully! Distance: " + r.getDistance() + ", Fare: ₹" + r.getFare());
				request.getRequestDispatcher("bookingConfirmation.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "Error booking ride. Please try again.");
				request.getRequestDispatcher("traveler-home.jsp").forward(request, response);
			}
		} else if (action.equalsIgnoreCase("search")) {
			String pickup = request.getParameter("pickupLocation");
			String drop = request.getParameter("dropLocation");
			Date travelDate = Date.valueOf(request.getParameter("travelDate"));
			Time pickupTime = Time.valueOf(request.getParameter("pickupTime") + ":00");

			List<Ride> rides = RideDao.searchRides(pickup, drop, travelDate, pickupTime);

			request.setAttribute("data", rides);
			request.getRequestDispatcher("shared-ride-results.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("offer")) {

			Owner owner = (Owner) session.getAttribute("data");
			if (owner == null) {
				response.sendRedirect("owner-login.jsp");
				return;
			}

			Ride r = new Ride();
			r.setUserId(owner.getOwnerId());
			r.setPickupLocation(request.getParameter("pickupLocation"));
			r.setDropLocation(request.getParameter("dropLocation"));
			r.setCarType(request.getParameter("carType"));
			r.setSeats(Integer.parseInt(request.getParameter("seats")));
			r.setPaymentMethod(request.getParameter("paymentMethod"));
			r.setNotes(request.getParameter("notes"));
			r.setServiceType(request.getParameter("serviceType"));

			try {
				String pickupTime = request.getParameter("pickupTime");
				if (pickupTime != null && !pickupTime.isEmpty())
					r.setPickupTime(Time.valueOf(pickupTime + ":00"));
				r.setTravelDate(Date.valueOf(request.getParameter("travelDate")));
			} catch (Exception e) {
				r.setTravelDate(new Date(System.currentTimeMillis()));
			}

			boolean inserted = RideDao.insertride(r);
			if (inserted) {
				request.setAttribute("msg", "Ride offered successfully!");
				request.getRequestDispatcher("owner-home.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "Error offering ride.");
				request.getRequestDispatcher("owner-home.jsp").forward(request, response);
			}
		} else if (action.equalsIgnoreCase("bookride")) {

			Traveler traveler = (Traveler) session.getAttribute("data");

			if (traveler == null) {
				response.sendRedirect("traveler-login.jsp");
				return;
			}

			int rideId = Integer.parseInt(request.getParameter("rideId"));
			int seatsToBook = Integer.parseInt(request.getParameter("seats"));
			boolean booked = RideDao.bookRide(rideId, traveler.getId(), seatsToBook);

			if (booked == true) {
				
				request.setAttribute("msg", "Ride booked successfully!");
			} else {
				request.setAttribute("msg", "Unable to book. Not enough seats available.");
			}

			request.getRequestDispatcher("ride-results.jsp").forward(request, response);
		}
	}
}