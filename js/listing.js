function init(name)
			{				
				ColdFusion.Window.hide(name);
	            window.location.reload();
			}

function checkpass(){
	 var passValue1 = document.getElementById("password1").value;
	 var passValue2 = document.getElementById("password2").value;	 
		 if((passValue1!="" && passValue2!="") || (passValue1!=null && passValue2!=null)){
		 	 if(passValue1!=passValue2){
		 		alert("Password Doesnt Match!!!");
		 	 }	
		 }	
}
