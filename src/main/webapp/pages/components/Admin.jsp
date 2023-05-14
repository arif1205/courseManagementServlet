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
					Current Courses
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
					</tr>
				</thead>
				<tbody>
				<% try {
						 Class.forName("com.mysql.jdbc.Driver");
						 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","Arifcse19*");
						 PreparedStatement pst = con.prepareStatement("select * from courses;");
						 
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

			<div class="add-new text-right mx-auto max-w-[700px]">
				<button
					class="px-8 py-2 bg-primary text-white font-bold rounded text-center"
					id="addCourse"
				>
					Add Course
				</button>
			</div>
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
					<form action="create-course" method="post">
						<label for="courseName" class="block text-primary"
							>Course Name</label
						>
						<input
							type="text"
							name="courseName"
							id="courseName"
							class="block border-2 border-transparent bg-slate-200 w-full rounded mx-auto px-4 py-2 mb-8 focus:outline-none focus:border-primary"
						/>
						
						<label for="courseName" class="block text-primary"
							>Course Code</label
						>
						<input
							type="text"
							name="courseCode"
							id="courseCode"
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