<!DOCTYPE html>
<html lang="en">
	<head>
	    
	    <title>ADDRESSBOOK</title>
	    
	    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">	    
	    <link rel="stylesheet" type="text/css" href="css/registration.css">
	    	
	    <!-- Template Main CSS File -->
	    <link href="assets/css/style.css" rel="stylesheet">	    
		<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>		
		<script src="assets/vendor/php-email-form/validate.js"></script>
		<script src="js/registration.js" type="text/javascript"></script>
		<!-- Template Main JS File -->
		<script src="assets/js/main.js"></script>	
	</head>
	<body>	
				
		 <!-- ======= Hero Section ======= -->
	<section  class="d-flex flex-column justify-content-center align-items-center">			  
       <cfset url.id = #decodeFromUrl(url.id)#>
	   <cfif #url.id# neq 0 AND #url.id# neq "">
	   <cfset contactdetails = EntityNew("contactdetails")>
	   <cfset contactdetails = EntityLoad('contactdetails', {id=#url.id#}, true)>
	   <cfset id=contactdetails.getid()>
	   <cfset title=contactdetails.gettitle()>
	   <cfset firstname=contactdetails.getfirstname()>
	   <cfset lastname=contactdetails.getlastname()>
	   <cfset gender=contactdetails.getgender()>
	   <cfset dob=contactdetails.getdob()>
	   <cfset photo=contactdetails.getphoto()>
	   <cfset address=contactdetails.getaddress()>
	   <cfset street=contactdetails.getstreet()>
	   <cfset email=contactdetails.getemail()>
	   <cfset phone=contactdetails.getphone()>	 
	   <cfset phone=contactdetails.getphone()>
	   <cfset displayedit="block">	
	   <cfset displaynew="none">
    <cfelse>
       <cfset id=0>
	   <cfset title="Mr">
	   <cfset firstname="">
	   <cfset lastname="">
	   <cfset gender="Male">
	   <cfset dob="">
	   <cfset photo="">
	   <cfset address="">
	   <cfset street="">
	   <cfset email="">
	   <cfset phone="">
	   <cfset displayedit="none">	
	   <cfset displaynew="block">
   </cfif>
   <cfif #url.view# eq "true">
       <cfset displayedit="none">	
	   <cfset displaynew="none">
   </cfif>
    <form id="form" name="form" method="post" action="createcontact.cfm?view=false&id=".url.id enctype="multipart/form-data">
	    <input class="buttonclose"name="button" value="Close" onclick="javascript:init('mywindow')" type="button"/><br>
        <div class="profile">        
		        	<h5 class="text-light"><a href="index.html">Personal Details</a></h5>        
		</div>        
        <div class='container'>
            <table class="table">
                <tr>
                    <td><label class="form-label">Title</label>
                        <select class="form-select-sm"  name="title" id="title" required="yes">
                            <option value="Mr">Mr</option>
                            <option value="Ms">Ms</option>
                            <option value="Mrs">Mrs</option>
                            <option value="Dr">Dr</option>
                        </select>
                    </td>
					<td><label class="form-label">First Name</label>
                        <input type="text" class="form-control-sm" name="firstname" maxlength="25" id="firstname" required="yes" value="<cfoutput>#firstname#</cfoutput>">
                    </td>
					 <td><label class="form-label">Last Name</label><br>
                         <input type="text" class="form-control-sm" name="lastname" maxlength="25" required="yes" value="<cfoutput>#lastname#</cfoutput>">
                    </td> 
                </tr>
                <tr>
					<td><label class="form-label">Gender</label>
                        <select class="form-select-sm" name="gender" id="gender" required="yes">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </td>
                    <td><label class="form-label">DOB</label><br>
                        <input class="form-control-sm" type="date" id="dob" name="dob" required="yes" value="<cfoutput>#dob#</cfoutput>">
                    </td>
                    
                    <td><label class="form-label">Upload Photo</label>
                        <input class="form-control-sm" type="file" name="photo" id="photo" value="<cfoutput>#photo#</cfoutput>">
						<label class="form-label"><cfoutput>#photo#</cfoutput></label>
					</td>                    
                </tr>
        </table>
        </div>
        <div class="profile">        
		        	<h5 class="text-light"><a href="index.html">Contact Details</a></h5>        
		</div>
            <div class="container">
                <table>
                    <tr>
                        <td colspan="4"><label class="form-label">Address</label>
                            <textarea required="yes" class="form-control" id="address" name="address"><cfoutput>#address#</cfoutput></textarea>
                        </td>
                    </tr>
                    <tr>
                         <td><label class="form-label">Street   </label><br>
                           <input type="text" class="form-control-sm" id="street" name="street" required="yes" value="<cfoutput>#street#</cfoutput>">
                        </td>
                        <td><label class="form-label">Email   </label><br>
                           <input type="email" class="form-control-sm" id="email" name="email" required="yes" value="<cfoutput>#email#</cfoutput>">
                        </td>
                        <td><label class="form-label">Phone   </label><br>
                            <input type="text" class="form-control-sm" onkeyup="javascript:testbox(this.value)" id="phone" name="phone" required="yes" value="<cfoutput>#phone#</cfoutput>">
                           	<input type="hidden" id="id" name="id" value="<cfoutput>#id#</cfoutput>">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4"><br>
                        	<input type="Submit" style="display:<cfoutput>#displaynew#</cfoutput>;" name="Submit" class="button" value="Create Contact">
                        	<input type="Submit" style="display:<cfoutput>#displayedit#</cfoutput>;" name="Update" class="button" value="Update Contact">
                        </td>
                    </tr>
                </table>                
            </div>
	</form>
    <cfif isDefined("form.Submit")>
            <cfinvoke component="ADDRESSBOOK.Components.addressbook" method="createcontact" 
	        form="#form#">
            <cflocation url="listing.cfm?view=false" addtoken="no">
    </cfif>
    <cfif isDefined("form.Update")>
            <cfinvoke component="ADDRESSBOOK.Components.addressbook" method="updatecontact" 
	        form="#form#">
            <cflocation url="listing.cfm" addtoken="no">
    </cfif>	    
		</section>
	<!-- End Hero -->
	</body>
</html>