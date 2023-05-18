<!DOCTYPE html>
<html lang="en">
	<head>
	    
	    <title>ADDRESSBOOK</title>
	    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/createcontact.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
	    <!-- Template Main CSS File -->
	    <link href="assets/css/style.css" rel="stylesheet">	    		
		<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="assets/vendor/php-email-form/validate.js"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>	
		<script src="js/registration.js" type="text/javascript"></script>
		<script src="js/listing.js" type="text/javascript"></script>
		<script src="js/excel.js" type="text/javascript"></script>
		<!-- Template Main JS File -->
		<script src="assets/js/main.js"></script>	
	</head>
	<body>		
		<i class="bi bi-list mobile-nav-toggle d-xl-none"></i>
		<!-- ======= Header ======= -->
		<header id="header">
					
>			<div class="d-flex flex-column">
		    	<div class="profile">        
		        	<h1 class="text-light"><a href="index.html">Address Book</a></h1>  
		        	<img src="assets/img/profile-img.jpg" alt="" class="img-fluid rounded-circle"> 
		        	<span class="username"><cfoutput>#session.username#</cfoutput></span><br>
		        	<button type="button" class="button" onclick="javascript:ColdFusion.Window.create('mywindow', 'Create Contact',
								'createcontact.cfm?view=false&id=0',{x:320,y:60,height:600,width:950,modal:false,closable:false,draggable:true,
								resizable:true,center:true,initshow:true,
								minheight:200,minwidth:200,refreshOnShow:true})">Create Contact
                    </button>	     
		      	</div>
		      	<nav id="navbar" class="nav-menu navbar">
			        <ul>
			          	<li><a href="index.cfm" class="nav-link scrollto"><i class="bx bx-log-out"></i> <span>Logout</span></a></li>		          
			        </ul>
		        </nav>		      	
		    </div>
		 </header>
	  	 <!-- End Header -->
		 <!-- ======= Hero Section ======= -->
		  <section  class="d-flex flex-column justify-content-center align-items-center">
		  	<cfform name="form" id="form" action="" method="post">  
	            <div class="title2">
	                <button type="button" onclick="javascript:generateexcel();" class="printbutton"><i class="fa fa-file-excel-o" aria-hidden="true"></i></button>
	                <button type="submit" name="pdfbtn" class="printbutton"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></button>
	                <button type="submit" name="pdfbtn" class="printbutton"><i class="fa fa-print" aria-hidden="true"></i></button>                
	            </div>
            <div class="listingsub">                              
	            <cfsavecontent variable="strContent"> 
	                <div class="listing scroll" id="myContent">
	                	<table class="table">
	                		<tr>
			                	<td class="head">Contact</td>
			                	<td class="head">Name</td>
			                	<td class="head">EmailID</td> 
			                	<td class="head">Phone No</td>
			                	<td class="head">Action</td><br><br>
	                		</tr>
		                <cfscript>
							ORMReload();
							contactdetails = EntityLoad('contactdetails',{createdby="#session.userid#"});
							n=arraylen(contactdetails);						
						</cfscript>
						<cfloop index="i" from="1" to="#n#">
							<cfif #contactdetails[i].getphoto()# NEQ "">
								<cfimage action="read" source="#contactdetails[i].getphoto()#" name="myImage">
							<cfelse>
								<cfimage action="read" source="assets/img/profile-img.jpg" name="myImage">							
							</cfif>
			    			<cfset ImageScaleToFit(myImage,20,20,"bilinear")>		    			
							<cfoutput>								
									<tr>
									    <td class="tail"><cfimage source="#myImage#" action="writeToBrowser"></td>
										<td class="tail">#contactdetails[i].getfirstname()#</td>
										<td class="tail">#contactdetails[i].getemail()#</td>
										<td class="tail">#contactdetails[i].getphone()#</td>				
										<td class="tail">
				                    		<button type="button" class="editbutton" onclick="javascript:ColdFusion.Window.create('mywindow', 'EDIT CONTACT',
												'createcontact.cfm?view=&id=#contactdetails[i].getid()#',{x:320,y:60,height:600,width:950,modal:false,closable:false,draggable:true,resizable:true,center:true,initshow:true,
												minheight:200,minwidth:200,refreshOnShow:true})">
				                    			<i class="fa fa-edit" aria-hidden="true"></i>
				                    		</button>
											&nbsp;&nbsp;
											<a href="Components/addressbook.cfc?method=delete&id=#contactdetails[i].getid()#">
												<i class="fa fa-trash" aria-hidden="true"></i>
											</a>&nbsp;&nbsp;
											<button type="button" class="editbutton" onclick="javascript:ColdFusion.Window.create('mywindow', 'VIEW CONTACT',
												'createcontact.cfm?view=true&id=#contactdetails[i].getid()#',{x:320,y:60,height:600,width:950,modal:false,closable:false,draggable:true,resizable:true,center:true,initshow:true,
												minheight:200,minwidth:200,refreshOnShow:true})">
												<i class="fa fa-eye" aria-hidden="true"></i>
											</button>
										<td>
									</tr>
									
							</cfoutput>							
						</cfloop> 
						</table><br><br>					
	                </div>
	             </cfsavecontent>
                 <cfoutput >
	               	#strContent#
	             </cfoutput>
	             <cfif isDefined("form.pdfbtn")>
				 	<cfdocument format="pdf" >
		             	<cfoutput>
		               		#strContent#
		             	</cfoutput>	             	
	             	</cfdocument>   	
			    </cfif>
            </div>
        </cfform>
        <cfwindow x="350" y="100" width="750" height="500" name="mywindow2" source="createcontact.cfm?id=0"   
        draggable="false" resizable="false" /> 
		</section>
	<!-- End Hero -->
	</body>
</html>