function generateexcel(){	
	
	$(document).ready(function(){			
				$.ajax({
					type: "GET",
					url: '../ADDRESSBOOK/Components/addressbook.cfc?method=generateexcel',
					cache: false,
					success: function(data){						
						
					},
				});
		
	});
}
	  

