<cfcomponent output="false">
	<cfset this.name="addressbook"/>
	<cfset this.applicationTimeout=createtimespan(0,1,0,0)/>
	<cfset this.datasource="addressbook"/>
	<cfset this.ormenabled = "true">
    <cfset this.ormsettings={datasource="addressbook", logsql="true"}>
	<cfset this.sessionmanagement="yes"/>
	<cfset session.username = "">
</cfcomponent>