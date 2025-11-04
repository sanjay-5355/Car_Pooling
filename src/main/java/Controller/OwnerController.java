package Controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OwnerDao;
import model.Owner;
import send_email.OwnerEmailSender;

/**
 * Servlet implementation class OwnerController
 */
@WebServlet("/Owner")
public class OwnerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public OwnerController() {
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

			Owner o = new Owner();

			o.setName(request.getParameter("name"));
			o.setEmail(request.getParameter("email"));
			o.setPassword(request.getParameter("password"));
			o.setContact(Long.parseLong(request.getParameter("contact")));
			System.out.println(o);

			boolean flag = OwnerDao.checkEmail(request.getParameter("email"));
			if (flag == false) {

				OwnerDao.insertowner(o);
				response.sendRedirect("owner-login.jsp");

			} else {

				request.setAttribute("msg", "E mail already exist");
				request.getRequestDispatcher("owner-login.jsp").forward(request, response);

			}

		} else if (action.equalsIgnoreCase("login")) {

			String email = request.getParameter("email");
			String password = request.getParameter("password");

			System.out.println("Login attempt with email: " + email + " and password: " + password);

			Owner o = OwnerDao.ownerlogin(email, password);

			if (o != null) {

				HttpSession session = request.getSession();
				session.setAttribute("data", o);
				System.out.println("Owner data set in session: " + o.getName());
				request.getRequestDispatcher("owner-home.jsp").forward(request, response);

			} else {

				request.setAttribute("msg", "E mail or password is incorrect");
				request.getRequestDispatcher("owner-login.jsp").forward(request, response);

			}
		} else if (action.equalsIgnoreCase("update")) {

			Owner o = new Owner();

			o.setOwnerId(Integer.parseInt(request.getParameter("OwnerID")));
			o.setName(request.getParameter("name"));
			o.setEmail(request.getParameter("email"));
			o.setContact(Long.parseLong(request.getParameter("contact")));

			OwnerDao.updateOwnerProfile(o);

			HttpSession session = request.getSession();
			session.setAttribute("data", o);
			request.getRequestDispatcher("owner-profile.jsp").forward(request, response);

		} else if (action.equalsIgnoreCase("change password")) {

			String email = request.getParameter("email");
			String op = request.getParameter("op");
			String np = request.getParameter("np");
			String cnp = request.getParameter("cnp");

			boolean flag = OwnerDao.checkOldPassword(email, op);
			if (flag == true) {

				if (np.equals(cnp)) {

					OwnerDao.updatepass(email, cnp);
					response.sendRedirect("owner-profile.jsp");
				} else {

					request.setAttribute("msg", "New password and Confimr New Password is incorrect");
					request.getRequestDispatcher("owner-change-password.jsp").forward(request, response);
				}
			} else {

				request.setAttribute("msg", "Old Password is incorrect");
				request.getRequestDispatcher("owner-change-password.jsp").forward(request, response);
			}

		} else if (action.equalsIgnoreCase("Send OTP")) {

			String email = request.getParameter("email");
			Random r = new Random();
			int num = r.nextInt(100000, 999999);
			System.out.println(num);
			try {
				OwnerEmailSender.sendOTP(email, num);
				request.setAttribute("otp", num);
				request.setAttribute("email", email);
				request.getRequestDispatcher("owner-verify-otp.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (action.equalsIgnoreCase("Verify")) {

			String email = request.getParameter("email");
			int otp1 = Integer.parseInt(request.getParameter("otp1"));
			int otp2 = Integer.parseInt(request.getParameter("otp2"));
			if (otp1 == otp2) {

				request.setAttribute("email", email);
				request.getRequestDispatcher("owner-new-password.jsp").forward(request, response);
			} else {

				request.setAttribute("msg", "OTP not matched");
				request.setAttribute("otp", otp1);
				request.setAttribute("email", email);
				request.getRequestDispatcher("owner-verify-otp.jsp").forward(request, response);
			}

		} else if (action.equalsIgnoreCase("new password")) {

			String email = request.getParameter("email");
			String np = request.getParameter("np");
			String cnp = request.getParameter("cnp");

			if (np.equals(cnp)) {

				OwnerDao.updatepass(email, cnp);
				response.sendRedirect("owner-login.jsp");
			} else {

				request.setAttribute("msg", "New password and Confimr New Password is incorrect");
				request.getRequestDispatcher("owner-new-password.jsp").forward(request, response);
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
