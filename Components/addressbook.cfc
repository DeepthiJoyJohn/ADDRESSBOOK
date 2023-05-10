<cfcomponent output="false">
    <cffunction name="login" access="public">
        <cfargument name="Uname">
        <cfargument name="Pass">
        <cfquery name="local.checklogin" datasource="addressbook">
            SELECT username FROM login where username=<cfqueryparam value="#arguments.Uname#" cfsqltype="CF_SQL_VARCHAR"> and 
            password=<cfqueryparam value="#arguments.Pass#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery> 
        <cfif local.checklogin.RecordCount GTE 1>
            <cfset session.username=local.checklogin.username>
        </cfif>
        <cfreturn local.checklogin.RecordCount>
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
        <cfquery name="local.getlastid" datasource="addressbook">
		    SELECT CASE WHEN MAX(id) IS NULL THEN 1 ELSE MAX(id)+1 END AS id FROM contactdetails
	    </cfquery>
        <cfquery name="local.createcontact" datasource="addressbook">
            insert into contactdetails (id,title,firstname,lastname,gender,dob,photo,address,
            street,email,phone) VALUES
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
            <cfqueryparam value="#form.phone#" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>        
    </cffunction>
    <cffunction name="delete" access="remote">                 
        <cfquery name="local.delete" datasource="addressbook">
			delete from contactdetails where id=<cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
        <cflocation url="../listing.cfm">
    </cffunction>
</cfcomponent>  