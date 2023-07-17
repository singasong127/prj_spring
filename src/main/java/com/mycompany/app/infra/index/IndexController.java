package com.mycompany.app.infra.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	/*
	 * @RequestMapping(value="/") public String home(String href) {
	 * 
	 * // 여기에서 서버단에서 필요한 작업을 수행한다.
	 * 
	 * href="/resources/assets/css/style.css"; href="/resources/assets/js/main.js";
	 * href="/resources/assets/img/portfolio_bg.png"; href=
	 * "/resources/assets/img/vector-flat-illustration-software-developer-cyber-program-security_776789-207.avif";
	 * 
	 * // 아래의 jsp 파일 호출 return "home"; }
	 */
	
	@RequestMapping(value="/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("home");
		
		return mav;
	}
	
	
	@RequestMapping(value="/user")
	public ModelAndView user() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("usr/infra/index/indexUsrView");
		
		return mav;
	}
	
	/*
	 * @RequestMapping(value="/loginxdmin") public ModelAndView loginXdmin() {
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * mav.setViewName("xdm/infra/member/loginXdmForm");
	 * 
	 * return mav; }
	 */
	
	@RequestMapping("/team")
	public ModelAndView team() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("team/usr/index/indexUsrView");
		
		return mav;
	}
	
}


