package com.mycompany.app.infra.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "/{cgSeq}/insert", method = RequestMethod.POST)
//	@PostMapping("")
	public String insert(@RequestBody CodeGroup dto) throws Exception {
		service.insert(dto);
		return dto.getCgSeq();
	}
	
	
	@RequestMapping(value = "/{cgSeq}/put", method = RequestMethod.PUT)
//	@PatchMapping("/{cgSeq}")
//	@PutMapping("/{cgSeq}")
	public void update(@PathVariable String cgSeq, @RequestBody CodeGroup dto) throws Exception {
		dto.setCgSeq(cgSeq);
		service.update(dto);
	}
	
}
