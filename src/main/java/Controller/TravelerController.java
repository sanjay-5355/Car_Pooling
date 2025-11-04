package Controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TravelerDao;
import model.Traveler;
import send_email.TravelerEmailSender;

/**
 * Servlet implementation class TravelerController
 */
@WebServlet("/Traveler")
public class TravelerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TravelerController() {
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

		if (action.equalsIgnoreCase("register")) {

			Traveler t = new Traveler();
			t.setName(request.getParameter("name"));
			t.setEmail(request.getParameter("email"));
			t.setPassword(request.getParameter("password"));
			t.setContact(Long.parseLong(request.getParameter("contact")));
			t.setPayment(request.getParameter("payment"));
			System.out.println(t);

			boolean flag = TravelerDao.checkEmail(request.getParameter("email"));
			if (flag == false) {

				TravelerDao.insertowner(t);
				response.sendRedirect("traveler-login.jsp");
			} else {

				request.setAttribute("msg", "E mail already exist");
				request.getRequestDispatcher("traveler-login.jsp").forward(request, response);
			}

		} else if (action.equalsIgnoreCase("login")) {

			String email = request.getParameter("email");
			String password = request.getParameter("password");

			Traveler t = TravelerDao.travelerlogin(email, password);

			if (t != null) {

				HttpSession session = request.getSession();
				session.setAttribute("data", t);
				response.sendRedirect("traveler-home.jsp");
			} else {

				request.setAttribute("msg", "E mail or password is incorrect");
				request.getRequestDispatcher("traveler-login.jsp").forward(request, response);
			}

		} else if (action.equalsIgnoreCase("update")) {

			Traveler t = new Traveler();

			t.setId(Integer.parseInt(request.getParameter("id")));
			t.setName(request.getParameter("name"));
			t.setEmail(request.getParameter("email"));
			t.setContact(Long.parseLong(request.getParameter("contact")));

			TravelerDao.updateTravelerProfile(t);

			HttpSession session = request.getSession();
			session.setAttribute("data", t);
			request.getRequestDispatcher("traveler-profile.jsp").forward(request, response);

		} else if (action.equalsIgnoreCase("change password")) {

			String email = request.getParameter("email");
			String op = request.getParameter("op");
			String np = request.getParameter("np");
			String cnp = request.getParameter("cnp");

			boolean flag = TravelerDao.checkOldPassword(email, op);
			if (flag == true) {

				if (np.equals(cnp)) {

					TravelerDao.updatepass(email, cnp);
					response.sendRedirect("traveler-profile.jsp");

				} else {

					request.setAttribute("msg", "New password and Confimr New Password is incorrect");
					request.getRequestDispatcher("traveler-change-password.jsp").forward(request, response);

				}

			} else {

				request.setAttribute("msg", "Old Password is incorrect");
				request.getRequestDispatcher("traveler-change-password.jsp").forward(request, response);
			}

		} else if (action.equalsIgnoreCase("Send OTP")) {

			String email = request.getParameter("email");
			Random r = new Random();
			int num = r.nextInt(100000, 999999);
			System.out.println(num);

			try {

				TravelerEmailSender.sendOTP(email, num);
				request.setAttribute("otp", num);
				request.setAttribute("email", email);
				request.getRequestDispatcher("traveler-verify-otp.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action.equalsIgnoreCase("Verify")) {

			String email = request.getParameter("email");
			int otp1 = Integer.parseInt(request.getParameter("otp1"));
			int otp2 = Integer.parseInt(request.getParameter("otp2"));
			if (otp1 == otp2) {

				request.setAttribute("email", email);
				request.getRequestDispatcher("travler-new-password.jsp").forward(request, response);
			} else {

				request.setAttribute("msg", "OTP is incorrect");
				request.setAttribute("otp", otp1);
				request.setAttribute("email", email);
				request.getRequestDispatcher("traveler-verify-otp.jsp").forward(request, response);

			}
		} else if (action.equalsIgnoreCase("new password")) {

			String email = request.getParameter("email");
			String np = request.getParameter("np");
			String cnp = request.getParameter("cnp");

			if (np.equals(cnp)) {

				TravelerDao.updatepass(email, cnp);
				response.sendRedirect("traveler-login.jsp");
			} else {

				request.setAttribute("msg", "New password and Confimr New Password is incorrect");
				request.getRequestDispatcher("traveler-new-password.jsp").forward(request, response);
			}
		} else if (action.equalsIgnoreCase("logout")) {

			HttpSession session = request.getSession(false);
			if (session != null) {
				session.invalidate();
			}

			request.setAttribute("msg", "You have logged out successfully.");
			request.getRequestDispatcher("owner-login.jsp").forward(request, response);
		}
	}
}