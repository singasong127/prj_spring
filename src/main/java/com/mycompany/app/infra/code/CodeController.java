package com.mycompany.app.infra.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.app.infra.codegroup.CodeGroup;
import com.mycompany.app.infra.codegroup.CodeGroupServiceImpl;
import com.mycompany.app.infra.codegroup.CodeGroupVo;

@Controller
public class CodeController {
	
	@Autowired
	CodeServiceImpl service;
	@Autowired
	CodeGroupServiceImpl groupService;
	
	@RequestMapping(value="/cdlist")
	public String cdList(@ModelAttribute("vo") CodeVo vo, Model model) {
		
		vo.setShKeyCd(vo.getShKeyCd() == null ? "" : vo.getShKeyCd());
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		if(vo.getTotalRows() > 0) {
			List<Code> list = service.selectList(vo);
			model.addAttribute("list", list);
		} else {
//			by pass
		}
		
		return "xdm/infra/code/codeXdmList";
	}
	
//	List<Code> list = service.selectList(vo);
//	
//	model.addAttribute("list", list);
////	model.addAttribute("vo", vo);
//	
//	return "xdm/infra/code/codeXdmList";
	
	@RequestMapping(value="/cdform")
	public String codeForm(CodeVo vo, Model model, CodeGroupVo groupvo, Model groupModel) {
		Code code = service.selectOne(vo);
		model.addAttribute("item", code);
		
		List<CodeGroup> list = groupService.selectList(groupvo);
		
		groupModel.addAttribute("grouplist", list);
		
		return "xdm/infra/code/codeXdmForm";
	}
	
	@RequestMapping(value="/cdupdate")
	public String codeUpdate(Code dto) {
		
		System.out.println("Updated");
		
		service.update(dto);
		
		return "redirect:/cdlist";
	}
	
	@RequestMapping(value="/cduelect")
	public String codeUelect(Code dto) {
		
		System.out.println("Uelected");
		
		service.uelect(dto);
		
		return "redirect:/cdlist";
	}
	
	@RequestMapping(value="/cddelete")
	public String codeDelete(Code dto) {
		
		System.out.println("Deleted");
		
		service.delete(dto);
		
		return "redirect:/cdlist";
	}
	
	@RequestMapping(value="/cdinsert")
	public String codeInsert(Code dto) {
		
		System.out.println("Inserted");
		
		service.insert(dto);
		
		return "redirect:/cdlist";
	}
	
}
