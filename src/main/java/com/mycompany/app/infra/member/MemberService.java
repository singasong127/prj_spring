package com.mycompany.app.infra.member;

import java.util.List;

public interface MemberService {
	
	public List<Member> selectList(MemberVo vo);
	
	public Member selectOne(MemberVo vo);

}
