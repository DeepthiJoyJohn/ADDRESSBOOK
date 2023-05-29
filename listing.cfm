<!DOCTYPE html>
<cfif #session.userid# eq "">
	<cflocation url="login.cfm">
</cfif>
<html lang="en">
	<head>	    
	    <title>ADDRESSBOOK</title>
	    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/createcontact.css">
	    <link href="assets/css/style.css" rel="stylesheet">		
		<link rel="stylesheet" type="text/css" href="css/all.css">
		<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="assets/vendor/php-email-form/validate.js"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>	
		<script src="js/registration.js" type="text/javascript"></script>
		<script src="js/listing.js" type="text/javascript"></script>		
	</head>
	<body>
		<cfoutput>
			<cfset session.key = generateSecretKey("AES") />
			<header id="header">
				<div class="d-flex flex-column">
					<div class="profile">        
						<h6 class="text-light">Address Book</h6>  
						<img src="assets/img/profile-img.jpg" alt="" class="img-fluid rounded-circle"> 
						<span class="username">#session.username#</span><br>		        	
						<button type="button" class="button" onclick="window.open('createcontact.cfm?view=false&id=0',
						'popUpWindow','height=600,width=950');"  >Create Contact</button>															     
					</div>		      			      	
				</div>
			</header>	  	
			<section  class="d-flex flex-column justify-content-center align-items-center">
				<form name="form" id="form" action="" method="post">  
					<div class="title2">
						<button type="submit" name="logout" class="logout"><i class="bx bx-log-out" aria-hidden="true"></i> Logout</button>                		                         
						<button type="submit" title="EXCEL" name="exlbtn" class="printbutton"><i class="fa fa-file-excel" aria-hidden="true"></i></button>
						<button type="submit" title="PDF" name="pdfbtn" value="attachment" class="printbutton"><i class="fa fa-file-pdf" aria-hidden="true"></i></button>
						<button type="submit" title="PRINT" name="pdfbtn" value="inline" class="printbutton"><i class="fa fa-print" aria-hidden="true"></i></button> 
					</div>
					<div class="listingsub">   
						<div class="listing scroll" id="myContent">
							<table class="table">
								<tr>
									<td class="head">Contact</td>
									<td class="head">Name</td>
									<td class="head">EmailID</td> 
									<td class="head">Phone No</td>
									<td class="headlong">Action</td><br><br>
								</tr>
							<cfscript>
								ORMReload();
								contactdetails = EntityLoad('contactdetails',{createdby="#session.userid#",flag="ACTIVE"});
								noofentries=arraylen(contactdetails);						
							</cfscript>
							<cfloop index="i" from="1" to="#noofentries#">
								<cfif contactdetails[i].getphoto() NEQ "">
									<cfimage action="read" source="#contactdetails[i].getphoto()#" name="myImage">
								<cfelse>
									<cfimage action="read" source="assets/img/profile-img.jpg" name="myImage">							
								</cfif>
								<cfset ImageScaleToFit(myImage,20,20,"bilinear")>
								<tr>
									<td class="tail"><cfimage source="#myImage#" action="writeToBrowser"></td>
									<td class="tail">#contactdetails[i].getfirstname()#</td>
									<td class="tail">#contactdetails[i].getemail()#</td>
									<td class="tail">#contactdetails[i].getphone()#</td>				
									<td class="taillong">										
										<cfset encryptedid = Encrypt(#contactdetails[i].getid()#, session.key, "AES", "HEX") /> 
										<button type="button" class="editbutton" title="EDIT" onclick="window.open('createcontact.cfm?view=&id=#encryptedid#',
										'popUpWindow','height=600,width=950');"  ><i class="fa fa-edit" aria-hidden="true"></i></button>
										<a title="DETELE" href="Components/addressbook.cfc?method=delete&id=#contactdetails[i].getid()#">
											<i class="fa fa-trash" aria-hidden="true"></i>
										</a>										
										<button type="button" title="VIEW" class="editbutton" onclick="window.open('createcontact.cfm?view=true&id=#encryptedid#',
										'popUpWindow','height=600,width=950');"  ><i class="fa fa-eye" aria-hidden="true"></i></button>										
									<td>
								</tr>				
							</cfloop> 
							</table><br><br>					
						</div>					
						<cfif isDefined("form.pdfbtn") OR isDefined("form.exlbtn")>
							<cfinvoke component="ADDRESSBOOK.Components.addressbook" method="selectcontacts" 
								returnVariable="res">
							<cfif isDefined("form.pdfbtn")>									
								<cfheader name="Content-Disposition" value="#form.pdfbtn#; filename=mydoc.pdf">
								<cfcontent type="application/pdf">
								<cfdocument format="PDF">
									<table>
										<tr>
											<td style="width:120px;text-align:center;border:1px solid"><b>SL:No</b></td>
											<td style="width:200px;text-align:left;border:1px solid"><b>Name</b></td>
											<td style="width:200px;text-align:left;border:1px solid"><b>Email</b></td>
											<td style="width:150px;text-align:left;border:1px solid"><b>Phone</b></td>
										</tr>					
										<cfset slno=1>
										<cfloop query="res">
											<tr>
												<td style="width:120px;text-align:center;border:1px solid">#slno#</td>
												<td style="width:200px;text-align:left;border:1px solid">#res.firstname#</td>
												<td style="width:200px;text-align:left;border:1px solid">#res.email#</td>
												<td style="width:150px;text-align:left;border:1px solid">#res.phone#</td>
											</tr>
											<cfset slno=slno+1>
										</cfloop>
									</table>
							</cfdocument>								
							<cfelse>									
								<cfheader name="Content-Disposition" value="attachment; filename=contacts.xls">
    							<cfcontent type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
								<table>
									<tr>
										<td style="width:120px;text-align:center;border:1px solid"><b>SL:No</b></td>
										<td style="width:200px;text-align:left;border:1px solid"><b>Name</b></td>
										<td style="width:200px;text-align:left;border:1px solid"><b>Email</b></td>
										<td style="width:150px;text-align:left;border:1px solid"><b>Phone</b></td>
									</tr>					
									<cfset slno=1>
									<cfloop query="res">
										<tr>
											<td style="width:120px;text-align:center;border:1px solid">#slno#</td>
											<td style="width:200px;text-align:left;border:1px solid">#res.firstname#</td>
											<td style="width:200px;text-align:left;border:1px solid">#res.email#</td>
											<td style="width:150px;text-align:left;border:1px solid">#res.phone#</td>
										</tr>
										<cfset slno=slno+1>
									</cfloop>
								</table>
							</cfif>	
						</cfif>						
						<cfif isDefined("form.logout")>				    
							<cfset StructClear(session)>
							<cflocation url="login.cfm" addtoken="no"> 	
						</cfif>
					</div>
				</form>
			</section>	
		</cfoutput>
	</body>
</html>