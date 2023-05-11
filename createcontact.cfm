<html>
	<head>
	    <title>Create Contact</title>        
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" type="text/css" href="css/createcontact.css">
	</head>
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
    <form id="form" name="form" method="post" action="createcontact.cfm?id=".url.id enctype="multipart/form-data">
	    <input class="buttonclose"name="button" value="Close" onclick="javascript:init('mywindow')" type="button"/><br>
        <p class="body1">CONTACT DETAILS </p>
        <label>Personal Details</label>
            <div class='box'>
                <table>
                    <tr>
                        <td><label>Title   </label><br>
                            <select name="title" id="title" required="yes">
                                <option value="Mr">Mr</option>
                                <option value="Ms">Ms</option>
                                <option value="Mrs">Mrs</option>novalidation
                                <option value="Dr">Dr</option>
                            </select>
                        </td>
                        <td><label>First Name</label>
                            <input type="text" name="firstname" id="firstname" required="yes" value="<cfoutput>#firstname#</cfoutput>">
                        </td>
                        <td><label>Last Name</label>
                             <input type="text" name="lastname" required="yes" value="<cfoutput>#lastname#</cfoutput>">
                        </td>
                    
                        <td><label>Gender</label>
                            <select name="gender" id="gender" required="yes">
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label>DOB</label>
                            <input type="date" id="dob" name="dob" required="yes" value="<cfoutput>#dob#</cfoutput>">
                        </td>
                        
                        <td><label>Upload Photo</label>
                            <input type="file" name="photo" id="photo" value="<cfoutput>#photo#</cfoutput>">
                                                   </td>
                        <td>
                            <label class="label"><cfoutput>#photo#</cfoutput></label>
                        </td>
                    </tr>
            </table>
            </div>
            <label>Contact Details</label>
            <div class="box">
                <table>
                    <tr>
                        <td class="tdclass"><label>Address   </label><br>
                            <textarea id="address" name="address"><cfoutput>#address#</cfoutput></textarea>
                        </td>
                    </tr>
                    <tr>
                         <td><label>Street   </label><br>
                           <input type="text" id="street" name="street" required="yes" value="<cfoutput>#street#</cfoutput>">
                        </td>
                        <td><label>Email   </label><br>
                           <input type="text" id="email" name="email" required="yes" value="<cfoutput>#email#</cfoutput>">
                        </td>
                        <td><label>Phone   </label><br>
                           <input type="text" id="phone" name="phone" required="yes" value="<cfoutput>#phone#</cfoutput>">
                           	<input type="hidden" id="id" name="id" value="<cfoutput>#id#</cfoutput>">
                        </td>
                    </tr>
                    <tr>
                        <td class="tdclass" colspan="4">
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
            <cflocation url="listing.cfm">
    </cfif>
    <cfif isDefined("form.Update")>
            <cfinvoke component="ADDRESSBOOK.Components.addressbook" method="updatecontact" 
	        form="#form#">
            <cflocation url="listing.cfm">
    </cfif>
</html>