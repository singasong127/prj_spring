package com.mycompany.app.infra.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	CodeDao dao;

	@Override
	public List<Code> selectList(CodeVo vo) {
		
		List<Code> bbb = dao.selectList(vo);
		
		return bbb;
	}
	
	@Override
	public Code selectOne(CodeVo vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int update(Code dto) {
		return dao.update(dto);
	}

	@Override
	public int uelect(Code dto) {
		return dao.uelect(dto);
	}

	@Override
	public int delete(Code dto) {
		return dao.delete(dto);
	}

	@Override
	public int insert(Code dto) {
		return dao.insert(dto);
	}
	
	

}
