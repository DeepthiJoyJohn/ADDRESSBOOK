<cfcomponent persistent="true" table="contactdetails" entityname="contactdetails"> 
	<cfproperty name="id" column = "id" generator="increment"> 
	<cfproperty name="title"> 
	<cfproperty name="firstname"> 
	<cfproperty name="lastname"> 
	<cfproperty name="gender"> 
	<cfproperty name="dob"> 
	<cfproperty name="photo"> 
	<cfproperty name="address"> 
	<cfproperty name="street"> 
	<cfproperty name="email"> 
	<cfproperty name="phone"> 
</cfcomponent>