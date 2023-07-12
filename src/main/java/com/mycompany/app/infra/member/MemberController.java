package com.mycompany.app.infra.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value = "/member")
	public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) {
		
		vo.setId(vo.getId() == null ? "" : vo.getId());
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		if(vo.getTotalRows() > 0) {
			List<Member> list = service.selectList(vo);
			model.addAttribute("list", list);
		} else {
//			by pass
		}
		
		System.out.println("emain: " + vo.getEmailDomain());
		System.out.println("gender: " + vo.getGender());
		
		return "xdm/infra/member/memberXdmList";
	}
	
	
	
	@RequestMapping(value="/signup")
  	public String signUp(@ModelAttribute("vo") MemberVo vo, Model model) { 
		Member member = service.selectOne(vo);
		
		model.addAttribute("item", member);
  
		return "usr/infra/member/signUpUsrForm"; 
	}
	 
	
	@RequestMapping(value="/signupins")
	public String signUpIns(Member dto) {
		
		service.insert(dto);
		
		System.out.println("inserted");
		
		return "redirect:/member";
	}
	
	@RequestMapping(value="/loginusr")
	public String loginUsrForm() {
		
		return "usr/infra/member/loginUsrForm";
	}
	
	@ResponseBody
	@RequestMapping("/loginProc")
	public Map<String, Object> loginProc(MemberVo vo) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Member rtMember = service.selectOneLogin(vo);
		
		System.out.println(vo.getId());
		System.out.println(vo.getPassword());
		
		if(rtMember != null) {
			returnMap.put("rtMember", rtMember);
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		
		return returnMap;
	}
	
}
