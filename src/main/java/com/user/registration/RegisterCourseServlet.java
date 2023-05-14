package com.user.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Login
 */
@WebServlet("/registerCourse")
public class RegisterCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String student_id = request.getParameter("student_id");
		String course_id = request.getParameter("course_id");
		
		RequestDispatcher dispatcher = null;
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","Arifcse19*");
			 PreparedStatement pst = con.prepareStatement("insert into takes (student_id, course_id) values (? ,?)");
			 
			 pst.setString(1, student_id);
			 pst.setString(2, course_id);
			 
			 int rs = pst.executeUpdate();
			 if(rs > 0) {
				 dispatcher = request.getRequestDispatcher("/pages/Profile.jsp");
			 }else {
				 request.setAttribute("status", "failed");
				 dispatcher = request.getRequestDispatcher("/pages/Login.jsp");
			 }
			 dispatcher.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		
		    
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
