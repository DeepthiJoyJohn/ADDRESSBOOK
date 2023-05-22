<!DOCTYPE html>
<html lang="en">
	<head>	    
		<title>ADDRESSBOOK</title>	    
	    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">	    
	    <link rel="stylesheet" type="text/css" href="css/registration.css">	
	    <link href="assets/css/style.css" rel="stylesheet">	    
		<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>		
		<script src="assets/vendor/php-email-form/validate.js"></script>
		<script src="js/registration.js" type="text/javascript"></script>
	</head>
	<body>
		<header id="header">			
			<div class="d-flex flex-column">
		    	<div class="profile">        
		        	<h6 class="text-light">Address Book</h6>        
		      	</div>
		      	<nav id="navbar" class="nav-menu navbar">
			        <ul>			        	
			          	<li><a href="login.cfm" class="nav-link scrollto"><i class="bx bx-log-in"></i> <span>LogIn</span></a></li>			          	
			        </ul>
		        </nav>		      	
		    </div>
		</header>	  	 
		<section  class="d-flex flex-column justify-content-center align-items-center">
		  	<cfform id="form" name="form" method="post" action="">
				<cfif isDefined("Form.register")>											      
					<cfinvoke component="ADDRESSBOOK.Components.addressbook" method="signup" 
					form="#form#" returnVariable="res">	
					<cfset usernamemessage=#res.usernamespan#>	
					<cfset emailmessage=#res.emailspan#>
					<cfset passwordmessage=#res.passwordspan#>
					<cfset outputmessage=#res.outputspan#>
				<cfelse>
					<cfset usernamemessage="">	
					<cfset emailmessage="">
					<cfset passwordmessage="">
					<cfset outputmessage="">
				</cfif>
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
							                    	<input type="text" name="username" maxlength="15" id="form3Example1c" class="form-control" required="yes"/>
							                        <label class="form-label" for="form3Example1c">User Name</label>
													<span class="messagecolor" id="usernamespan"><cfoutput>#usernamemessage#</cfoutput></span>
		                    					</div>
			                  				</div>
			                  				<div class="d-flex flex-row align-items-center mb-4">
			                    				<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
												<div class="form-outline flex-fill mb-0">
													<cfinput type="email" name="emailname"  id="emailname" class="form-control" required="yes"/>
													<label class="form-label" for="form3Example3c">Your Email</label>
													<span class="messagecolor" id="emailspan"><cfoutput>#emailmessage#</cfoutput></span>
												</div>
			                  				</div>
			                  				<div class="d-flex flex-row align-items-center mb-4">
			                    				<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
												<div class="form-outline flex-fill mb-0">
													<input type="password" id="password1"  name="password1" class="form-control" required="yes"/>
													<label class="form-label" for="form3Example4c">Password</label>
													<span class="messagecolor" id="paswordspan"><cfoutput>#passwordmessage#</cfoutput></span>
												</div>
			                  				</div>
			                  				<div class="d-flex flex-row align-items-center mb-4">
			                    				<i class="fas fa-key fa-lg me-3 fa-fw"></i>
												<div class="form-outline flex-fill mb-0">
													<input type="password" id="password2"  name="password2" class="form-control" required="yes"/>
													<label class="form-label" for="form3Example4cd">Repeat your password</label>
												</div>
			                  				</div>
			                  				<span id="message"></span>
											<span class="messagecolor" id="output"><cfoutput>#outputmessage#</cfoutput></span>

							                <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">							                	
							                	<input type="Submit" name="register"  class="btn btn-primary btn-lg" value="Register">
							                </div>			                
							                
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
	</body>
</html>