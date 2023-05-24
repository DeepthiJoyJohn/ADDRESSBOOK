<html>
	<cfif #session.userid# eq "">
		<cflocation url="login.cfm">
    </cfif>
	<head>	    
	    <title>ADDRESSBOOK</title>
	   
        <link rel="stylesheet" type="text/css" href="css/createcontact.css">
	    <link href="assets/css/style.css" rel="stylesheet">

		
	</head>
    	<cfquery name="local.generatepdf" datasource="addressbook"> 
	       SELECT firstname,email,phone,photo 
	       FROM contactdetails where createdby="#session.userid#" 
		</cfquery> 
		<cfheader name="Content-Disposition" value="attachment; filename=myDoc.pdf">
		<cfcontent type="application/pdf">	  
		<cfdocument format="PDF">
			<cfoutput>
				<table>
						<tr>
							<td style="width:120px;text-align:center;border:1px solid"><b>SL:No</b></td>
							<td style="width:200px;text-align:left;border:1px solid"><b>Name</b></td>
							<td style="width:200px;text-align:left;border:1px solid"><b>Email</b></td>
							<td style="width:150px;text-align:left;border:1px solid"><b>Phone</b></td>
						</tr>					
					    <cfset slno=1>
						<cfloop query="local.generatepdf">
							<tr>
								<td style="width:120px;text-align:center;border:1px solid">#slno#</td>
								<td style="width:200px;text-align:left;border:1px solid">#local.generatepdf.firstname#</td>
								<td style="width:200px;text-align:left;border:1px solid">#local.generatepdf.email#</td>
								<td style="width:150px;text-align:left;border:1px solid">#local.generatepdf.phone#</td>
							</tr>
							<cfset slno=slno+1>
						</cfloop>
				</table>
			</cfoutput>		
		</cfdocument>    	
    
</html>