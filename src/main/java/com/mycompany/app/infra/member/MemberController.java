package com.mycompany.app.infra.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.app.infra.index.CurrentDateTime;

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
		
		System.out.println("nickname: " + vo.getNickname());
		System.out.println("emain: " + vo.getEmailDomain());
		System.out.println("gender: " + vo.getGender());
		
		return "xdm/infra/member/memberXdmList";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(MemberVo vo, Member dto, Model model, HttpSession session) throws Exception {
		vo.setId((String)session.getAttribute("sessionId"));
		
		System.out.println("sessionId: " + vo.getId());
		
		Member member = service.selectOneProfile(vo);
		model.addAttribute("mem", member);
		
		List<Member> uploadList = service.selectListUpload(dto);
		model.addAttribute("listUploaded",uploadList);
		
		return "usr/infra/member/profileUsrForm";
	}
	
	@RequestMapping(value = "/profile/update", method = RequestMethod.POST)
	public String updtProfile(Member dto, MemberVo vo) throws Exception {
		if(vo.getId() == null) {
			vo.setId(dto.getId());
		} else {
			dto.setPassword(vo.getPassword());
		}
		System.out.println("update password: " + vo.getPassword());
		
		service.updtProfile(dto);
		
		return "redirect:/user";
	}
	
	@RequestMapping(value="/signup")
  	public String signUp(@ModelAttribute("vo") MemberVo vo, Model model) { 
		Member member = service.selectOne(vo);
		
		model.addAttribute("item", member);
  
		return "usr/infra/member/signUpUsrForm"; 
	}
	 
	
	@RequestMapping(value="/signupins")
	public String signUpIns(Member dto, CurrentDateTime dt) {
		dto.setAgreeDT(dt.getNowDt());
		service.insert(dto);
		
		System.out.println("inserted");
		
		return "redirect:/member";
	}
	
	@RequestMapping(value="/loginusr")
	public String loginUsrForm() {
		
		return "usr/infra/member/loginUsrForm";
	}
	
	@RequestMapping("/loginxdm")
	public String loginXdmForm() {
		return "xdm/infra/member/loginXdmForm";
	}
	
	@ResponseBody
	@RequestMapping("/loginProc")
	public Map<String, Object> loginProc(MemberVo vo, HttpSession httpSession) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Member rtMember = service.selectOneLogin(vo);
		
		System.out.println("id: " + vo.getId());
		System.out.println("password: " + vo.getPassword());
		
		if(rtMember != null) {
			
			httpSession.setMaxInactiveInterval(60*120);
			httpSession.setAttribute("sessionId", vo.getId());
			
			returnMap.put("rtMember", rtMember);
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping("/loginXdmProc")
	public Map<String, Object> loginXdmProc(MemberVo vo, HttpSession httpSession) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Member rtMember = service.loginXdm(vo);
		
		System.out.println("id: " + vo.getId());
		System.out.println("password: " + vo.getPassword());
		
		if(rtMember != null) {
			
			httpSession.setMaxInactiveInterval(60*120);
			httpSession.setAttribute("sessionId", vo.getId());
			
			returnMap.put("rtMember", rtMember);
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping("/logoutUsrProc")
	public Map<String, Object> logoutUsrProc(MemberVo vo, HttpSession httpSession) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		httpSession.invalidate();
		returnMap.put("rt", "success");
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping("/logoutXdmProc")
	public Map<String, Object> logoutXdmProc(MemberVo vo, HttpSession httpSession) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		httpSession.invalidate();
		
		returnMap.put("rt", "success");
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping("/signup/idCheck")
	public Map<String, Object> idCheck(MemberVo vo) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int rt = service.idCheck(vo);
		
		if(rt == 0) {
			returnMap.put("rt", "available");
		} else {
			returnMap.put("rt", "unavailable");
		}
		
		return returnMap;
	}
	
	
}
