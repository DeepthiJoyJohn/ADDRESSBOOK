<cfcomponent output="false">
	<cfset this.name="addressbook"/>
	<cfset this.applicationTimeout=createtimespan(0,1,0,0)/>
	<cfset this.datasource="addressbook"/>
	<cfset this.ormenabled = "true">
    <cfset this.ormsettings={datasource="addressbook", logsql="true"}>
	<cfset this.sessionmanagement="yes"/>
	<!--<cfset this.SetClientCookies = false/>-->
	<cfset session.username = "">
	<cfset session.userid = "">
	<!--<cffunction
		name="OnSessionStart"
		access="public"
		returntype="void"
		output="false"
		hint="Runs when the session starts.">		
		<cfset var LOCAL = StructNew() />		
		<cfset LOCAL.EncryptedID = Encrypt(
			"#SESSION.CFID#,#SESSION.CFTOKEN#",
			"nice-butt!",
			"CFMX_COMPAT",
			"HEX"
			) />		
		<cfcookie
			name="ID"
			value="#LOCAL.EncryptedID#"
			expires="NEVER"
			/>
		<cfreturn />
	</cffunction>-->
</cfcomponent>