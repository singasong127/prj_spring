package com.mycompany.app.infra.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value = "/member")
	public String memberList(MemberVo vo, Model model) {
		
		List<Member> list = service.selectList(vo);
		
		model.addAttribute("list", list);
		
		return "xdm/infra/member/memberXdmList";
	}
	
}
