<html>
    <head>
        <title>Login Form</title>
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="title">
            <img src="Images/img.png" class="image"><span> ADDRESSBOOK</span>
            <span class="spancl"><a href="registration.cfm"><i class="fa fa-upload"></i>  SignUp </a> <i class="fa fa-sign-in"></i> login</span>
        </div>
        <div class="login">
            <form id="form" name="form" method="post" action="">
                <label><b>User Name</b></label>
                <input type="text" name="Uname" id="Uname" placeholder="Username"><br><br>
                <label><b>Password</b></label>
                <input type="Password" name="Pass" id="Pass" placeholder="Password"><br><br>
                <input type="Submit" name="log" id="log" value="Log In Here">
            </form>
            <cfif isDefined("form.log")>
                <cfinvoke component="ADDRESSBOOK.Components.addressbook" method="login" 
		        Uname="#form.Uname#" Pass="#form.Pass#" returnVariable="res">
                <cfif res GTE 1>
                    <cflocation url="listing.cfm">
                <cfelse>
                    <cfoutput>Username Not found!!! Please Register and Login</cfoutput>
                </cfif> 
            </cfif>
        </div>
    </body>
</html>
