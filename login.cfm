<!DOCTYPE html>
<html lang="en">
	<head>	    
		<title>ADDRESSBOOK</title>
	    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	    <link href="assets/css/style.css" rel="stylesheet">	
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
			          	<li><a href="index.cfm" class="nav-link scrollto"><i class="bx bx-log-out"></i> <span>Home</span></a></li>		          
			        </ul>
		        </nav>		      	
		    </div>
		</header>	  	 
		<section  class="d-flex flex-column justify-content-center align-items-center">
		  	<cfform id="form" name="form" method="post" action="">
				<div class="container h-100 bodyclass">
			    	<div class="row d-flex justify-content-center align-items-center h-100">
			      		<div class="col-lg-12 col-xl-11">
			        		<div class="card text-black" style="border-radius: 25px;">
			          			<div>
			            			<div class="row justify-content-center">			            
			              				<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
			               					<p class="text-center h5 fw-bold mb-5 mx-1 mx-md-4 mt-4">Log In</p>			                
			                  				<div class="d-flex flex-row align-items-center mb-4">
			                    				<i class="fas fa-user fa-lg me-3 fa-fw"></i>
		                    					<div class="form-outline flex-fill mb-0">
							                    	<input type="text" id="Uname" name="Uname" maxlength="15" class="form-control" required="yes"/>
							                        <label class="form-label" for="form3Example1c">User Name</label>
		                    					</div>
			                  				</div>			                  				
			                  				<div class="d-flex flex-row align-items-center mb-4">
			                    				<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
												<div class="form-outline flex-fill mb-0">
													<input type="password" id="Pass" name="Pass" maxlength="15" class="form-control" required="yes"/>
													<label class="form-label" for="form3Example4c">Password</label>
												</div>
			                  				</div>
			                  				<span id="message"></span>
							                <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">							                	
							                	<input type="Submit" type="Submit" onclick="javascript:passwordnullcheck()"name="log" id="log"  class="btn btn-primary btn-lg" value="Log In">
							                 </div>			                
							                 <cfif isDefined("form.log") AND #form.Pass# NEQ "">
							                 	<cfif #form.Pass# NEQ "" && #form.Uname# NEQ "">
									                <cfinvoke component="ADDRESSBOOK.Components.addressbook" method="login" 
											        Uname="#form.Uname#" Pass="#form.Pass#" returnVariable="res">
									                <cfif res GTE 1 >
														<cflock TYPE="EXCLUSIVE" timeout = "60" SCOPE="SESSION">
															<cfset session.username=#form.Uname#>
															<cfset session.userid=#res#>
														</cflock>
									                    <cflocation url="listing.cfm" addtoken="no">
									                <cfelse>
									                    <cfoutput>Wrong Credentials!!</cfoutput>
									                </cfif> 
									           <cfelse>
									           		<cfoutput>FILL USERNAME AND PASSWORD</cfoutput>
									           </cfif>
								            </cfif>
			              				</div>
							            <div class="w-50 p-3">
							                <img src="assets/img/d.jpg"
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