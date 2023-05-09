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
                  
        <cfreturn local.signuptxt>
    </cffunction>
</cfcomponent>  