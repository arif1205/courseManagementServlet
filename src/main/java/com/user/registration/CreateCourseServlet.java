package com.user.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class CreateCourseServlet
 */
@WebServlet("/create-course")
public class CreateCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public CreateCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher view=request.getRequestDispatcher("/pages/Profile.jsp");
		view.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
        String course_name = request.getParameter("courseName");
        String course_code = request.getParameter("courseCode");
        String course_teacher = request.getParameter("courseTeacher");
        
        RequestDispatcher dispatcher = null;
        Connection con = null;
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","Arifcse19*");
        	PreparedStatement pst = con.prepareStatement("insert into courses(course_name,course_code, course_teacher) values(?,?,?)");
        	pst.setString(1, course_name);
        	pst.setString(2, course_code);
        	pst.setString(3, course_teacher);
        	int rowCount = pst.executeUpdate();
        	dispatcher = request.getRequestDispatcher("/pages/Profile.jsp");
        	if(rowCount > 0) {
        		request.setAttribute("status", "success");
        		dispatcher.forward(request, response);
        	}else {
        		request.setAttribute("status", "failed");
        	}
        }catch(Exception e){
        	e.printStackTrace();
        }finally {
        	try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }

	}

}