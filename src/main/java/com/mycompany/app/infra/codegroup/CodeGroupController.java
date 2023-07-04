package com.mycompany.app.infra.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CodeGroupController {
	
	@Autowired
	CodeGroupServiceImpl service;
	
	@RequestMapping(value="/xdmindex")
	public String xdmIndex(CodeGroupVo vo, Model model) {
		
		List<CodeGroup> list = service.selectList(vo);
		
//		왼쪽의 list는 jsp에서 사용할 변수명
		model.addAttribute("list", list);
		
		return "xdm/infra/index/indexXdmView";
	}
	
	@RequestMapping(value="/cglist")
	public String codeGroupList(@ModelAttribute("vo") CodeGroupVo vo, Model model) {
		
		vo.setShKey(vo.getShKey() == null ? "" : vo.getShKey());
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		if(vo.getTotalRows() > 0) {
			List<CodeGroup> list = service.selectList(vo);
			model.addAttribute("list", list);
//			model.addAttribute("vo", vo);
		} else {
//			by pass
		}
		
		return "xdm/infra/codegroup/codeGroupXdmList";
	}
	
//	vo.setShKey(vo.getShKey() == null ? "email" : vo.getShKey());
//	
//	List<CodeGroup> list = service.selectList(vo);
//	
////	왼쪽의 list는 jsp에서 사용할 변수명
//	model.addAttribute("list", list);
////	model.addAttribute("vo", vo);
//	
//	return "xdm/infra/codegroup/codeGroupXdmList";
	
	@RequestMapping(value="/cgform")
	public String codeGroupForm(CodeGroupVo vo, Model model) {
		CodeGroup codeGroup = service.selectOne(vo);
		
		model.addAttribute("item", codeGroup);
		
		return "xdm/infra/codegroup/codeGroupForm";
	}
	
	@RequestMapping(value="/cgupdate")
	public String codeGroupUpdate(CodeGroup dto) {
		
		System.out.println("codeGroupUpdate");
		
		service.update(dto);
		
		return "redirect:/cglist";
	}
	
	@RequestMapping(value="/cguelect")
	public String codeGroupUelect(CodeGroup dto) {
		
		System.out.println("Uelect");
		
		service.uelect(dto);
		
		return "redirect:/cglist";
	}
	
	@RequestMapping(value="/cgdelete")
	public String codeGroupDelete(CodeGroup dto) {
		
		System.out.println("Deleted");
		
		service.delete(dto);
		
		return "redirect:/cglist";
	}
	
	@RequestMapping(value="/cginsert")
	public String codeGroupInsert(CodeGroup dto) {
		
		System.out.println("Inserted");
		
		service.insert(dto);
		
		return "redirect:/cglist";
	}
	
}
