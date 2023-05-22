<cfcomponent output="false">
    <cffunction name="login" access="public">
        <cfargument name="Uname">
        <cfargument name="Pass">
        <cftry>
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
	         <cfcatch type="any">
				  <p><strong>Apologies, an error has occurred. 
					Please try again later.<strong><p>
			 </cfcatch>
        </cftry>
    </cffunction>
    <cffunction name="signup" access="public">
        <cfargument name="form">
		<cfset local.structregistration=StructNew()>
		<cfset value=StructInsert(local.structregistration, "outputspan", "Registered, please login")>
		<cfset value=StructInsert(local.structregistration, "usernamespan", "")> 
		<cfset value=StructInsert(local.structregistration, "emailspan", "")>
		<cfset value=StructInsert(local.structregistration, "passwordspan", "")>					            
        <cfquery name="local.signup" datasource="addressbook">
            SELECT username FROM login where username=
            <cfqueryparam value="#form.username #" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif local.signup.RecordCount GTE 1>  
		    <cfif not structKeyExists(local.structregistration,"username")>
            	<cfset value=StructUpdate(local.structregistration, "outputspan", "AlreadyExists")> 
			<cfelse>
					<cfset value=StructUpdate(local.structregistration, "outputspan", "")> 
			</cfif> 
        <cfelse>
        	<cfif #form.username# eq "">
				<cfset value=StructUpdate(local.structregistration, "usernamespan", "User Name cant be null")>
				<cfset value=StructUpdate(local.structregistration, "outputspan", "")> 				
			<cfelseif #form.emailname# eq "">
				<cfset value=StructUpdate(local.structregistration, "emailspan", "Email cant be null")>
				<cfset value=StructUpdate(local.structregistration, "outputspan", "")>
			<cfelseif Form.password1 NEQ form.password2>				
				<cfset value=StructUpdate(local.structregistration, "passwordspan", "Password confirmation does not match Password")>
				<cfset value=StructUpdate(local.structregistration, "outputspan", "")>
			<cfelse>	                        
	            <cfquery name="local.signup" datasource="addressbook">
	                insert into login (id,username,password,email) VALUES
	                (id,<cfqueryparam value="#form.username#" cfsqltype="CF_SQL_VARCHAR">,
	                <cfqueryparam value="#form.password1#" cfsqltype="CF_SQL_VARCHAR">,
	                <cfqueryparam value="#form.emailname#" cfsqltype="CF_SQL_VARCHAR">)
	            </cfquery>
			    <cfset value=StructUpdate(local.structregistration, "outputspan", "Registered Please Login")>
        	</cfif>
        </cfif>           
        <cfreturn local.structregistration>
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
		<cfset local.structcreatecontact=StructNew()>
		<cfset value=StructInsert(local.structcreatecontact, "titlemssg", "")>
		<cfset value=StructInsert(local.structcreatecontact, "firstnamemssg", "")>
		<cfset value=StructInsert(local.structcreatecontact, "lastnamemssg", "")>
		<cfset value=StructInsert(local.structcreatecontact, "dobmssg", "")>
		<cfset value=StructInsert(local.structcreatecontact, "addressmssg", "")>
		<cfset value=StructInsert(local.structcreatecontact, "streetmssg", "")>
		<cfset value=StructInsert(local.structcreatecontact, "emailmssg", "")>
		<cfset value=StructInsert(local.structcreatecontact, "phonemssg", "")>
		<cfset value=StructInsert(local.structcreatecontact, "useridmssg", "")>
		<cfset value=StructInsert(local.structcreatecontact, "gendermssg", "")>
   	    <cfif #form.title# EQ "">
   	    	<cfset value=StructUpdate(local.structcreatecontact, "titlemssg", "Title cant be null")>
   	    <cfelseif #form.firstname# EQ "">   	    	
   	    	<cfset value=StructUpdate(local.structcreatecontact, "firstnamemssg", "Firstname Cant be null")>
   	    <cfelseif #form.lastname# EQ "">
   	    	<cfset value=StructUpdate(local.structcreatecontact, "lastnamemssg", "Lastname Cant be null")>
   	    <cfelseif #form.gender# EQ "">
   	    	<cfset value=StructUpdate(local.structcreatecontact, "gendermssg", "Lastname Cant be null")>
   	    <cfelseif #form.dob# EQ "">
   	    	<cfset value=StructUpdate(local.structcreatecontact, "dobmssg", "DOB Cant be null")>
   	    <cfelseif #form.address# EQ "">
   	    	<cfset value=StructUpdate(local.structcreatecontact, "addressmssg", "DOB Cant be null")>
   	   <cfelseif #form.street# EQ "">
   	    	<cfset value=StructUpdate(local.structcreatecontact, "streetmssg", "DOB Cant be null")>
   	   <cfelseif #form.email# EQ "">
   	    	<cfset value=StructUpdate(local.structcreatecontact, "emailmssg", "Email Cant be null")>
   	   <cfelseif #form.phone# EQ "">   	   
   	    	<cfset value=StructUpdate(local.structcreatecontact, "phonemssg", "Phone Cant be null")>
   	   <cfelseif #session.userid# EQ "">
   	    	<cfset value=StructUpdate(local.structcreatecontact, "useridmssg", "Phone Cant be null")>
   	   <cfelse>  	        
	        <cfquery name="local.createcontact" datasource="addressbook">
	            insert into contactdetails (id,title,firstname,lastname,gender,dob,photo,address,
	            street,email,phone,createdby) VALUES
	            (id,
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
    	<cfquery name="local.generatepdf" datasource="addressbook"> 
	       SELECT firstname,email,phone,photo 
	       FROM contactdetails where createdby="#session.userid#" 
		</cfquery> 
    	<cfreturn local.generatepdf>
    </cffunction>
</cfcomponent>  