<cfcomponent output="false">
	<cfset this.name="addressbook"/>
	<cfset this.applicationTimeout=createtimespan(0,1,0,0)/>
	<cfset this.datasource="addressbook"/>
	<cfset this.ormenabled = "true">
    <cfset this.ormsettings={datasource="addressbook", logsql="true"}>
	<cfset this.sessionmanagement="yes"/>	
	<cfset this.scriptprotect="all"/>
	<cfset this.SetClientCookies = "yes"/>
	<cfset session.username = "">
	<cfset session.userid = "">
	
	
	<cffunction name="OnRequest" access="public" returntype="boolean" output="true"	hint="Executes the requested ColdFusion template.">	
		<cfargument name="TargetPage" type="string" required="true" hint="The requested ColdFusion template."/>		
			<cfinclude template="#ARGUMENTS.TargetPage#">
			<cfif #cgi.HTTP_REFERER# EQ "" && #session.username# EQ "">				
				<script language="javascript">
				     window.location.href="login.cfm";
				</script>			 
			</cfif>
	<cfreturn true />
    </cffunction>	
</cfcomponent>