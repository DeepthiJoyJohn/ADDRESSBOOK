<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link rel="stylesheet" type="text/css" href="css/createcontact.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
    </head>
    <body>
        <cfform>
            <div class="title">
                <img src="Images/img.png" class="image"><span> ADDRESSBOOK</span>
                <span class="spancl"><a href="login.cfm"><i class="fa fa-sign-in"></i> Logout</a></span>
            </div>
            <div class="title2">
                <i class="fa fa-file-excel-o" aria-hidden="true"></i>
                <i class="fa fa-file-pdf-o" aria-hidden="true"></i>
                <i class="fa fa-print" aria-hidden="true"></i>
            </div>
            <div class="listingsub">
                <div class="profile">
                    <img class='img-thumbnail' alt='User profile picture' style="min-height:120px; max-height:120px;" 
                    src='Images/dummy.jpg' >
                    <span class="username"><cfoutput>#session.username#</cfoutput></span><br>
                    <cfinput class="button" type="button" name="mybutton3" value="Create Contact"  
                    onclick="javascript:ColdFusion.Window.show('mywindow2')"> 
                </div>
               
                <div class="listing scroll">
                	<div class="divdisplay">Contact ID</div>
                	<div class="divdisplay">Name</div>
                	<div class="divdisplay">EmailID</div> 
                	<div class="divdisplay">Phone No</div>
                	<div class="divdisplay">Action</div><br><br>
                     <cfscript>
						ORMReload();
						contactdetails = EntityLoad('contactdetails');
						n=arraylen(contactdetails);
						
					</cfscript>
					<cfloop index="i" from="1" to="#n#">
						<cfimage action="read" source="#contactdetails[i].getphoto()#" name="myImage">
		    			<cfset ImageScaleToFit(myImage,20,20,"bilinear")>
						<cfoutput>
					    <div class="divdisplay"><cfimage source="#myImage#" action="writeToBrowser"></div>
						<div class="divdisplay">#contactdetails[i].getfirstname()#</div>
						<div class="divdisplay">#contactdetails[i].getemail()#</div>
						<div class="divdisplay">#contactdetails[i].getphone()#</div>
						<div class="divdisplay"><i class="fa fa-edit" aria-hidden="true"></i>
							&nbsp;&nbsp;<a href="Components/addressbook.cfc?method=delete&id=#contactdetails[i].getid()#">
							<i class="fa fa-trash" aria-hidden="true"></i></a>&nbsp;&nbsp;
							<i class="fa fa-eye" aria-hidden="true"></i>
						</div><br><br>
						</cfoutput>
					</cfloop> 
                </div>                 
            </div>
        </cfform>
        <cfwindow x="350" y="100" width="750" height="500" name="mywindow2" title="CREATE CONTACT"  
        draggable="false" resizable="false" source="createcontact.cfm" />
    </body>
    
    
</html>
