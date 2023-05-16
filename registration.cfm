<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="utf-8">
	    <meta content="width=device-width, initial-scale=1.0" name="viewport">
	    <title>ADDRESSBOOK</title>
	    <meta content="" name="description">
	    <meta content="" name="keywords">
	    <!-- Favicons -->
	    <link href="assets/img/favicon.png" rel="icon">
	    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	    <!-- Google Fonts -->
	    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	    <!-- Vendor CSS Files -->
	    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
	    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="css/registration.css">
	    	
	    <!-- Template Main CSS File -->
	    <link href="assets/css/style.css" rel="stylesheet">
	    <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
		<script src="assets/vendor/aos/aos.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
		<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
		<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
		<script src="assets/vendor/typed.js/typed.min.js"></script>
		<script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
		<script src="assets/vendor/php-email-form/validate.js"></script>
		<script src="js/registration.js" type="text/javascript"></script>
		<!-- Template Main JS File -->
		<script src="assets/js/main.js"></script>	
	</head>
	<body>		
		<i class="bi bi-list mobile-nav-toggle d-xl-none"></i>
		<!-- ======= Header ======= -->
		<header id="header">
			<div class="d-flex flex-column">
		    	<div class="profile">        
		        	<h1 class="text-light"><a href="index.html">Address Book</a></h1>        
		      	</div>
		      	<nav id="navbar" class="nav-menu navbar">
			        <ul>			        	
			          	<li><a href="login.cfm" class="nav-link scrollto"><i class="bx bx-log-in"></i> <span>LogIn</span></a></li>
			          	<li><a href="index.cfm" class="nav-link scrollto"><i class="bx bx-log-out"></i> <span>Logout</span></a></li>		          
			        </ul>
		        </nav>		      	
		    </div>
		 </header>
	  	 <!-- End Header -->
		 <!-- ======= Hero Section ======= -->
		  <section  class="d-flex flex-column justify-content-center align-items-center">
		  	<cfform id="form" name="form" method="post" action="">
				<div class="container h-100">
			    	<div class="row d-flex justify-content-center align-items-center h-100">
			      		<div class="col-lg-12 col-xl-11">
			        		<div class="card text-black" style="border-radius: 25px;">
			          			<div>
			            			<div class="row justify-content-center">			            
			              				<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
			               					<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>			                
			                  				<div class="d-flex flex-row align-items-center mb-4">
			                    				<i class="fas fa-user fa-lg me-3 fa-fw"></i>
		                    					<div class="form-outline flex-fill mb-0">
							                    	<input type="text" name="username" id="form3Example1c" class="form-control" required="yes"/>
							                        <label class="form-label" for="form3Example1c">User Name</label>
		                    					</div>
			                  				</div>
			                  				<div class="d-flex flex-row align-items-center mb-4">
			                    				<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
								                    <div class="form-outline flex-fill mb-0">
								                      <input type="email" name="emailname" id="emailname" class="form-control" required="yes"/>
								                      <label class="form-label" for="form3Example3c">Your Email</label>
								                    </div>
			                  				</div>
			                  				<div class="d-flex flex-row align-items-center mb-4">
			                    				<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
								                    <div class="form-outline flex-fill mb-0">
								                      <input type="password" id="password1" onkeyup="javascript:validate()" name="password1" class="form-control" required="yes"/>
								                      <label class="form-label" for="form3Example4c">Password</label>
								                    </div>
			                  				</div>
			                  				<div class="d-flex flex-row align-items-center mb-4">
			                    				<i class="fas fa-key fa-lg me-3 fa-fw"></i>
								                    <div class="form-outline flex-fill mb-0">
								                      <input type="password" id="password2" onkeyup="javascript:validate()" name="password2" class="form-control" required="yes"/>
								                      <label class="form-label" for="form3Example4cd">Repeat your password</label>
								                    </div>
			                  				</div>
			                  				<span id="message"></span>
							                <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
							                	
							                	<input type="Submit" name="register"  class="btn btn-primary btn-lg" value="Register">
							                 </div>			                
							                 <cfif isDefined("Form.register")>
								                  <cfinvoke component="ADDRESSBOOK.Components.addressbook" method="signup" 
								                  form="#form#" returnVariable="res">
								                  <cfoutput>#res#</cfoutput>     	
							                 </cfif>
			              				</div>
							            <div class="w-25 p-3">
							                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
							                  class="img-fluid" alt="Sample image">
							            </div>
			            			</div>
			          			</div>
			       	 		</div>
			      		</div>
			    	</div>
			  	</div>			
			</cfform>		    
		</section>
	<!-- End Hero -->
	</body>
</html>