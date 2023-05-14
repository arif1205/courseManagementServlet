<%@ page import="java.sql.*" %>

<section
			id="content"
			class="min-h-[90vh] bg-slate-200 py-[50px] px-[200px]"
		>
			<div class="text-center mb-8">
				<button
					type="submit"
					class="px-8 py-2 border-b-4 border-primary text-primary font-bold text-center text-base uppercase"
				>
					Registered Courses
				</button>
			</div>

			<!-- table for course list  -->
			<table
				class="table-auto border-collapse border border-slate-300 mx-auto course-table mb-16"
			>
				<thead>
					<tr class="bg-primary text-white">
						<th>Course Name</th>
						<th>Course code</th>
						<th>Course Teacher</th>
					</tr>
				</thead>
				<tbody>
					<% try {
						 String id = String.valueOf(session.getAttribute("id"));
						 System.out.println(id);
						 Class.forName("com.mysql.jdbc.Driver");
						 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","Arifcse19*");
						 PreparedStatement pst = con.prepareStatement("SELECT c.course_id, c.course_name, c.course_code, c.course_teacher FROM takes AS t JOIN courses AS c ON t.course_id = c.course_id WHERE t.student_id = ?");
						 pst.setString(1, id);
						 ResultSet rs = pst.executeQuery();
						 while(rs.next()) { %>
						  
						 <tr class="even:bg-amber-100 odd:bg-blue-100">
							<td><%= rs.getString("course_name") %></td>
							<td><%= rs.getString("course_code") %></td>
							<td><%= rs.getString("course_teacher") %></td>
						</tr>							 
						 <% }
						 } catch(Exception e) {
								e.printStackTrace();
							}
						 %>
				</tbody>
			</table>

			<div class="text-center mb-8">
				<button
					type="submit"
					class="px-8 py-2 border-b-4 border-primary text-primary font-bold text-center text-base uppercase"
				>
					Available Courses
				</button>
			</div>

			<!-- table for course list  -->
			<table
				class="table-auto border-collapse border border-slate-300 mx-auto course-table mb-8"
			>
				<thead>
					<tr class="bg-primary text-white">
						<th>Course Name</th>
						<th>Course code</th>
						<th>Course Teacher</th>
						<th>Register?</th>
					</tr>
				</thead>
				<tbody>
					<% try {
						 String id = String.valueOf(session.getAttribute("id"));
						 Class.forName("com.mysql.jdbc.Driver");
						 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","Arifcse19*");
						 PreparedStatement pst = con.prepareStatement("SELECT c.course_id, c.course_name, c.course_code, c.course_teacher FROM courses AS c LEFT JOIN takes AS t ON c.course_id = t.course_id AND t.student_id = ? WHERE t.student_id IS NULL;");
						 pst.setString(1, id);
						 ResultSet rs = pst.executeQuery();
						 while(rs.next()) { %>
						 
						 <tr class="even:bg-amber-100 odd:bg-blue-100">
							<td><%= rs.getString("course_name") %></td>
							<td><%= rs.getString("course_code") %></td>
							<td><%= rs.getString("course_teacher") %></td>
							<td class="text-primary font-bold cursor-pointer">
								<a href="/courseManagement/registerCourse?course_id=<%=rs.getString("course_id")%>&student_id=<%=id%>">Register</a>
							</td>
						</tr>							 
						 <% }
						 } catch(Exception e) {
								e.printStackTrace();
							}
						 %>
				</tbody>
			</table>
		</section>

		<!-- footer section  -->
		<footer class="bg-primary text-white p-8 text-center text-xl font-medium">
			<p>All &copy; copyright reserve to adu-vai</p>
		</footer>

		<!-- modal code  -->
		<div id="myModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
				<span
					class="close-modal font-bold text-primary text-[35px] block w-max ml-auto text-right cursor-pointer px-5"
					>&times;</span
				>

				<div class="form-content px-[90px]">
					<form action="" method="post">
						<label for="courseName" class="block text-primary"
							>Course Name</label
						>
						<input
							type="text"
							name="courseName"
							id="courseName"
							class="block border-2 border-transparent bg-slate-200 w-full rounded mx-auto px-4 py-2 mb-8 focus:outline-none focus:border-primary"
						/>

						<label for="courseTeacher" class="block text-primary"
							>Course Teacher</label
						>
						<input
							type="text"
							name="courseTeacher"
							id="courseTeacher"
							class="block border-2 border-transparent bg-slate-200 w-full rounded mx-auto px-4 py-2 mb-8 focus:outline-none focus:border-primary"
						/>

						<div class="add-new text-right mx-auto max-w-[700px] pb-10">
							<button
								class="px-8 py-2 bg-primary text-white font-bold rounded text-center"
								id="addCourse"
								type="submit"
							>
								Add
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>