function init(name)
			{				
				ColdFusion.Window.hide(name);
	            window.location.reload();
			}

function checkpass(){
	
	var pas1=document.getElementbyId("password1").value;
	alert(pas1);
	var pas2=document.getElementbyId("password2").value;
	if(pas1!="" && pas2!=""){
		if(pas1!=pas2){
			alert("Passwords does not match")
		}
		
	}
	
}