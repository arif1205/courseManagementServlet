<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Login</title>
		<!-- css animator -->
		<link
			rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
		/>
		<!-- tailwind with config  -->
		<script src="https://cdn.tailwindcss.com"></script>
		<script>
			tailwind.config = {
				theme: {
					extend: {
						colors: {
							primary: "#6339dc",
						},
					},
				},
			};
		</script>
		<!-- custom css  -->
		<link rel="stylesheet" href="./assets/styles/style.css" />
	</head>
	<body>
		<!-- banner  -->
		<header>
			<!-- nav bar  -->
			<nav
				class="w-full bg-white px-[70px] py-[15px] flex justify-between items-center shadow-md"
			>
				<!-- left side  -->
				<div class="left-nav logo cursor-pointer">
					<a href="index.html">
						<p class="text-primary text-[32px]">
							<span class="text-white bg-primary px-2">Adu-vai</span>
							Programming course
						</p>
					</a>
				</div>
			</nav>
		</header>

		<!-- content section  -->
		<section
			id="content"
			class="min-h-[90vh] bg-slate-200 py-[90px] px-[200px]"
		>
			<div
				class="shadow-lg flex rounded-tl-[150px] rounded-br-[150px] overflow-hidden"
			>
				<div class="left-img grow basis-[50%] bg-primary px-7 py-16">
					<img
						src="./assets/images/aGirlInFrontOfComputer.png"
						alt="a girl in front of computer"
					/>
				</div>
				<div class="content grow basis-[50%] bg-white px-12 py-9">
					<div
						class="content-header text-center bg-primary text-white rounded-tl-[80px] rounded-br-[80px] text-[28px] font-bold px-6 py-5 mb-16"
					>
						<h1>
							Welcome to <br />
							Adu-vai programming course
						</h1>
					</div>
					<div class="content-content">
						<h1 class="text-center text-primary font-bold text-xl mb-8">
							Login your account
						</h1>

						<form action="profile" method="post">
							<input
								type="email"
								name="email"
								id="email"
								placeholder="Enter your email"
								class="block border-0 border-b-2 border-gray-400 w-[60%] mx-auto px-1 mb-4 focus:outline-none focus:border-primary"
							/>
							<input
								type="password"
								name="password"
								id="password"
								placeholder="Enter your password"
								class="block border-0 border-b-2 border-gray-400 w-[60%] mx-auto px-1 mb-4 focus:outline-none focus:border-primary"
							/>

							<div class="text-center mt-8">
								<button
									type="submit"
									class="px-8 py-2 bg-primary text-white font-bold rounded text-center"
								>
									Login
								</button>
							</div>
							<div class="text-center mt-8">
								<a href="/courseManagement/signup">
									<p class="text-primary">Or, Create a new account?</p>
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>

		<!-- footer section  -->
		<footer class="bg-primary text-white p-8 text-center text-xl font-medium">
			<p>All &copy; copyright reserve to adu-vai</p>
		</footer>
	</body>
</html>