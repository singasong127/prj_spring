	ttest = function() {
		alert("test");
	}
	
	check = function(param) {
		
		myRe = /^[a-zA-Z0-9]*$/;
 			
		if(myRe.test($.trim(param)) == false || !null) {
			alert("공백없는 숫자와 대소문자");
			$("#cgName").focus();
			return false;
		} else {
			// by pass
		} 
		
	}