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
					My Courses
				</button>
			</div>

			<!-- course list -->
			<div class="course-list">
				<ul class="flex flex-col gap-5" id="courseList">
					<% try {
						 String name = String.valueOf(session.getAttribute("name"));
						 Class.forName("com.mysql.jdbc.Driver");
						 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","Arifcse19*");
						 PreparedStatement pst = con.prepareStatement("SELECT * from courses where course_teacher = ?");
						 pst.setString(1, name);
						 ResultSet rs = pst.executeQuery();
						 while(rs.next()) { %>
							 <div class="flex flex-col gap-4">
							 	<li
									class="course_item text-primary bg-white rounded shadow-md max-w-[400px] w-[350px] px-5 py-4 font-medium text-center text-base cursor-pointer mx-auto self-start"
								>
									<%= rs.getString("course_name") %>
								</li>
								<div class="student-list h-[0px] transition-all duration-[600ms] overflow-y-scroll scrollbar-hidden">
									<table
										class=" min-w-[400px] text-center table-auto border-collapse border border-slate-300 mx-auto course-table mb-8"
									>
										<thead>
											<tr class="bg-primary text-white">
												<th class="text-center relative">
												<span>Name</span>
												<span class="invisible_student_list cursor-pointer absolute right-2 top-1/2 -translate-y-[50%] font-bold text-white text-[30px] block w-max ml-auto text-right cursor-pointer px-5"
												>&times;</span> 
												</th>
											</tr>
										</thead>
										<tbody>
										<% try {
											 String course_id = rs.getString("course_id");
											 Class.forName("com.mysql.jdbc.Driver");
											 Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","Arifcse19*");
											 PreparedStatement pst1 = con1.prepareStatement("SELECT u.* FROM users AS u JOIN takes AS t ON u.id = t.student_id WHERE t.course_id = ?;");
											 pst1.setString(1, course_id);
											 ResultSet rs1 = pst1.executeQuery();
											 while(rs1.next()) { %>
												<tr class="even:bg-amber-100 odd:bg-blue-100">
													<td><%= rs1.getString("name") %></td>
												</tr>
											<% }
											 } catch(Exception e1) {
													e1.printStackTrace();
												}
											 %>
										</tbody>
									</table>
								</div>
							</div>
						
						 							 
						 <% }
						 } catch(Exception e) {
								e.printStackTrace();
							}
						 %>
				</ul>
			</div>
		</section>

		<!-- footer section  -->
		<footer class="bg-primary text-white p-8 text-center text-xl font-medium">
			<p>All &copy; copyright reserve to adu-vai</p>
		</footer>

		<!-- modal code  -->
		<div id="showStudentModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
				<span
					class="close-showStudentModal font-bold text-primary text-[35px] block w-max ml-auto text-right cursor-pointer px-5"
					>&times;</span
				>

				<div class="student-list">
					<table
						class="min-w-[400px] text-center table-auto border-collapse border border-slate-300 mx-auto course-table mb-8"
					>
						<thead>
							<tr class="bg-primary text-white">
								<th class="text-center">Name</th>
							</tr>
						</thead>
						<tbody>
							<tr class="even:bg-amber-100 odd:bg-blue-100">
								<td>Md. Ariful Islam</td>
							</tr>
							<tr class="even:bg-amber-100 odd:bg-blue-100">
								<td>Majedul Islam</td>
							</tr>
							<tr class="even:bg-amber-100 odd:bg-blue-100">
								<td>Sourov Kumar Das</td>
							</tr>
							<tr class="even:bg-amber-100 odd:bg-blue-100">
								<td>Rahat Sarkar Rony</td>
							</tr>
							<tr class="even:bg-amber-100 odd:bg-blue-100">
								<td>Shahrear Jahan</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		