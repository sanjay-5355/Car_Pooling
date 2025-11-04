package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.CarDao;
import model.Car;

/**
 * Servlet implementation class CarController
 */
@WebServlet("/Car")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512, maxRequestSize = 1024 * 1024
		* 512)
public class CarController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CarController() {
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

	private String extractfilename(Part file) {
		String cd = file.getHeader("content-disposition");
		System.out.println(cd);
		String[] items = cd.split(";");
		for (String string : items) {
			if (string.trim().startsWith("filename")) {
				return string.substring(string.indexOf("=") + 2, string.length() - 1);
			}
		}
		return "";
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("addCar")) {

			String savePath = "C:\\Users\\91975\\eclipse-workspace\\CarPooling\\src\\main\\webapp\\imagess";
			File fileSaveDir = new File(savePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("image");
			String fileName = extractfilename(file1);
			file1.write(savePath + File.separator + fileName);
			String filePath = savePath + File.separator + fileName;

			String savePath2 = "C:\\Users\\91975\\eclipse-workspace\\CarPooling\\src\\main\\webapp\\imagess";
			File imgSaveDir = new File(savePath2);
			if (!imgSaveDir.exists()) {
				imgSaveDir.mkdir();
			}

			Car c = new Car();
			c.setImage(fileName);
			c.setOwnerId(Integer.parseInt(request.getParameter("ownerId")));
			c.setModel(request.getParameter("model"));
			c.setNumber(request.getParameter("number"));
			c.setAge(Integer.parseInt(request.getParameter("age")));
			c.setSeats(Integer.parseInt(request.getParameter("seats")));
			c.setAmount(Double.parseDouble(request.getParameter("amount")));
			String registrationDate = request.getParameter("registrationDate");
			Date date = Date.valueOf(registrationDate);
			c.setRegistrationDate(date);

			System.out.println(c);

			CarDao.insercar(c);
			response.sendRedirect("owner-home.jsp");

		}
	}

}
