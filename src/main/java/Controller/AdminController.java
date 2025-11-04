package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OwnerDao;
import dao.RideDao;
import dao.TravelerDao;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/Admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("login")) {

			String email = "admin@gmail.com";
			String pass = "admin@123";

			if (request.getParameter("email").equalsIgnoreCase(email)
					&& request.getParameter("password").equalsIgnoreCase(pass)) {

				HttpSession session = request.getSession();
				session.setAttribute("email", email);

				int travelerCount = TravelerDao.getTravelerCount();
				int ownerCount = OwnerDao.getOwnerCount();
				int rideCount = RideDao.getRideCount();

				request.setAttribute("travelerCount", travelerCount);
				request.setAttribute("ownerCount", ownerCount);
				request.setAttribute("rideCount", rideCount);

				request.getRequestDispatcher("admin-home.jsp").forward(request, response);
			} else {

				request.setAttribute("error", "Invalid email or password");
				request.getRequestDispatcher("admin-login.jsp").forward(request, response);
			}

		} else if (action.equalsIgnoreCase("logout")) {
			HttpSession session = request.getSession(false);
			if (session != null) {
				session.invalidate(); 
			}
			request.setAttribute("msg", "You have logged out successfully.");
			request.getRequestDispatcher("admin-login.jsp").forward(request, response);
		}
	}
}