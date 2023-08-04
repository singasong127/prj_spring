package com.mycompany.app.infra.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest/codeGroup")
public class CodeGroupRestController {
	
	@Autowired
	CodeGroupServiceImpl service;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
//	@GetMapping("")
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception {
		
		List<CodeGroup> list = service.selectList(vo);
		
		return list;
	}
	
	@RequestMapping(value = "/{cgSeq}", method = RequestMethod.GET)
//	@GetMapping("/{cgSeq}")
	public CodeGroup selectOne(@PathVariable String cgSeq, CodeGroupVo vo) throws Exception {
		
		vo.setCgSeq(cgSeq);
		CodeGroup item = service.selectOne(vo);
		
		return item;
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
//	@PostMapping("/insert")
	public String insert(CodeGroup dto) throws Exception {
		System.out.println("getCgName : " + dto.getCgName());
		System.out.println("getDelNy : " + dto.getDelNy());
		
		service.insert(dto);
		
		return dto.getCgSeq();
	}
	
	
	@RequestMapping(value = "/{cgSeq}", method = RequestMethod.PUT)
//	@PatchMapping("/{cgSeq}")
//	@PutMapping("/{cgSeq}")
	public void update(@PathVariable String cgSeq, CodeGroup dto) throws Exception {
		dto.setCgSeq(cgSeq);
		service.update(dto);
	}
	
}
