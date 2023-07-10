package com.mycompany.app.infra.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value = "/member")
	public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) {
		
		vo.setShId(vo.getShId() == null ? "" : vo.getShId());
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		if(vo.getTotalRows() > 0) {
			List<Member> list = service.selectList(vo);
			model.addAttribute("list", list);
		} else {
//			by pass
		}
		
		System.out.println("emain: " + vo.getShEmain());
		System.out.println("gender: " + vo.getShGen());
		
		return "xdm/infra/member/memberXdmList";
	}
	
	
	@RequestMapping(value="/signup")
	public String signUp(MemberVo vo, Model model) {
		Member member = service.selectOne(vo); 
		
		model.addAttribute("item", member);
		
		return "usr/infra/member/signUpUsrForm";
	}
	
	@RequestMapping(value="/signupIns")
	public String signUpIns(Member dto) {
		
		service.insert(dto);
		
		System.out.println("inserted");
		
		return "redirect:/member";
	}
}
