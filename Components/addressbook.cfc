<cfcomponent output="false">
    <cffunction name="login" access="public">
        <cfargument name="Uname">
        <cfargument name="Pass">
        <cfquery name="local.checklogin" datasource="addressbook">
            SELECT username,id FROM login where username=<cfqueryparam value="#arguments.Uname#" cfsqltype="CF_SQL_VARCHAR"> and 
            password=<cfqueryparam value="#arguments.Pass#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery> 
        <cfif local.checklogin.RecordCount GTE 1>            
            <cfset local.id=local.checklogin.id>
        <cfelse>
            <cfset local.id=0>
        </cfif>
        <cfreturn local.id>
    </cffunction>
    <cffunction name="signup" access="public">
        <cfargument name="form">
        <cfquery name="local.signup" datasource="addressbook">
            SELECT username FROM login where username=
            <cfqueryparam value="#form.username #" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif local.signup.RecordCount GTE 1>   
            <cfset local.signuptxt="AlreadyExists">
        <cfelse>
        	<cfif #form.username# eq "">
				<h3>User Name cant be null</h3>
				<cfabort>
			<cfelseif #form.emailname# eq "">
		    	<h3>Email cant be null</h3>
		    	<cfabort>
			<cfelseif Form.password1 NEQ form.password2>
				<h1>Password confirmation does not match Password.</h1>
				<cfabort>
			<cfelse>
	            <cfquery name="local.getlastid" datasource="addressbook">
				    SELECT CASE WHEN MAX(id) IS NULL THEN 1 ELSE MAX(id)+1 END AS id FROM login
			    </cfquery>            
	            <cfquery name="local.signup" datasource="addressbook">
	                insert into login (id,username,password,email) VALUES
	                (<cfqueryparam value="#local.getlastid.id#" cfsqltype="CF_SQL_INTEGER">,
	                <cfqueryparam value="#form.username#" cfsqltype="CF_SQL_VARCHAR">,
	                <cfqueryparam value="#form.password1#" cfsqltype="CF_SQL_VARCHAR">,
	                <cfqueryparam value="#form.emailname#" cfsqltype="CF_SQL_VARCHAR">)
	            </cfquery>
	            <cfset local.signuptxt="Registered, please login ">
        	</cfif>
        </cfif>           
        <cfreturn local.signuptxt>
    </cffunction>
    <cffunction name="createcontact" access="public">
        <cfargument name="form"> 
        <cfset local.filename="">
        <cfif isDefined("form.photo") AND evaluate("form.photo") NEQ "" >
            <cffile action="upload" fileField="form.photo" destination="C:\Pictures" 
            accept="image/png,image/jpg,image/gif,image/jpeg"  
            nameconflict="makeunique">
            <cfset local.filename="#cffile.serverdirectory#/#cffile.serverfile#">            
   	    </cfif> 
   	    <cfif #form.title# EQ "">
   	    	<h3> Title Cant be null</h>
   	    	<cfabort>
   	    <cfelseif #form.firstname# EQ "">
   	    	<h3> Firstname Cant be null</h>
   	    	<cfabort> 
   	    <cfelseif #form.lastname# EQ "">
   	    	<h3> Lastname Cant be null</h>
   	    	<cfabort>
   	    <cfelseif #form.gender# EQ "">
   	    	<h3> Gender Cant be null</h>
   	    	<cfabort>
   	    <cfelseif #form.dob# EQ null>
   	    	<h3> DOB Cant be null</h>
   	    	<cfabort>
   	    <cfelseif #form.address# EQ "">
   	    	<h3> Address Cant be null</h>
   	    	<cfabort>
   	   <cfelseif #form.street# EQ "">
   	    	<h3> street Cant be null</h>
   	    	<cfabort>
   	   <cfelseif #form.email# EQ "">
   	    	<h3> DOB Cant be null</h>
   	    	<cfabort>
   	   <cfelseif #form.phone# EQ "">   	   
   	    	<h3> Phone Cant be null</h>
   	    	<cfabort>
   	   <cfelseif #session.userid# EQ "">
   	    	<h3> Userid Cant be null</h>
   	    	<cfabort>
   	   <cfelse>  
	        <cfquery name="local.getlastid" datasource="addressbook">
			    SELECT CASE WHEN MAX(id) IS NULL THEN 1 ELSE MAX(id)+1 END AS id FROM contactdetails
		    </cfquery>
	        <cfquery name="local.createcontact" datasource="addressbook">
	            insert into contactdetails (id,title,firstname,lastname,gender,dob,photo,address,
	            street,email,phone,createdby) VALUES
	            (<cfqueryparam value="#local.getlastid.id#" cfsqltype="CF_SQL_INTEGER">,
	            <cfqueryparam value="#form.title#" cfsqltype="CF_SQL_VARCHAR">,
	            <cfqueryparam value="#form.firstname#" cfsqltype="CF_SQL_VARCHAR">,
	            <cfqueryparam value="#form.lastname#" cfsqltype="CF_SQL_VARCHAR">,
	            <cfqueryparam value="#form.gender#" cfsqltype="CF_SQL_VARCHAR">,
	            <cfqueryparam value="#form.dob#" cfsqltype="CF_SQL_VARCHAR">,
	            <cfqueryparam value="#local.filename#" cfsqltype="CF_SQL_VARCHAR">,
	            <cfqueryparam value="#form.address#" cfsqltype="CF_SQL_VARCHAR">,
	            <cfqueryparam value="#form.street#" cfsqltype="CF_SQL_VARCHAR">,
	            <cfqueryparam value="#form.email#" cfsqltype="CF_SQL_VARCHAR">,
	            <cfqueryparam value="#form.phone#" cfsqltype="CF_SQL_VARCHAR">,
	            <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">
	            )
	        </cfquery>
		</cfif>        
    </cffunction>
    <cffunction name="updatecontact" access="public">
        <cfargument name="form"> 
        <cfset local.filename="">
        <cfif isDefined("form.photo") AND evaluate("form.photo") NEQ "" >
            <cffile action="upload" fileField="form.photo" destination="C:\Pictures" 
            accept="image/png,image/jpg,image/gif,image/jpeg"  
            nameconflict="makeunique">
            <cfset local.filename="#cffile.serverdirectory#/#cffile.serverfile#">  
        <cfelse>
        	 <cfquery name="local.getphoto" datasource="addressbook">
		    	SELECT photo FROM contactdetails where id="#form.id#"
	         </cfquery>
	         <cfset local.filename="#local.getphoto.photo#">          	          
   	    </cfif>
        <cfquery name="local.updatecontact" datasource="addressbook">
            update contactdetails set title=<cfqueryparam value="#form.title#" cfsqltype="CF_SQL_VARCHAR">,
            firstname=<cfqueryparam value="#form.firstname#" cfsqltype="CF_SQL_VARCHAR">,
            lastname=<cfqueryparam value="#form.lastname#" cfsqltype="CF_SQL_VARCHAR">,
            gender=<cfqueryparam value="#form.gender#" cfsqltype="CF_SQL_VARCHAR">,
            dob=<cfqueryparam value="#form.dob#" cfsqltype="CF_SQL_DATE">,
            photo=<cfqueryparam value="#local.filename#" cfsqltype="CF_SQL_VARCHAR">,
            address=<cfqueryparam value="#form.address#" cfsqltype="CF_SQL_VARCHAR">,
            street=<cfqueryparam value="#form.street#" cfsqltype="CF_SQL_VARCHAR">,
            email=<cfqueryparam value="#form.email#" cfsqltype="CF_SQL_VARCHAR">,
            phone=<cfqueryparam value="#form.phone#" cfsqltype="CF_SQL_VARCHAR"> where id="#form.id#"            
        </cfquery>        
    </cffunction>
    <cffunction name="delete" access="remote">                 
        <cfquery name="local.delete" datasource="addressbook">
			delete from contactdetails where id=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
        <cflocation url="../listing.cfm" addtoken="false">
    </cffunction>
    <cffunction name="generateexcel" access="remote"> 
    	<cfquery name="local.generateexcel" datasource="addressbook"> 
	       SELECT firstname,email,phone 
	       FROM contactdetails where createdby="#session.userid#" 
		</cfquery> 
		<cfscript> 		   
		    theDir=GetContextRoot(); 		    
		    theFile=theDir&"ExcelFiles/courses.xls";
		    theSheet = SpreadsheetNew("contactdata");
		    SpreadSheetAddRow(theSheet,"Name,email,phone");		  	
		    SpreadsheetAddRows(theSheet,local.generateexcel); 
		</cfscript>
		<cfspreadsheet action="write" filename="#theFile#" name="theSheet" sheetname="contactdata" overwrite=true>
		<cfspreadsheet action="read" src="#theFile#" sheet=1 rows="100-200" format="csv" name="csvData">
		<cfcontent type="application/vnd.ms-excel.sheet.macroEnabled.12" 
		file="C:\ColdFusionBuilder2018\ColdFusion\cfusion\wwwroot\ADDRESSBOOK\Components\ExcelFiles\courses.xls">        
    </cffunction> 
    <cffunction name="generatepdf" access="remote">
    	<cfargument name="savecontent" >
    	<cfdocument format="PDF">
    		<cfoutput >
    			#arguments.savecontent#
    		</cfoutput>	
    	</cfdocument> 
    </cffunction>
</cfcomponent>  