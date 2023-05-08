<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="title">
            <img src="Images/img.png" class="image"><span> ADDRESSBOOK</span>
            <span class="spancl"><a href="login.cfm"><i class="fa fa-sign-in"></i> Logout</a></span>
        </div>
        <div class="title2">
            <i class="fa fa-file-excel-o" aria-hidden="true"></i>
            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>
            <i class="fa fa-print" aria-hidden="true"></i>
        </div>
        <div class="listingsub">
            <div class="profile">
                <img class='img-thumbnail' alt='User profile picture' style="min-height:120px; max-height:120px;" 
                src='Images/dummy.jpg' >
                <span class="username"><cfoutput>#session.username#</cfoutput></span><br>
                <button class="button">Create Contact</button>
            </div>
            <div class="listing">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Email ID</th>
                            <th>Phone No</th>
                        </tr>
                    </thead>
                </table>
            </div>
            
            
        </div>
    </body>
</html>
