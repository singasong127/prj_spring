package com.mycompany.app.infra.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;
	
	@Override
	public int selectOneCount(MemberVo vo) {
		
		return dao.selectOneCount(vo);
	}
	
	@Override
	public List<Member> selectList(MemberVo vo) {
		
		List<Member> aaa = dao.selectList(vo);
		
		return aaa;
	}

	@Override
	public Member selectOne(MemberVo vo) {
		
		return dao.selectOne(vo);
	}

	@Override
	public int insert(Member dto) {
		
		return dao.insert(dto);
	}

	@Override
	public Member selectOneLogin(MemberVo vo) {
		
		return dao.selectOneLogin(vo);
	}


}
