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
@WebServlet("/showStudents")
public class ShowStudentServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String course_id = request.getParameter("course_id");
		
		RequestDispatcher dispatcher = null;
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","Arifcse19*");
			 PreparedStatement pst = con.prepareStatement("SELECT u.* FROM users AS u JOIN takes AS t ON u.id = t.student_id WHERE t.course_id = ?;");
			 
			 pst.setString(1, course_id);
			 
			 ResultSet rs = pst.executeQuery();
			 if(rs.next()) {
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
