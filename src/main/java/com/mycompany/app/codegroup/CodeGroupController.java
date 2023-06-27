package com.mycompany.app.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CodeGroupController {
	
	@Autowired
	CodeGroupServiceImpl service;
	
	@RequestMapping(value="/cglist")
	public String dataTable(CodeGroupVo vo, Model model) {
		
		List<CodeGroup> list = service.selectList(vo);
		
//		왼쪽의 list는 jsp에서 사용할 변수명
		model.addAttribute("list", list);
		
		return "app/dataTable";
	}
	
	@RequestMapping(value="/cgform")
	public String codeGroupForm(CodeGroupVo vo, Model model) {
		CodeGroup codeGroup = service.selectOne(vo);
		
		model.addAttribute("item", codeGroup);
		
		return "app/codeGroupForm";
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
