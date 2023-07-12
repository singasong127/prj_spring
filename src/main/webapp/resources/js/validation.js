	ttest = function() {
		alert("test");
	}
	
	check = function(obj) {
		
		myRe = /^[a-zA-Z0-9]*$/;
 			
		if(myRe.test($.trim(obj.val())) == false) {
			alert("빠짐없이 입력해주세요!");
			obj.focus();
			return false;
		} else {
			// by pass
		} 
		
	}