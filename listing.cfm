<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link rel="stylesheet" type="text/css" href="css/createcontact.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>	
		<script src="js/listing.js" type="text/javascript"></script>
		<script src="js/excel.js" type="text/javascript"></script>
    </head>    
    <body>
        <cfform name="form" id="form" action="" method="post">   
        	<cfoutput>
        		#session.userid#
        	</cfoutput>     	
            <div class="title">
                <img src="Images/img.png" class="image"><span> ADDRESSBOOK</span>
                <span class="spancl"><a href="login.cfm"><i class="fa fa-sign-in"></i> Logout</a></span>
            </div>
            <div class="title2">
                <button type="button" onclick="javascript:generateexcel();" class="printbutton"><i class="fa fa-file-excel-o" aria-hidden="true"></i></button>
                <button type="submit" name="pdfbtn" class="printbutton"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></button>
                <button type="submit" name="pdfbtn" class="printbutton"><i class="fa fa-print" aria-hidden="true"></i></button>                
            </div>
            <div class="listingsub">
                <div class="profile">
                    <img class='img-thumbnail' alt='User profile picture' style="min-height:120px; max-height:120px;" 
                    src='Images/dummy.jpg' >
                    <span class="username"><cfoutput>#session.username#</cfoutput></span><br>
                    <button type="button" class="button" onclick="javascript:ColdFusion.Window.create('mywindow', 'Create Contact',
								'createcontact.cfm?view=&id=0',{x:350,y:100,height:500,width:750,modal:false,closable:false,draggable:true,
								resizable:true,center:true,initshow:true,
								minheight:200,minwidth:200,refreshOnShow:true})">Create Contact
                    </button>
                </div>                 
	            <cfsavecontent variable="strContent"> 
	                <div class="listing scroll" id="myContent">
	                	<table>
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
							<cfimage action="read" source="#contactdetails[i].getphoto()#" name="myImage">
			    			<cfset ImageScaleToFit(myImage,20,20,"bilinear")>		    			
							<cfoutput>								
									<tr>
									    <td class="tail"><cfimage source="#myImage#" action="writeToBrowser"></td>
										<td class="tail">#contactdetails[i].getfirstname()#</td>
										<td class="tail">#contactdetails[i].getemail()#</td>
										<td class="tail">#contactdetails[i].getphone()#</td>				
										<td class="tail">
				                    		<button type="button" class="editbutton" onclick="javascript:ColdFusion.Window.create('mywindow', 'EDIT CONTACT',
												'createcontact.cfm?view=&id=#contactdetails[i].getid()#',{x:350,y:100,height:500,width:750,modal:false,closable:false,draggable:true,resizable:true,center:true,initshow:true,
												minheight:200,minwidth:200,refreshOnShow:true})">
				                    			<i class="fa fa-edit" aria-hidden="true"></i>
				                    		</button>
											&nbsp;&nbsp;
											<a href="Components/addressbook.cfc?method=delete&id=#contactdetails[i].getid()#">
												<i class="fa fa-trash" aria-hidden="true"></i>
											</a>&nbsp;&nbsp;
											<button type="button" class="editbutton" onclick="javascript:ColdFusion.Window.create('mywindow', 'VIEW CONTACT',
												'createcontact.cfm?view=true&id=#contactdetails[i].getid()#',{x:350,y:100,height:500,width:750,modal:false,closable:false,draggable:true,resizable:true,center:true,initshow:true,
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
    </body>
</html>

