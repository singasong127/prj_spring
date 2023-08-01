package com.mycompany.app.infra.member;

import java.util.List;

public interface MemberService {
	
	public int selectOneCount(MemberVo vo);
	public List<Member> selectList(MemberVo vo);
	
	public Member selectOne(MemberVo vo);
	
	public Member selectOneLogin(MemberVo vo);
	
	public Member loginXdm(MemberVo vo);
	
	public int insert(Member dto);
	
	public int idCheck(MemberVo vo);
	
	public int insertUploaded(Member dto);

}
