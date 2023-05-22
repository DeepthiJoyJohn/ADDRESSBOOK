window.onunload = refreshParent;
    function refreshParent() {
        window.opener.location.reload();
		window.close();
    }
function validate(){
	 var passValue1 = document.getElementById("password1").value;
	 var passValue2 = document.getElementById("password2").value;
		 if((passValue1!="" && passValue2!="") || (passValue1!=null && passValue2!=null)){
		 	 if(passValue1!=passValue2){
		 		document.getElementById("message").innerHTML="PASSWORDS NOT MATCHING!!";
		 		document.getElementById("message").style.color="red";
		 	 }else{
		 	 	document.getElementById("message").innerHTML="";
		 	 }	
		 }
		 
}
function validateemail(){
	var emailname = document.getElementById("emailname").value;	
		if(emailname=="" || emailname==null){
			 
				document.getElementById("emailspan").innerHTML="EMAIL CANT BR NULL!!";
				document.getElementById("emailspan").style.color="red";
		}else{
				 document.getElementById("emailspan").innerHTML="";
	    }	
		
		
}
function passwordnullcheck(){
	 var passValue1 = document.getElementById("Pass").value;
	 var Uname = document.getElementById("Uname").value;	 
		 if((passValue1=="" || passValue1==null) && (Uname=="" || Uname==null)){
		 	    document.getElementById("message").innerHTML="USERNAME AND PASSWORD CAN'T BE NULL";
		 		document.getElementById("message").style.color="red";
		 }else if(passValue1=="" || passValue1==null){
		 	    document.getElementById("message").innerHTML="PASSWORD CAN'T BE NULL";
		 		document.getElementById("message").style.color="red";
		 }else if(Uname=="" || Uname==null){
		 	    document.getElementById("message").innerHTML="USERNAME CAN'T BE NULL";
		 		document.getElementById("message").style.color="red";
		 }
		 
}
function testbox(value) {
	var passValue1 = document.getElementById("phone").value;	
	if (isNaN(passValue1)) 
	{
		alert ("phone No should be No");
		document.getElementById("phone").value="";
	} 
	else
	{
		return (true);
	} 
}