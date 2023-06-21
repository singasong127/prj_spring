package com.mycompany.app.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubController {
	
	@RequestMapping(value="/sub")
	public String sub() {
		return "app/sub/sub";
	}
	
	@RequestMapping(value="/sub2")
	public String sub2() {
		return "app/sub/sub2";
	}
	
}
