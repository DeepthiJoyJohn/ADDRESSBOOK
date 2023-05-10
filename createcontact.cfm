<html>
    <head>
        <title>Create Contact</title>        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/createcontact.css">
    </head>
    <form id="form" name="form" method="post" action="createcontact.cfm" enctype="multipart/form-data">
            <p class="body1">CREATE CONTACT </p>
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
                            <input type="text" name="firstname" required="yes">
                        </td>
                        <td><label>Last Name</label>
                             <input type="text" name="lastname" required="yes">
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
                            <input type="date" id="dob" name="dob" required="yes">
                        </td>
                        
                        <td><label>Upload Photo</label>
                            <input type="file" name="photo" id="photo">
                        </td>
                    </tr>
            </table>
            </div>
            <label>Contact Details</label>
            <div class="box">
                <table>
                    <tr>
                        <td><label>Address   </label><br>
                            <textarea id="address" name="address"></textarea>
                        </td>
                    </tr>
                    <tr>
                         <td><label>Street   </label><br>
                           <input type="text" id="street" name="street" required="yes">
                        </td>
                        <td><label>Email   </label><br>
                           <input type="text" id="email" name="email" required="yes">
                        </td>
                        <td><label>Phone   </label><br>
                           <input type="text" id="phone" name="phone" required="yes">
                        </td>
                    </tr>
                    <tr>
                        <td><input type="Submit" name="Submit" class="button" value="Create Contact"></td>
                    </tr>
                </table>                
            </div>
        </form>
        <cfif isDefined("form.Submit")>
                <cfinvoke component="ADDRESSBOOK.Components.addressbook" method="createcontact" 
		        form="#form#">
                <cflocation url="listing.cfm">
        </cfif>
</html>