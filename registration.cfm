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
		  	<form id="form" name="form" method="post" action="">
				<cfset usernamemessage="">	
				<cfset emailmessage="">
				<cfset passwordmessage="">
				<cfset passwordmessage1="">
				<cfset passwordmessage2="">
				<cfset outputmessage="">
				<cfif isDefined("Form.register")>											      
					<cfinvoke component="ADDRESSBOOK.Components.addressbook" method="signup" 
					form="#form#" returnVariable="res">	
					<cfif ArrayContains(res, "usernamemessage")>
						<cfset usernamemessage="Required">
					</cfif>
					<cfif ArrayContains(res, "emailmessage")>
						<cfset emailmessage="Required">
					</cfif>
					<cfif ArrayContains(res, "password1")>
						<cfset passwordmessage1="Required">
					</cfif>
					<cfif ArrayContains(res, "password2")>
						<cfset passwordmessage2="Required">
					</cfif>
					<cfif ArrayContains(res, "passwordmissmatch")>
						<cfset passwordmessage="Password Mismatch">
					</cfif>
					<cfif ArrayContains(res, "Already Exists")>
						<cfset outputmessage="Already Exists">
					</cfif>
					<cfif ArrayContains(res, "Registered Please Login")>
						<cfset outputmessage="Registered Successfully <a href='login.cfm'>Continue</a>">
					</cfif>
				</cfif>
				<cfoutput>
					<div class="container h-100">
						<div class="row d-flex justify-content-center align-items-center h-100">
							<div class="col-lg-12 col-xl-11">
								<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>			                
								<div class="d-flex flex-row align-items-center mb-4">
									<i class="fas fa-user fa-lg me-3 fa-fw"></i>
									<div class="form-outline flex-fill mb-0">
										<input type="text" name="username" maxlength="15" id="username" class="form-control" required="yes"/>
										<label class="form-label" for="form3Example1c">User Name</label>
										<span id="usernamespan">#usernamemessage#</span>
									</div>
								</div>
								<div class="d-flex flex-row align-items-center mb-4">
									<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
									<div class="form-outline flex-fill mb-0">
										<input type="email" name="emailname"  id="emailname" class="form-control" required="yes"/>
										<label class="form-label" for="form3Example3c">Your Email</label>
										<span id="emailspan">#emailmessage#</span>
									</div>
								</div>
								<div class="d-flex flex-row align-items-center mb-4">
									<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
									<div class="form-outline flex-fill mb-0">
										<input type="password" id="password1"  name="password1" class="form-control" required="yes"/>
										<label class="form-label" for="form3Example4c">Password</label>
										<span id="paswordspan">#passwordmessage#</span>
										<span id="paswordspan1">#passwordmessage1#</span>
									</div>
								</div>
								<div class="d-flex flex-row align-items-center mb-4">
									<i class="fas fa-key fa-lg me-3 fa-fw"></i>
									<div class="form-outline flex-fill mb-0">
										<input type="password" id="password2"  name="password2" class="form-control" required="yes"/>
										<label class="form-label" for="form3Example4cd">Repeat your password</label>
										<span id="paswordspan2">#passwordmessage2#</span>
									</div>
								</div>
								<span id="message"></span>
								<span class="messagecolor" id="output">#outputmessage#</span>
								<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">							                	
									<input type="Submit" name="register"  onclick="javascript:registrationnullcheck()" class="btn btn-primary btn-lg" value="Register">
								</div>	
							</div>
						</div>
					</div>		
				</cfoutput>	
			</form>		    
		</section>	
	</body>
</html>